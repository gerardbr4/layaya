// POST /api/contact — envia el formulari de contacte per correu (SMTP de Migadu)
//
// Secret necessari a Cloudflare Pages (projecte "layaya"):
//   SMTP_PASS  → contrasenya de la bústia webform@adnoba.com
// Opcionals: SMTP_USER (per defecte = FROM), SMTP_HOST (per defecte smtp.migadu.com)

import { connect } from 'cloudflare:sockets';

const FROM = 'webform@adnoba.com';
const FROM_NAME = 'Web Layaya';
const TO = ['marketfoodlleida@gmail.com', 'compras@layaya.es'];

const TYPES: Record<string, string> = {
  comercial: 'Informació comercial',
  profesionals: 'Producte per a professionals',
  botigues: 'Botigues',
  distribucio: 'Distribució',
  altres: 'Altres',
};

const EMAIL_RE = /^[^\s@<>"]+@[^\s@<>"]+\.[^\s@<>"]+$/;

export async function onRequestPost({ request, env }: { request: Request; env: any }) {
  let data: Record<string, unknown>;
  try {
    const ct = request.headers.get('content-type') || '';
    data = ct.includes('application/json')
      ? await request.json()
      : Object.fromEntries(await request.formData());
  } catch {
    return json({ ok: false, error: 'bad_request' }, 400);
  }

  const field = (k: string, max: number) =>
    String(data[k] ?? '').replace(/\r\n?/g, '\n').trim().slice(0, max);

  // Honeypot: els bots omplen aquest camp ocult; responem OK sense enviar res
  if (field('website', 200)) return json({ ok: true });

  const name = field('name', 200).replace(/\n/g, ' ');
  const company = field('company', 200).replace(/\n/g, ' ');
  const email = field('email', 254);
  const phone = field('phone', 50).replace(/\n/g, ' ');
  const type = field('type', 50);
  const message = field('message', 5000);
  const lang = field('lang', 5) === 'es' ? 'es' : 'ca';

  if (!name || !message || !EMAIL_RE.test(email)) {
    return json({ ok: false, error: 'invalid' }, 400);
  }
  if (!env.SMTP_PASS) {
    console.error('contact: falta el secret SMTP_PASS');
    return json({ ok: false, error: 'not_configured' }, 500);
  }

  const text = [
    'Nova consulta des del formulari de contacte de layaya.es',
    '',
    `Nom:       ${name}`,
    `Empresa:   ${company || '-'}`,
    `Correu:    ${email}`,
    `Telèfon:   ${phone || '-'}`,
    `Tipus:     ${TYPES[type] || '-'}`,
    `Idioma:    ${lang === 'es' ? 'Castellà' : 'Català'}`,
    '',
    'Missatge:',
    message,
    '',
    '—',
    'Per respondre, contesta directament aquest correu (s\'enviarà a l\'adreça del client).',
  ].join('\n');

  try {
    await withTimeout(
      sendMail(env, {
        replyTo: { name, email },
        subject: `Consulta web Layaya - ${name}`,
        text,
      }),
      20000,
    );
    return json({ ok: true });
  } catch (err) {
    console.error('contact: error SMTP', err instanceof Error ? err.message : err);
    return json({ ok: false, error: 'send_failed' }, 502);
  }
}

export function onRequest() {
  return json({ ok: false, error: 'method_not_allowed' }, 405);
}

// ── Helpers ────────────────────────────────────────────────────────────────

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'content-type': 'application/json; charset=utf-8', 'cache-control': 'no-store' },
  });
}

function withTimeout<T>(p: Promise<T>, ms: number): Promise<T> {
  return Promise.race([
    p,
    new Promise<T>((_, rej) => setTimeout(() => rej(new Error('timeout')), ms)),
  ]);
}

function b64(str: string) {
  const bytes = new TextEncoder().encode(str);
  let bin = '';
  for (let i = 0; i < bytes.length; i++) bin += String.fromCharCode(bytes[i]);
  return btoa(bin);
}

const encWord = (s: string) => `=?UTF-8?B?${b64(s)}?=`;

function buildMessage(opts: { replyTo: { name: string; email: string }; subject: string; text: string }) {
  const body = (b64(opts.text).match(/.{1,76}/g) || []).join('\r\n');
  return [
    `From: ${encWord(FROM_NAME)} <${FROM}>`,
    `To: ${TO.join(', ')}`,
    `Reply-To: ${encWord(opts.replyTo.name)} <${opts.replyTo.email}>`,
    `Subject: ${encWord(opts.subject)}`,
    `Date: ${new Date().toUTCString().replace('GMT', '+0000')}`,
    `Message-ID: <${crypto.randomUUID()}@adnoba.com>`,
    'MIME-Version: 1.0',
    'Content-Type: text/plain; charset=UTF-8',
    'Content-Transfer-Encoding: base64',
    '',
    body,
  ].join('\r\n');
}

// Client SMTP mínim (TLS implícit, port 465, AUTH PLAIN)
async function sendMail(env: any, opts: { replyTo: { name: string; email: string }; subject: string; text: string }) {
  const user = env.SMTP_USER || FROM;
  const socket = connect(
    { hostname: env.SMTP_HOST || 'smtp.migadu.com', port: 465 },
    { secureTransport: 'on' },
  );
  const writer = socket.writable.getWriter();
  const reader = socket.readable.getReader();
  const enc = new TextEncoder();
  const dec = new TextDecoder();
  let buf = '';

  const send = (line: string) => writer.write(enc.encode(line + '\r\n'));

  async function expect(code: number) {
    const lines: string[] = [];
    for (;;) {
      let i: number;
      while ((i = buf.indexOf('\r\n')) < 0) {
        const { value, done } = await reader.read();
        if (done) throw new Error('SMTP: connexió tancada');
        buf += dec.decode(value, { stream: true });
      }
      const line = buf.slice(0, i);
      buf = buf.slice(i + 2);
      lines.push(line);
      if (line.length < 4 || line[3] !== '-') break; // última línia de la resposta
    }
    const got = parseInt(lines[lines.length - 1].slice(0, 3), 10);
    if (got !== code) throw new Error(`SMTP: esperava ${code}, rebut "${lines.join(' | ')}"`);
  }

  try {
    await expect(220);
    await send('EHLO layaya.es');
    await expect(250);
    await send('AUTH PLAIN ' + b64('\0' + user + '\0' + env.SMTP_PASS));
    await expect(235);
    await send(`MAIL FROM:<${FROM}>`);
    await expect(250);
    for (const rcpt of TO) {
      await send(`RCPT TO:<${rcpt}>`);
      await expect(250);
    }
    await send('DATA');
    await expect(354);
    await send(buildMessage(opts) + '\r\n.');
    await expect(250);
    await send('QUIT');
  } finally {
    try { await socket.close(); } catch { /* ignore */ }
  }
}
