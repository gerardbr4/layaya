// Idioma de la pàgina (index.html = ca, es/index.html = es) i prefix de rutes per a les pàgines en subcarpeta
var LANG = document.documentElement.lang === 'es' ? 'es' : 'ca';
var BASE = document.documentElement.getAttribute('data-base') || '';
var T = {
  ca: { menuOpen: 'Obrir menú', menuClose: 'Tancar menú', thanks: 'Gràcies! Missatge enviat', sending: 'Enviant…', error: "No s'ha pogut enviar. Torna-ho a provar." },
  es: { menuOpen: 'Abrir menú', menuClose: 'Cerrar menú', thanks: '¡Gracias! Mensaje enviado', sending: 'Enviando…', error: 'No se ha podido enviar. Inténtalo de nuevo.' },
}[LANG];

// Navegació: scroll → fons sòlid + hamburger mòbil
(function () {
  const nav = document.getElementById('site-nav');
  const hamburger = document.getElementById('nav-hamburger');

  window.addEventListener('scroll', function () {
    nav.classList.toggle('scrolled', window.scrollY > 20);
  }, { passive: true });

  hamburger.addEventListener('click', function () {
    const isOpen = hamburger.classList.toggle('open');
    nav.classList.toggle('nav-mobile-open', isOpen);
    hamburger.setAttribute('aria-expanded', String(isOpen));
    hamburger.setAttribute('aria-label', isOpen ? T.menuClose : T.menuOpen);
  });

  // Tanca el menú mòbil en clicar un link
  nav.querySelectorAll('.nav-links a').forEach(function (link) {
    link.addEventListener('click', function () {
      hamburger.classList.remove('open');
      nav.classList.remove('nav-mobile-open');
      hamburger.setAttribute('aria-expanded', 'false');
      hamburger.setAttribute('aria-label', T.menuOpen);
    });
  });

  // Pill nav: cursor lliscant a l'hover (excloent el propi cursor)
  const navUL = nav.querySelector('.nav-links');
  const cursor = nav.querySelector('.nav-cursor');
  if (navUL && cursor) {
    nav.querySelectorAll('.nav-links li:not(.nav-cursor)').forEach(function (li) {
      li.addEventListener('mouseenter', function () {
        cursor.style.left = li.offsetLeft + 'px';
        cursor.style.width = li.offsetWidth + 'px';
        cursor.style.opacity = '1';
      });
    });
    navUL.addEventListener('mouseleave', function () {
      cursor.style.opacity = '0';
    });
  }
})();

// Secció "Qui servim" — panel switcher
(function () {
  var SVG_WRAP = '<svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">';

  var ICONS = {
    people: SVG_WRAP + '<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>',
    chefhat: SVG_WRAP + '<path d="M6 16h12v3.5a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V16z"/><path d="M8.5 16V13c0-1.9 1.6-3.5 3.5-3.5s3.5 1.6 3.5 3.5v3"/><path d="M6.5 12.5a5.5 5.5 0 0 1 11 0"/><line x1="10" y1="16" x2="10" y2="19.5"/><line x1="14" y1="16" x2="14" y2="19.5"/></svg>',
    basket: SVG_WRAP + '<path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/><path d="M16 10a4 4 0 0 1-8 0"/></svg>',
    store: SVG_WRAP + '<path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>',
  };

  var PANEL_BASE = [
    { num: '01', img: BASE + 'img/collectivitats.png', icon: 'people' },
    { num: '02', img: BASE + 'img/hostaleria.png', icon: 'chefhat' },
    { num: '03', img: BASE + 'img/retail.png', icon: 'basket' },
    { num: '04', img: BASE + 'img/botigues.png', icon: 'store' },
  ];

  var PANEL_TEXT = {
    ca: [
      {
        cardTitle: 'Col·lectivitats', cardDesc: 'Cuina casolana, equilibrada i segura per a grans col·lectius cada dia.',
        leftTitle: 'Col·lectivitats i menjadors', leftDesc: 'Menús diaris per a escoles, hospitals i menjadors corporatius. Qualitat casolana a gran escala.',
        featTitle: 'Solucions adaptades', featDesc: 'Ens adaptem a les necessitats de cada col·lectivitat amb flexibilitat i compromís.',
      },
      {
        cardTitle: 'Hostaleria', cardDesc: 'Productes premium per a cuines professionals que busquen màxima eficiència i sabor constant.',
        leftTitle: 'Hostaleria i restaurants', leftDesc: 'Plats de cinquena gamma per a restaurants, bars i hotels. Producció regular, sabor constant.',
        featTitle: 'Consistència i qualitat', featDesc: 'Producció regular que garanteix el sabor i la qualitat en cada servei.',
      },
      {
        cardTitle: 'Retail', cardDesc: 'Productes envasats amb identitat de marca per a comerços i grans superfícies.',
        leftTitle: 'Retail i gran distribució', leftDesc: 'Envasos premium per a supermercats i comerços alimentaris especialitzats.',
        featTitle: 'Presentació impecable', featDesc: "Packaging d'alta protecció i llarga vida útil per a la gran distribució.",
      },
      {
        cardTitle: 'Botigues pròpies', cardDesc: 'Plats tradicionals per a botigues de cuina casolana i establiments de take-away.',
        leftTitle: 'Botigues i take-away', leftDesc: "Venda directa al consumidor final amb el sabor d'una cuina de mercat casolana.",
        featTitle: 'Producte de proximitat', featDesc: 'Comerç local amb producte autèntic, fresc i de qualitat garantida.',
      },
    ],
    es: [
      {
        cardTitle: 'Colectividades', cardDesc: 'Cocina casera, equilibrada y segura para grandes colectivos cada día.',
        leftTitle: 'Colectividades y comedores', leftDesc: 'Menús diarios para escuelas, hospitales y comedores de empresa. Calidad casera a gran escala.',
        featTitle: 'Soluciones adaptadas', featDesc: 'Nos adaptamos a las necesidades de cada colectividad con flexibilidad y compromiso.',
      },
      {
        cardTitle: 'Hostelería', cardDesc: 'Productos premium para cocinas profesionales que buscan la máxima eficiencia y un sabor constante.',
        leftTitle: 'Hostelería y restaurantes', leftDesc: 'Platos de quinta gama para restaurantes, bares y hoteles. Producción regular, sabor constante.',
        featTitle: 'Consistencia y calidad', featDesc: 'Producción regular que garantiza el sabor y la calidad en cada servicio.',
      },
      {
        cardTitle: 'Retail', cardDesc: 'Productos envasados con identidad de marca para comercios y grandes superficies.',
        leftTitle: 'Retail y gran distribución', leftDesc: 'Envases premium para supermercados y comercios de alimentación especializados.',
        featTitle: 'Presentación impecable', featDesc: 'Packaging de alta protección y larga vida útil para la gran distribución.',
      },
      {
        cardTitle: 'Tiendas propias', cardDesc: 'Platos tradicionales para tiendas de cocina casera y establecimientos de comida para llevar.',
        leftTitle: 'Tiendas y comida para llevar', leftDesc: 'Venta directa al consumidor final con el sabor de una cocina de mercado casera.',
        featTitle: 'Producto de proximidad', featDesc: 'Comercio local con producto auténtico, fresco y de calidad garantizada.',
      },
    ],
  };

  var PANELS = PANEL_BASE.map(function (p, i) {
    return Object.assign({}, p, PANEL_TEXT[LANG][i]);
  });

  var activeIdx = 0;
  var mainImg = document.getElementById('serveis-main-img');
  var mainNum = document.getElementById('serveis-main-num');
  var mainTitle = document.getElementById('serveis-main-title');
  var mainDesc = document.getElementById('serveis-main-desc');
  var leftTitle = document.getElementById('serveis-left-title');
  var leftDesc = document.getElementById('serveis-left-desc');
  var featIcon = document.getElementById('serveis-feat-icon');
  var featTitle = document.getElementById('serveis-feat-title');
  var featDesc = document.getElementById('serveis-feat-desc');
  var sideCards = document.querySelectorAll('.serveis-side-card');

  if (!mainImg || !sideCards.length) return;

  function initSideCards() {
    sideCards.forEach(function (card, i) {
      var p = PANELS[i];
      card.querySelector('.serveis-side-img').src = p.img;
      card.querySelector('.serveis-side-img').alt = p.cardTitle;
      card.querySelector('.serveis-side-num').textContent = p.num;
      card.querySelector('.serveis-side-title').textContent = p.cardTitle;
      card.querySelector('.serveis-side-icon').innerHTML = ICONS[p.icon];
    });
  }

  function activate(idx) {
    activeIdx = idx;
    var p = PANELS[idx];
    var overlay = document.querySelector('.serveis-main-overlay');
    mainImg.style.transition = 'opacity 0.35s ease';
    if (overlay) overlay.style.transition = 'opacity 0.35s ease';
    mainImg.style.opacity = '0';
    if (overlay) overlay.style.opacity = '0';
    setTimeout(function () {
      mainImg.src = p.img;
      mainImg.alt = p.cardTitle;
      mainNum.textContent = p.num;
      mainTitle.textContent = p.cardTitle;
      mainDesc.textContent = p.cardDesc;
      leftTitle.textContent = p.leftTitle;
      leftDesc.textContent = p.leftDesc;
      featIcon.innerHTML = ICONS[p.icon];
      featTitle.textContent = p.featTitle;
      featDesc.textContent = p.featDesc;
      mainImg.style.opacity = '1';
      if (overlay) overlay.style.opacity = '1';
    }, 180);
    sideCards.forEach(function (card, i) {
      card.classList.toggle('is-active', i === idx);
    });
  }

  sideCards.forEach(function (card, i) {
    card.addEventListener('mouseenter', function () {
      activate(i);
    });
  });

  function syncSideHeight() {
    var mainCard = document.querySelector('.serveis-main-card');
    var sideCards = document.querySelector('.serveis-side-cards');
    if (mainCard && sideCards) {
      sideCards.style.height = mainCard.offsetHeight + 'px';
    }
  }
  window.addEventListener('resize', function () { requestAnimationFrame(syncSideHeight); });

  initSideCards();
  activate(0);
  requestAnimationFrame(syncSideHeight);
})();

// Productes — co-carousel (Tim Guignard)
(function () {
  if (typeof Swiper === 'undefined') return;

  var backgroundWrapper = document.querySelectorAll('.co-background');

  new Swiper('.co-carousel', {
    loop: false,
    watchSlidesProgress: true,
    speed: 1000,
    grabCursor: true,
    navigation: {
      nextEl: '.co-carousel__nav-button.next',
      prevEl: '.co-carousel__nav-button.prev',
    },
    on: {
      touchEnd: function (swiper) {
        var time = Date.now() - swiper.touchEventsData.touchStartTime;
        var distance = Math.abs(swiper.touches.diff);
        var velocity = distance / time;
        var newSpeed = 1000 - velocity * 800;
        swiper.params.speed = Math.max(200, Math.min(1000, newSpeed));
      },
      progress: function (swiper) {
        swiper.slides.forEach(function (slide, index) {
          var progress = slide.progress;
          if (progress >= -1 && progress <= 1) {
            var rotateShoeMax = 15;
            var progressPositive = Math.abs(progress);
            var translateX = progress * -100;
            var rotateShoe = progressPositive * rotateShoeMax - rotateShoeMax;
            var textMaskY = progressPositive * 50;
            var scale = 1 - progressPositive * 0.2;
            var opacity = 0.5 - progressPositive * 0.5;

            slide.querySelector('.co-card').style.transform = 'scale(' + scale + ')';

            var shoeImg = slide.querySelector('.co-card__media-img');
            if (shoeImg) shoeImg.style.transform = 'translate3d(' + translateX + 'px,0,0) rotate(' + rotateShoe + 'deg)';

            var shoeShadow = slide.querySelector('.co-card__media-shadow');
            if (shoeShadow) shoeShadow.style.transform = 'translateX(calc(-50% + ' + (translateX / 2) + 'px))';

            if (backgroundWrapper[index]) backgroundWrapper[index].style.opacity = opacity.toFixed(2);

            slide.querySelectorAll('.text-mask span').forEach(function (t, i) {
              t.style.transform = 'translate3d(0,' + (textMaskY * (i + 1)) + 'px,0)';
            });
          }
        });
      },
      setTransition: function (swiper, speed) {
        swiper.slides.forEach(function (slide, index) {
          slide.querySelector('.co-card').style.transition = speed + 'ms';
          var shoeImg = slide.querySelector('.co-card__media-img');
          if (shoeImg) shoeImg.style.transition = speed + 'ms';
          var shoeShadow = slide.querySelector('.co-card__media-shadow');
          if (shoeShadow) shoeShadow.style.transition = speed + 'ms';
          if (backgroundWrapper[index]) backgroundWrapper[index].style.transition = speed + 'ms';
          slide.querySelectorAll('.text-mask span').forEach(function (t) {
            t.style.transition = speed + 'ms';
          });
        });
      },
      transitionEnd: function (swiper) {
        swiper.params.speed = 1000;
      }
    }
  });
})();

// Comptador animat de stats (Qui som)
(function () {
  const nums = document.querySelectorAll('.stat-num');
  if (!nums.length) return;

  function animate(el) {
    const target = parseInt(el.getAttribute('data-count'), 10) || 0;
    const dur = 1600;
    const t0 = performance.now();
    function tick(now) {
      const t = Math.min(1, (now - t0) / dur);
      const eased = 1 - Math.pow(1 - t, 4);
      el.textContent = Math.round(target * eased);
      if (t < 1) requestAnimationFrame(tick);
    }
    requestAnimationFrame(tick);
  }

  const obs = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        animate(entry.target);
        obs.unobserve(entry.target);
      }
    });
  }, { threshold: 0.4 });

  nums.forEach(function (n) { obs.observe(n); });
})();

// Scroll reveal
(function () {
  var els = document.querySelectorAll('.reveal, .reveal-left, .reveal-right, .reveal-spectacle-left, .reveal-spectacle-center, .reveal-spectacle-right');
  if (!els.length) return;
  var obs = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        entry.target.classList.add('is-visible');
        obs.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12, rootMargin: '0px 0px -40px 0px' });
  els.forEach(function (el) { obs.observe(el); });
})();

// Contacte — envia el formulari a /api/contact (Pages Function → correu)
(function () {
  const form = document.getElementById('contacte-form');
  if (!form) return;
  const btn = form.querySelector('.form-submit');
  if (!btn) return;
  const original = btn.innerHTML;
  let busy = false;

  function restore(delay) {
    setTimeout(function () {
      btn.innerHTML = original;
      btn.style.background = '';
      btn.disabled = false;
      busy = false;
    }, delay);
  }

  form.addEventListener('submit', function (e) {
    e.preventDefault();
    if (busy) return;
    if (!form.reportValidity()) return;
    busy = true;
    btn.disabled = true;
    btn.innerHTML = T.sending;

    const data = new FormData(form);
    data.append('lang', LANG);

    fetch('/api/contact', { method: 'POST', body: data })
      .then(function (res) { return res.json().catch(function () { return {}; }).then(function (j) { return res.ok && j.ok; }); })
      .catch(function () { return false; })
      .then(function (ok) {
        if (ok) {
          btn.innerHTML = T.thanks;
          btn.style.background = 'var(--green-dk)';
          form.reset();
          restore(3000);
        } else {
          btn.innerHTML = T.error;
          btn.style.background = '#b4442f';
          restore(4000);
        }
      });
  });
})();
