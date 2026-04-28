# disseny.md — Proposta de disseny per a Stitch
## Layaya · One page corporativa · Menjar preparat

---

## Identitat de marca

**Nom:** Layaya  
**Tagline:** Cuina de mercat amb el sabor casolà de sempre.
**Subtítol de marca:** Cuina preparada amb ànima.  
**Sector:** Alimentació. Empresa especialitzada en plats preparats de cinquena gamma.  
**Públic objectiu:** Hostaleria, retail, col·lectivitats, distribuïdors i consumidor final.

### Personalitat visual

- Proper, càlid i mediterrani.
- Professional, net i ordenat.
- Alimentari, fresc i apetitós.
- Modern però amb arrels tradicionals.
- Marca familiar escalable a empresa.

---

## Paleta de colors

| Rol | Nom | HEX | Ús principal |
|---|---|---|---|
| **Primari** | Verd suau | `#7ABA78` | Botons, accions, icones, bordes actius, qualitat |
| **Secundari** | Groc crema | `#E8C870` | Accents càlids, hover, detalls, tradició |
| Complementari | Blau clar | `#9FB9E8` | Obrador, tecnologia, cadena de fred |
| Accent | Coral / salmó | `#D97A7A` | Crida a l'acció secundària, calidesa, cuina |
| Neutre fosc | Gris profund | `#606060` | Textos secundaris, footer, estructural |
| Fons principal | Blanc trencat | `#FFFDF8` | Fons general |
| Fons suau | Crema | `#F7EFE3` | Seccions alternes |
| Text principal | Marró fosc | `#3C2A21` | Títols i cossos de text |

**Criteri d'ús:** Els colors han de funcionar com a accents i blocs visuals, no tots alhora en la mateixa pantalla. Combinar sempre amb blanc trencat i fotografia real de producte.

---

## Tipografia

### Opció recomanada (en ús actual)

| Rol | Família | Pes |
|---|---|---|
| Titulars principals | Fraunces | 600 / 700 / 900 / Italic |
| Subtítols i UI | Sora | 500 / 600 |
| Cos de text | Sora | 300 / 400 |

### Jerarquia tipogràfica

- **H1 hero:** Fraunces 900, 72–96px, color `#3C2A21`
- **H2 seccions:** Fraunces 700, 40–52px
- **H3 targetes:** Fraunces 700, 24–28px
- **Eyebrow/tag:** Sora 500, 12px, majúscules, tracking ample
- **Cos text:** Sora 400, 17–18px, line-height 1.7
- **Botons:** Sora 600, 15px, majúscules lleugeres

---

## Estructura de la pàgina (seccions en ordre)

### 1. Header (fix, transparent → sòlid en scroll)
- Logo a l'esquerra
- Menú centrat: Qui som · Què fem · Productes · Qualitat · Contacte
- Selector d'idioma a la dreta: CA / ES / EN (amb banderetes discretes)
- Botó CTA "Contacte" destacat en verd `#7ABA78`
- Mòbil: hamburger, selector idioma dins menú

### 2. Hero (vídeo scroll-driven)

**Concepte:** El hero ocupa el 100% de la pantalla (`100vh`) i conté un vídeo que es reprodueix frame a frame sincronitzat amb el scroll de l'usuari. El vídeo no s'autoreprodeuix: és completament controlat per `video.currentTime`. Quan l'usuari arriba al final del scroll reservat, el vídeo ha acabat i el contingut de sota apareix.

**Fitxer de vídeo:** `img/video.mp4`  
Format recomanat: MP4 H.264, resolució 1920×1080, sense àudio (o silenciat).

**Mecànica tècnica:**
- `.hero-scroll` té una alçada calculada dinàmicament: `durada_vídeo × 60px + 100vh`
- `.hero-sticky` és `position: sticky; top: 0; height: 100vh` — queda fixat mentre l'usuari fa scroll
- En cada event `scroll`, es calcula `progress = scrollY / (heroHeight - vh)` i s'assigna `video.currentTime = progress × video.duration`
- Barra de progrés fina al capdamunt de la pàgina indica l'avanç del vídeo
- Indicador "Desplaza" (fletxa animada) desapareix en iniciar el scroll
- El contingut de sota el hero apareix amb animació `fadeUp` quan `progress ≥ 0.98`

**Text sobre el vídeo (bottom-left):**
- Logo Layaya (color original, sense inversió) · 180px
- Eyebrow: Sora 500 · 0.82rem · uppercase · tracking 0.22em
- Títol: Fraunces 900 · `clamp(3.4rem, 7.5vw, 7rem)` · blanc
- Subtítols rotatius: Sora 300 · `clamp(1.15rem, 2vw, 1.55rem)` · efecte roda vertical (entra per baix, surt per dalt) · interval 4,5s

**Overlay:** gradient fosc suau de dalt a baix (`rgba(0,0,0,0.10)` → `rgba(0,0,0,0.55)`) per llegibilitat de text futur sobre el vídeo.

**Animacions hero:**
- Vídeo controlat per scroll (no autoplay)
- Subtítols: efecte roda — `translateY(110%→0)` entrada, `translateY(0→-110%)` sortida, cubic-bezier expo out
- Indicador de scroll (fletxa pulsant + text "Desplaza")
- Barra de progrés horitzontal al top de la pàgina

### 3. Qui som (Sobre nosaltres)
**Layout:** Text esquerra · Stats dreta

**Text:**
- Tag: "L'empresa"
- Títol: "Una empresa alimentària nascuda de la cuina de sempre."
- 2 paràgrafs: obrador industrial d'alta tecnologia, +35 varietats, control total del procés.

**Stats (4 blocs amb comptadors animats):**
- 35+ Varietats de plats
- 18 Dies de vida útil
- 100% Producte artesà
- 4° Temp. conservació màx.

### 4. Línies de negoci
**Layout:** 2 targetes grans a pantalla completa, paral·leles (desktop) / apilades (mòbil)

**Targeta 1 — Layaya Alimentación**
- Fons: imatge de paella amb overlay fosc verd
- Tag: "Producció i distribució"
- Títol: "Layaya Alimentació"
- Text: elaboració per a hostaleria, retail, col·lectivitats i distribuïdors
- Llista: obrador propi · producció professional · cinquena gamma · solucions per a empreses
- CTA: "Saber-ne més"

**Targeta 2 — Layaya Botigues**
- Fons: imatge de croquetes amb overlay daurat `#e8c870`
- Tag: "Venda directa" (en or)
- Títol: "Layaya Botigues"
- Text: venda al consumidor final, plats per emportar
- Llista: plats per emportar · cuina casolana · venda directa · proximitat
- CTA: "Les nostres botigues"

### 5. Productes
**Layout:** Franja d'imatges destacades + pestanyes de categories + panell de contingut

**Header secció (fons fosc):**
- Tag: "El nostre catàleg"
- Títol: "Plats preparats amb sabor, regularitat i confiança."
- Subtítol: "Més de 35 varietats elaborades amb ingredients de primera selecció."

**Categories (9 pestanyes amb icona):**
1. Canelons i Lasanyes
2. Carns i Guisats
3. Peixos i Marisc
4. Llegums i Verdures
5. Arrossos i Fideuàs *(amb foto: paella_marisc.jpg)*
6. Pastes i Noodles *(amb foto: udon.jpg)*
7. Croquetes *(amb foto: croquetes_pollastre.jpg)*
8. Amanides i Pastissos Freds
9. Postres

### 6. Qualitat
**Layout:** Grid 3×2 de targetes amb icona, títol i text

**6 pilars:**
1. Selecció de matèries primeres
2. Rigor en la preparació
3. Cuina d'avantguarda
4. Envasat d'alta protecció (atmosfera protectora, 18 dies)
5. Laboratori de control
6. Logística i cadena de fred (2°C–4°C)

### 7. Contacte
**Layout:** Text + dades esquerra · Formulari dreta

**Formulari (floating labels):**
- Nom i cognoms (required)
- Empresa
- Correu electrònic (required)
- Telèfon
- Tipus de consulta (select): Informació comercial · Producte per a professionals · Botigues · Distribució · Altres
- Missatge (textarea, required)
- Botó: "Enviar missatge" →

**Dades laterals:**
- Instagram: @layaya.alimentacion
- (Telèfon, email i adreça a afegir quan estiguin disponibles)

### 8. Footer
- Logo + tagline: "Cuinem perquè menjar bé sigui més fàcil."
- Navegació interna (repeteix menú)
- Avís legal · Privacitat
- Copyright: © 2026 Layaya. Tots els drets reservats.

---

## Components i estils UI

### Botons

| Tipus | Fons | Text | Vora |
|---|---|---|---|
| Primari | `#7ABA78` | blanc | cap |
| Ghost | transparent | `#7ABA78` | 2px `#7ABA78` |
| Ghost clar | transparent | blanc | 1px rgba(blanc, 0.5) |
| Ghost daurat | transparent | `#E8C870` | 1.5px `#E8C870` |

Tots els botons: border-radius 2px, padding 14px 28px, Sora 600 13px uppercase, transition 0.3s, efecte "magnètic" en hover (pull 22%).

### Tags / Eyebrows
- Sora 500 · 11px · majúscules · tracking 0.15em
- Color: `#7ABA78` (sobre fons clar) o rgba(blanc, 0.75) (sobre fons fosc)
- Sense fons, sense vora

### Cards de qualitat
- Fons: blanc · Padding 40px · Border-radius 4px
- Icona: 36px, color verd `#7ABA78`
- Títol: Fraunces 700 · 20px
- Text: Sora · 15px · color `#606060`
- Hover: translateY(-6px), box-shadow suau

### Navegació
- Fons: transparent en hero → **verd primari `#7ABA78`** en scroll (transició 0.4s)
- Altura: 72px (normal) / 60px (scrolled)
- Links: Sora 500 · 14px · tracking 0.05em
- Link hover: `scale(1.1)` + indicador blanc baix (transició cubic-bezier expo)
- Link actiu: color blanc · indicador blanc baix
- CTA "Contacte": **blau terciari `#9FB9E8`**, hover `scale(1.08)`
- Logo: sense inversió de color (es mostra en color original)

### Cursor personalitzat (desktop)
- Punt central: 10px, blanc, mix-blend-mode: difference
- Trail: 36px, blanc, mix-blend-mode: difference, lag 12%
- En hover sobre interactius: escala 2.5×

---

## Animacions i moviment

### Principis
- Durada base: 600ms · Easing: cubic-bezier(0.16, 1, 0.3, 1) (expo out)
- Hardware-accelerated: only transform + opacity
- Scroll reveal: IntersectionObserver, threshold 0.1, stagger 80ms entre elements
- No animar mai color ni background directament

### Animacions específiques

| Element | Animació | Durada |
|---|---|---|
| Paraules hero | Slide-up des de 110% + opacitat | 700ms, stagger 90ms |
| Imatges hero | Scale 0.92→1 + opacitat | 800ms, delay CSS var |
| Sections en scroll | FadeSlideUp (translateY 30px→0) | 600ms |
| Comptadors stats | Ease-out quart, requestAnimationFrame | 1800ms |
| Claim slider | Fade out/in 600ms, interval 4500ms | — |
| Botons magnètics | translate(x,y) 22% del cursor | instant |
| Cards hover | translateY(-6px), shadow | 300ms |
| Navbar scroll | Fons/ombra | 400ms |

---

## Fotografies disponibles (carpeta img/)

| Fitxer | Contingut | Usos a la web |
|---|---|---|
| `logo.png` | Logo Layaya (personatge àvia) | Header, footer |
| `paella_marisc.jpg` | Paella de marisc vista des de dalt | Hero mosaic, línies (Alimentació), productes (Arrossos) |
| `risotto_bolets.jpg` | Risotto de bolets | Hero mosaic |
| `croquetes_pollastre.jpg` | Croquetes de pollastre | Hero mosaic, línies (Botigues), productes (Croquetes) |
| `udon.jpg` | Udon amb verdures | Hero mosaic, productes (Pastes) |

**Imatges pendents de fotografiar:**
- Obrador industrial
- Equip treballant
- Interiors de botiga
- Packaging i safates
- Taula parada / emplatat final

---

## Idiomes

La web funciona en 3 idiomes, tots els textos venen de fitxers JSON independents:

| Codi | Idioma | Fitxer |
|---|---|---|
| `ca` | Català | `lang/ca.json` |
| `es` | Castellà | `lang/es.json` |
| `en` | Anglès | `lang/en.json` |

L'estructura del fitxer JSON: `meta · nav · hero · sobre · linies · productes · qualitat · contacte · footer`

---

## Estil visual de referència

- **Estètica general:** Editorial food brand. Entre Ottolenghi i una empresa alimentària catalana moderna.
- **Fotos:** Llum natural, colors càlids, plans detall de menjar, producte real.
- **No és:** Minimalista gràcil (massa buit), ni sobrecarregat, ni rústic folklòric.
- **Referents visuals:** Cuines de mercat, envasos de quinta gamma premium, portades de revista gastronòmica.
- **Sensació final:** Entra gana. Inspira confiança. Sembla una empresa sòlida.

---

## Notes per a Stitch

1. Prioritzar les seccions Hero, Línies de negoci i Productes, que son el nucli visual.
2. El logo (àvia / personatge) ha de tenir presència forta al header i al footer.
3. La paleta de verd `#7ABA78` és el color identitari, el daurat `#E8C870` és l'accent emocional.
4. Els títols en Fraunces Italic donen el caràcter gastronòmic.
5. Les targetes de les dues línies de negoci (Alimentació / Botigues) son el moment de màxim impacte visual.
6. El formulari de contacte ha de ser elegant, no utilitari.
7. Mòbil primer: el hero en mòbil hauria de ser vertical (imatge sobre text, no split).
