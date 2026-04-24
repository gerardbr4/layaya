/* ============================================================
   LA IAIA — main.js
   Cursor · Navbar · Hero animations · Language · Products
   Quality · Counters · Scroll reveal · Form
   ============================================================ */

const FLAGS = {
  ca: 'https://flagcdn.com/w20/es-ct.png',
  es: 'https://flagcdn.com/w20/es.png',
  en: 'https://flagcdn.com/w20/gb.png'
};

let lang      = localStorage.getItem('la-iaia-lang') || 'ca';
let langData  = null;
let slideTimer = null;
let slideIdx   = 0;

/* ── BOOT ─────────────────────────────────────────────────── */
document.addEventListener('DOMContentLoaded', () => {
  initCursor();
  initNavbar();
  initScrollReveal();
  buildLangSwitcher();
  loadLang(lang);
  initContactForm();
});

/* ── CURSOR ───────────────────────────────────────────────── */
function initCursor() {
  const dot   = document.getElementById('cursor');
  const trail = document.getElementById('cursorTrail');
  if (!dot || !trail || window.matchMedia('(hover: none)').matches) return;

  let tx = 0, ty = 0, rx = 0, ry = 0;

  document.addEventListener('mousemove', e => {
    tx = e.clientX; ty = e.clientY;
    dot.style.left   = tx + 'px';
    dot.style.top    = ty + 'px';
  });

  function followTrail() {
    rx += (tx - rx) * 0.12;
    ry += (ty - ry) * 0.12;
    trail.style.left = rx + 'px';
    trail.style.top  = ry + 'px';
    requestAnimationFrame(followTrail);
  }
  followTrail();

  document.querySelectorAll('a, button, .hero-img-wrap, .strip-item, .qual-card, .linia-card').forEach(el => {
    el.addEventListener('mouseenter', () => dot.classList.add('hovering'));
    el.addEventListener('mouseleave', () => dot.classList.remove('hovering'));
  });
}

/* ── NAVBAR ───────────────────────────────────────────────── */
function initNavbar() {
  const nav    = document.getElementById('mainNav');
  const toggle = document.getElementById('navToggle');
  const menu   = document.getElementById('navMenu');

  const onScroll = () => nav.classList.toggle('scrolled', window.scrollY > 60);
  window.addEventListener('scroll', onScroll, { passive: true });
  onScroll();

  toggle?.addEventListener('click', () => {
    const open = menu.classList.toggle('open');
    toggle.classList.toggle('open', open);
    toggle.setAttribute('aria-expanded', open);
  });

  document.querySelectorAll('.nav-links a').forEach(link => {
    link.addEventListener('click', () => {
      menu.classList.remove('open');
      toggle?.classList.remove('open');
    });
  });

  /* Scrollspy */
  const sections = document.querySelectorAll('section[id]');
  const spyObs = new IntersectionObserver(entries => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        document.querySelectorAll('.nav-links a').forEach(a => {
          a.classList.toggle('active', a.getAttribute('href') === '#' + e.target.id);
        });
      }
    });
  }, { threshold: 0.35 });
  sections.forEach(s => spyObs.observe(s));
}

/* ── SCROLL REVEAL ────────────────────────────────────────── */
function initScrollReveal() {
  const obs = new IntersectionObserver(entries => {
    entries.forEach((entry, i) => {
      if (entry.isIntersecting) {
        setTimeout(() => entry.target.classList.add('visible'), i * 80);
        obs.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });

  document.querySelectorAll('.reveal').forEach(el => obs.observe(el));
}

/* ── LANGUAGE ─────────────────────────────────────────────── */
function buildLangSwitcher() {
  const container = document.getElementById('langSwitcher');
  if (!container) return;
  container.innerHTML = '';
  Object.keys(FLAGS).forEach(code => {
    const btn = document.createElement('button');
    btn.className = 'lang-btn' + (code === lang ? ' active' : '');
    btn.dataset.lang = code;
    btn.setAttribute('aria-label', code.toUpperCase());
    btn.innerHTML = `<img src="${FLAGS[code]}" alt="${code.toUpperCase()}"> ${code.toUpperCase()}`;
    btn.addEventListener('click', () => loadLang(code));
    container.appendChild(btn);
  });
}

async function loadLang(code) {
  try {
    const res  = await fetch(`lang/${code}.json?v=${Date.now()}`);
    langData   = await res.json();
    lang       = code;
    localStorage.setItem('la-iaia-lang', code);
    document.documentElement.lang = code;
    document.title = langData.meta.title;
    applyTranslations(langData);
    renderHeroHeadline(langData.hero.title);
    initSlider(langData.hero.slides);
    renderLiniasItems(langData.linies);
    renderProducts(langData.productes.categories);
    renderQualitat(langData.qualitat.items);
    renderContactSelect(langData.contacte.form);
    document.querySelectorAll('.lang-btn').forEach(b =>
      b.classList.toggle('active', b.dataset.lang === code));
  } catch (e) {
    console.error('Language load failed:', code, e);
  }
}

function applyTranslations(data) {
  document.querySelectorAll('[data-i18n]').forEach(el => {
    const val = deepGet(data, el.dataset.i18n);
    if (val !== undefined) el.innerHTML = val;
  });
  document.querySelectorAll('[data-i18n-placeholder]').forEach(el => {
    const val = deepGet(data, el.dataset.i18nPlaceholder);
    if (val !== undefined) el.placeholder = val;
  });
}

function deepGet(obj, path) {
  return path.split('.').reduce((o, k) => (o && o[k] !== undefined ? o[k] : undefined), obj);
}

/* ── HERO HEADLINE (word reveal) ──────────────────────────── */
function renderHeroHeadline(text) {
  const el = document.getElementById('heroHeadline');
  if (!el) return;
  const words = text.split(' ');
  el.innerHTML = words.map((word, i) => {
    const isHighlight = ['sempre,', 'always,', 'siempre,'].includes(word.toLowerCase());
    return `<span class="word${isHighlight ? ' highlight' : ''}">
      <span class="word-inner" style="animation-delay:${0.6 + i * 0.09}s">${word}</span>
    </span>`;
  }).join(' ');
}

/* ── CLAIMS SLIDER ────────────────────────────────────────── */
function initSlider(slides) {
  clearInterval(slideTimer);
  slideIdx = 0;
  const el = document.getElementById('claimText');
  if (!el || !slides?.length) return;

  el.innerHTML = slides[0];

  slideTimer = setInterval(() => {
    el.classList.add('fading');
    setTimeout(() => {
      slideIdx = (slideIdx + 1) % slides.length;
      el.innerHTML = slides[slideIdx];
      el.classList.remove('fading');
    }, 600);
  }, 4500);
}

/* ── HERO PARALLAX ────────────────────────────────────────── */
function initParallax() {
  const right = document.getElementById('heroRight');
  if (!right) return;
  const imgs = right.querySelectorAll('.hero-img-wrap');

  window.addEventListener('scroll', () => {
    const scrollY = window.scrollY;
    if (scrollY > window.innerHeight * 1.5) return;
    imgs.forEach((img, i) => {
      const dir = i % 2 === 0 ? 1 : -1;
      img.style.transform = `translateY(${scrollY * 0.04 * dir}px) scale(1)`;
    });
  }, { passive: true });
}

/* ── BUSINESS LINES ───────────────────────────────────────── */
function renderLiniasItems(linies) {
  renderListItems('liniaAlimItems', linies.alimentacio.items);
  renderListItems('liniaBotigaItems', linies.botigues.items);
}

function renderListItems(id, items) {
  const ul = document.getElementById(id);
  if (!ul || !items) return;
  ul.innerHTML = items.map(item => `<li>${item}</li>`).join('');
}

/* ── PRODUCTS ─────────────────────────────────────────────── */
function renderProducts(categories) {
  const stripEl   = document.getElementById('productsStrip');
  const navEl     = document.getElementById('productsNav');
  const contentEl = document.getElementById('productsContent');
  if (!stripEl || !navEl || !contentEl) return;

  const imgCats = categories.filter(c => c.image);

  /* Featured strip */
  stripEl.innerHTML = imgCats.map(cat => `
    <div class="strip-item" data-cat="${cat.id}">
      <img src="${cat.image}" alt="${cat.name}" loading="lazy">
      <div class="strip-item-label">${cat.name}</div>
    </div>
  `).join('');

  /* Tabs */
  navEl.innerHTML = categories.map((cat, i) => `
    <button class="prod-tab${i === 0 ? ' active' : ''}" data-cat="${cat.id}">
      <i class="bi ${cat.icon}"></i> ${cat.name}
    </button>
  `).join('');

  /* Panes */
  contentEl.innerHTML = categories.map((cat, i) => {
    const hasImg  = !!cat.image;
    const listClass = hasImg ? 'prod-pane-list' : 'prod-pane-list prod-pane-list-full';
    const items   = cat.items.map(item => `<div class="prod-item">${item}</div>`).join('');
    const imgHtml = hasImg
      ? `<div class="prod-pane-img"><img src="${cat.image}" alt="${cat.name}" loading="lazy"></div>`
      : '';

    return `
      <div class="prod-pane${i === 0 ? ' active' : ''}" id="pane-${cat.id}">
        <div class="prod-pane-inner ${hasImg ? '' : 'no-img'}">
          ${imgHtml}
          <div class="${listClass}">${items}</div>
        </div>
      </div>`;
  }).join('');

  /* Tab click */
  navEl.querySelectorAll('.prod-tab').forEach(btn => {
    btn.addEventListener('click', () => {
      navEl.querySelectorAll('.prod-tab').forEach(b => b.classList.remove('active'));
      contentEl.querySelectorAll('.prod-pane').forEach(p => p.classList.remove('active'));
      stripEl.querySelectorAll('.strip-item').forEach(s => s.classList.remove('active'));
      btn.classList.add('active');
      document.getElementById(`pane-${btn.dataset.cat}`)?.classList.add('active');
      stripEl.querySelector(`[data-cat="${btn.dataset.cat}"]`)?.classList.add('active');
    });
  });

  /* Strip click */
  stripEl.querySelectorAll('.strip-item').forEach(item => {
    item.addEventListener('click', () => {
      navEl.querySelector(`[data-cat="${item.dataset.cat}"]`)?.click();
    });
  });

  /* Highlight strip item matching active tab */
  if (imgCats[0]) {
    stripEl.querySelector(`[data-cat="${imgCats[0].id}"]`)?.classList.add('active');
  }
}

/* ── QUALITAT ─────────────────────────────────────────────── */
function renderQualitat(items) {
  const grid = document.getElementById('qualitatGrid');
  if (!grid || !items) return;
  grid.innerHTML = items.map(item => `
    <div class="qual-card reveal">
      <i class="bi ${item.icon}"></i>
      <h4>${item.title}</h4>
      <p>${item.text}</p>
    </div>
  `).join('');

  /* Re-observe new cards */
  const obs = new IntersectionObserver((entries) => {
    entries.forEach((entry, i) => {
      if (entry.isIntersecting) {
        setTimeout(() => entry.target.classList.add('visible'), i * 110);
        obs.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });
  grid.querySelectorAll('.qual-card').forEach(c => obs.observe(c));
}

/* ── COUNTERS ─────────────────────────────────────────────── */
function initCounters() {
  const counters = document.querySelectorAll('.stat-num[data-target-num]');
  if (!counters.length) return;

  const obs = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (!entry.isIntersecting) return;
      const el      = entry.target;
      const target  = +el.dataset.targetNum;
      const suffix  = el.dataset.targetSuffix || '';
      const dur     = 1800;
      const start   = performance.now();

      function step(now) {
        const p    = Math.min((now - start) / dur, 1);
        const ease = 1 - Math.pow(1 - p, 4);
        el.textContent = Math.round(ease * target) + suffix;
        if (p < 1) requestAnimationFrame(step);
      }
      requestAnimationFrame(step);
      obs.unobserve(el);
    });
  }, { threshold: 0.5 });

  counters.forEach(c => obs.observe(c));
}

/* ── MAGNETIC BUTTONS ─────────────────────────────────────── */
function initMagnetic() {
  document.querySelectorAll('.magnetic').forEach(btn => {
    btn.addEventListener('mousemove', e => {
      const r = btn.getBoundingClientRect();
      const x = (e.clientX - r.left - r.width  / 2) * 0.22;
      const y = (e.clientY - r.top  - r.height / 2) * 0.22;
      btn.style.transform = `translate(${x}px, ${y}px)`;
    });
    btn.addEventListener('mouseleave', () => {
      btn.style.transform = '';
    });
  });
}

/* ── CONTACT FORM ─────────────────────────────────────────── */
function renderContactSelect(formData) {
  const sel = document.getElementById('fTipus');
  if (!sel || !formData.tipus_opts) return;
  sel.innerHTML = `<option value="" disabled selected></option>` +
    formData.tipus_opts.map(o => `<option value="${o}">${o}</option>`).join('');
}

function initContactForm() {
  const form    = document.getElementById('contactForm');
  const success = document.getElementById('formSuccess');
  if (!form) return;

  form.addEventListener('submit', e => {
    e.preventDefault();
    if (!form.checkValidity()) { form.reportValidity(); return; }
    /* Animate submit button */
    const btn = form.querySelector('.btn-submit');
    btn.style.opacity = '0.6';
    btn.style.pointerEvents = 'none';
    setTimeout(() => {
      form.hidden    = true;
      success.hidden = false;
    }, 800);
  });
}

/* ── INIT AFTER FIRST LANG LOAD ───────────────────────────── */
window.addEventListener('load', () => {
  initParallax();
  initMagnetic();
  initCounters();
});
