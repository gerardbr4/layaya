# design.md — One Page corporativa “La Iaia”

## 1. Objectiu de la pàgina

Crear una **one page corporativa, visual i comercial** per presentar l’empresa **La Iaia** com una marca especialitzada en menjar preparat, amb dues grans línies d’activitat:

1. **La Iaia Alimentació**  
   Obrador, producció i distribució de menjar preparat de cinquena gamma per a hostaleria, retail, col·lectivitats i altres canals professionals.

2. **La Iaia Botigues**  
   Venda directa al públic a través de botigues físiques, amb plats preparats, cuina de proximitat i solucions pràctiques per al dia a dia.

La web ha de transmetre:

- Cuina casolana amb estàndards professionals.
- Tradició, confiança i proximitat.
- Capacitat productiva i solvència empresarial.
- Producte preparat, pràctic i de qualitat.
- Marca familiar, però moderna i escalable.

La pàgina ha d’estar preparada per treballar en **diversos idiomes**, separant molt bé estructura, textos i continguts traduïbles.

### Bases documentals incorporades

Aquest document ja incorpora la informació principal dels dos documents de base aportats:

1. **briefing.docx**
   - Claims comercials inicials.
   - Descripció de l’obrador industrial d’alta tecnologia.
   - Explicació del procés de qualitat en sis fases.
   - Llistat ampli de categories i varietats de producte.

2. **Descripció de La Yaya Alimentación.docx**
   - Posicionament de La Yaya / La Iaia Alimentación com a empresa de cinquena gamma.
   - Missió orientada a facilitar la feina dels professionals de l’hostaleria i la restauració.
   - Tècnica de cocció lenta al buit i conservació.
   - Compromís amb qualitat, innovació, sostenibilitat i conveniència.

> Nota de nomenclatura: en els documents apareixen les formes “La Yaya” i “Layaya”. Per coherència de marca dins la web es recomana unificar-ho com **La Iaia** en català i mantenir, si cal, **La Yaya Alimentación** només com a denominació societària o comercial específica en castellà.

---

## 2. Concepte creatiu

### Idea principal

**“La cuina de sempre, preparada per al món d’avui.”**

La web ha de combinar la part emocional de la cuina tradicional amb una imatge d’empresa sòlida, moderna i professional. No ha de semblar només una botiga de menjar preparat, sinó una empresa alimentària amb obrador, capacitat de producció i visió de futur.

### To visual

- Proper, càlid i mediterrani.
- Professional, net i ordenat.
- Alimentari, fresc i apetitós.
- Amb moviment subtil, no excessiu.
- Amb fotografia potent de producte, mans cuinant, ingredients i obrador.

### Frases inspiradores per al disseny

- Cuina preparada amb ànima.
- Receptes de sempre, solucions d’avui.
- Del nostre obrador a la teva taula.
- Cuina preparada per a llars, empreses i professionals.
- Tradició, sabor i confiança.

---

## 3. Arquitectura general de la one page

La web serà una sola pàgina amb navegació per ancoratges. El menú superior ha de portar a cada secció.

### Ordre recomanat de seccions

1. **Hero / portada amb impacte visual**
2. **Presentació breu de La Iaia**
3. **Dues línies de negoci: Alimentació i Botigues**
4. **Producte i valors gastronòmics**
5. **Obrador i capacitat productiva**
6. **Canals i solucions professionals**
7. **Botigues i venda directa**
8. **Qualitat, seguretat alimentària i confiança**
9. **Galeria / moments de cuina**
10. **Tancament emocional i crida a l’acció**
11. **Contacte**
12. **Footer legal i idiomes**

---

## 4. Estructura d’idiomes

La web ha d’estar preparada per gestionar els textos en diversos idiomes de forma clara, editable i separada del disseny.

### Idiomes inicials recomanats

- Català — `ca`
- Castellà — `es`
- Anglès — `en`
- Francès — `fr` opcional

### Selector d’idioma

Ubicació: **part superior dreta del header**.

Format visual:

- Banderetes petites o codis d’idioma.
- Opció recomanada: codi curt amb bandera discreta.
- Exemple:

```txt
CAT | ESP | ENG | FRA
```

O bé:

```txt
🇨🇹 CA   🇪🇸 ES   🇬🇧 EN   🇫🇷 FR
```

> Nota: si es vol evitar conflicte visual o polític amb banderes, és més elegant utilitzar només codis d’idioma: CA / ES / EN / FR.

### Estructura tècnica recomanada

Separar els textos per idioma en fitxers independents.

```txt
/src
  /content
    ca.json
    es.json
    en.json
    fr.json
  /components
    Header.jsx
    Hero.jsx
    BusinessLines.jsx
    Products.jsx
    Workshop.jsx
    Channels.jsx
    Shops.jsx
    Quality.jsx
    Gallery.jsx
    Contact.jsx
  /styles
    global.css
```

### Exemple de fitxer d’idioma

```json
{
  "menu": {
    "about": "La Iaia",
    "business": "Què fem",
    "workshop": "Obrador",
    "shops": "Botigues",
    "quality": "Qualitat",
    "contact": "Contacte"
  },
  "hero": {
    "eyebrow": "Cuina preparada amb ànima",
    "title": "La cuina de sempre, preparada per al món d’avui",
    "subtitle": "Elaborem plats preparats amb sabor, ofici i confiança, des del nostre obrador fins a llars, botigues i professionals.",
    "primary_cta": "Conèixer La Iaia",
    "secondary_cta": "Contactar"
  }
}
```

### Normes de contingut multidioma

- Cap text fix ha d’estar escrit directament dins del component visual.
- Tots els textos han de venir del fitxer d’idioma corresponent.
- Les imatges poden compartir-se entre idiomes.
- Els textos legals també han de tenir clau pròpia per idioma.
- Les metadades SEO han d’estar separades per idioma.

Exemple:

```json
{
  "seo": {
    "title": "La Iaia | Cuina preparada i alimentació",
    "description": "Empresa especialitzada en menjar preparat, obrador alimentari, botigues i solucions per a professionals."
  }
}
```

---

## 5. Header

### Funció

Ha de ser net, elegant i sempre accessible. En una one page, el header ha d’ajudar a saltar entre seccions sense carregar la pantalla.

### Comportament

- Header fix a la part superior.
- Fons transparent sobre el hero inicial.
- En fer scroll, passa a fons sòlid clar amb ombra subtil.
- Logo a l’esquerra.
- Menú centrat o alineat a la dreta.
- Selector d’idioma a l’extrem superior dret.
- Botó destacat “Contacte” o “Parlem?”

### Menú proposat

```txt
La Iaia · Què fem · Obrador · Botigues · Qualitat · Contacte
```

### Versió mòbil

- Logo a l’esquerra.
- Icona hamburguesa a la dreta.
- Selector d’idioma dins del menú desplegable o visible al costat de la icona.

---

## 6. Hero / portada principal

### Objectiu

Crear una primera impressió potent, gastronòmica i emocional.

### Composició visual

Opció recomanada:

- Slider o vídeo curt de fons.
- Imatges de plats preparats, mans cuinant, ingredients frescos i obrador.
- Capa fosca o càlida superposada per assegurar llegibilitat.
- Text principal gran i elegant.
- Botons d’acció.

### Contingut orientatiu

**Eyebrow:**  
Cuina preparada amb ànima

**Títol:**  
La cuina de sempre, preparada per al món d’avui

**Subtítol:**  
Elaborem plats preparats amb sabor, ofici i confiança, des del nostre obrador fins a llars, botigues i professionals.

**Botons:**

- Conèixer La Iaia
- Contactar

### Moviment recomanat

- Slider suau amb transició lenta.
- Ingredients flotants molt subtils: fulles, farina, vapor, culleres, oli, herbes.
- Efecte parallax lleuger sobre la imatge de fons.
- Text amb entrada suau des de baix.

### Elements visuals possibles

- Plat preparat vist des de dalt.
- Una cassola amb vapor.
- Mans emplenant una safata.
- Obrador amb equip treballant.
- Detall de producte envasat.

---

## 7. Secció “Qui som”

### Objectiu

Explicar què és La Iaia sense allargar-se massa.

### Layout

- Dues columnes.
- Esquerra: text corporatiu.
- Dreta: fotografia vertical o collage de 3 imatges.

### Contingut orientatiu

**Títol:**  
Una empresa alimentària nascuda de la cuina de sempre

**Text:**  
La Iaia és una empresa especialitzada en l’elaboració de plats preparats, combinant receptes tradicionals, processos professionals i una mirada actual sobre les necessitats del consumidor.

Des del nostre obrador produïm solucions gastronòmiques per a diferents canals, mantenint el compromís amb el sabor, la qualitat i la confiança.

### Recursos visuals

- Fotografia de l’equip.
- Detalls de cuina.
- Imatge de l’obrador.
- Producte acabat.

---

## 8. Secció “Dues línies de negoci”

### Objectiu

Deixar clar que La Iaia té dues branques: Alimentació i Botigues.

### Layout

Dues targetes grans, una al costat de l’altra en desktop i apilades en mòbil.

### Targeta 1 — La Iaia Alimentació

**Títol:**  
La Iaia Alimentació

**Subtítol:**  
Producció alimentària per a professionals

**Text:**  
Elaborem plats preparats i solucions de cinquena gamma per a hostaleria, retail, col·lectivitats i altres canals que necessiten producte segur, regular i de qualitat.

**Punts clau:**

- Obrador propi.
- Producció professional.
- Plats preparats i cinquena gamma.
- Solucions per a empreses i distribuïdors.

### Targeta 2 — La Iaia Botigues

**Títol:**  
La Iaia Botigues

**Subtítol:**  
Menjar preparat per al dia a dia

**Text:**  
A les nostres botigues oferim plats preparats per emportar, pensats per a persones que volen menjar bé, de forma pràctica i amb el sabor de la cuina de sempre.

**Punts clau:**

- Venda directa al públic.
- Plats preparats per emportar.
- Cuina casolana i pràctica.
- Proximitat amb el consumidor final.

### Efectes visuals

- Targetes amb imatge de fons i degradat.
- Hover amb lleuger zoom.
- Icona pròpia per cada branca.
- Petita animació d’entrada en fer scroll.

---

## 9. Secció “Producte”

### Objectiu

Mostrar què ofereix La Iaia de forma apetitosa i clara.

### Layout

Grid de categories de producte.

### Categories de producte incorporades del briefing

La web ha de presentar el producte com una gamma àmplia de **més de 35 varietats de menjar preparat**, organitzada per famílies gastronòmiques.

1. **Canelons i lasanyes**
   - Canelons de carn.
   - Lasanya bolonyesa.
   - Lasanya vegetal.

2. **Carns i guisats**
   - Fricandó de vedella.
   - Mandonguilles amb samfaina.
   - Estofat de vedella.
   - Galtes de porc.
   - Cua de bou.
   - Callos.
   - Pollastre a l’ast.
   - Cuixa a l’ast amb patates.
   - Costelles de porc BBQ.
   - Aletes de pollastre BBQ.

3. **Peixos i marisc**
   - Bacallà amb pisto.
   - Lluç amb salsa verda.
   - Popets encebats.
   - Esqueixada de bacallà.

4. **Llegums i verdures**
   - Cigrons amb ou.
   - Llenties a la riojana.
   - Fabada asturiana.
   - Trinxat de la Cerdanya.

5. **Arrossos i fideuàs**
   - Fideuà marinera.
   - Paella de marisc.
   - Arròs de muntanya.
   - Risotto de bolets.
   - Risotto de gambes i verdures.

6. **Pastes i noodles**
   - Macarrons bolonyesa.
   - Tallarins carbonara.
   - Udon amb verdures i gambes.
   - Noodles amb verdures i vedella.

7. **Croquetes**
   - Croquetes de pollastre.
   - Croquetes de pernil.
   - Croquetes de bolets: xiitake, gírgola i nameko.

8. **Amanides i pastissos freds**
   - Ensaladilla russa.
   - Pastís de tonyina.

9. **Postres**
   - Categoria pendent de concretar.

### Categories resumides per a la interfície

Per no saturar la one page, la graella visual pot agrupar la gamma en 6-8 targetes:

- Canelons i lasanyes.
- Carns i guisats.
- Peixos i marisc.
- Llegums, verdures i acompanyaments.
- Arrossos, fideuàs i pasta.
- Croquetes i fregits.
- Plats freds i amanides.
- Postres.

### Contingut orientatiu

**Títol:**  
Plats preparats amb sabor, regularitat i confiança

**Text:**  
Treballem receptes pensades per conservar el sabor de la cuina tradicional i adaptar-lo a les necessitats actuals: productes pràctics, segurs i preparats per servir o consumir.

### Detall visual

Cada categoria pot tenir:

- Foto del producte.
- Nom curt.
- Text d’una línia.
- Icona alimentària discreta.

---

## 10. Secció “Obrador”

### Objectiu

Donar confiança i mostrar solvència industrial.

### Layout

- Fons clar o crema.
- Imatge ampla de l’obrador.
- Blocs numèrics o característiques destacades.

### Contingut orientatiu

**Títol:**  
Un obrador preparat per créixer

**Text:**  
Disposem d’un obrador industrial d’alta tecnologia dedicat a l’elaboració de plats cuinats de mercat en gran format. Transformem el receptari tradicional en una gamma àmplia de menjar preparat, amb control del procés, regularitat de sabor i màxima qualitat en cada ració.

La proposta ha de transmetre que La Iaia combina cuina casolana i tecnologia alimentària: receptes tradicionals, coccions específiques per a cada elaboració, envasat adequat i distribució refrigerada.

### Blocs destacats

- Elaboració pròpia.
- Processos controlats.
- Capacitat de producció.
- Adaptació a diferents canals.
- Regularitat en el producte.
- Seguretat alimentària.

### Animacions

- Comptadors animats si es disposa de dades reals.
- Línia de procés animada: recepta → elaboració → envasat → distribució.

> Important: no inventar xifres. Si no es disposa de dades reals, utilitzar conceptes qualitatius.

---

## 11. Secció “Canals professionals”

### Objectiu

Explicar a qui pot donar servei La Iaia Alimentació.

### Layout

Targetes amb icones.

### Canals

1. Hostaleria.
2. Retail.
3. Col·lectivitats.
4. Distribuïdors.
5. Empreses alimentàries.
6. Altres canals professionals.

### Contingut orientatiu

**Títol:**  
Solucions per a diferents canals

**Text:**  
Desenvolupem productes i formats adaptats a les necessitats de cada client professional, amb una proposta basada en la qualitat, la regularitat i la facilitat de servei.

### CTA

Botó:  
Parlem del teu projecte

---

## 12. Secció “Tècnica i cinquena gamma”

### Objectiu

Explicar de forma clara què fa diferencial La Iaia Alimentació: producte preparat de cinquena gamma, cuinat amb criteri professional i pensat per facilitar la feina dels canals de restauració, hostaleria, retail i col·lectivitats.

### Contingut a comunicar

**Títol:**  
Cinquena gamma amb sabor de cuina casolana

**Text:**  
A La Iaia Alimentació elaborem plats preparats i bases culinàries que preserven el sabor i l’essència de la cuina tradicional, aplicant tècniques avançades de cocció i conservació.

La cocció lenta al buit a baixa temperatura permet obtenir textures meloses, sabors intensos i una qualitat constant. Els productes es preparen perquè els professionals els puguin regenerar fàcilment, reduint temps de preparació i mantenint marge per aportar el seu propi toc final.

### Recursos visuals

- Timeline: preparació → cocció lenta → envasat → refrigeració → regeneració.
- Icones: buit, vapor, temperatura controlada, vida útil, servei professional.
- Imatge tècnica de cuina o obrador amb un tractament net i modern.

### Nota de copy

Explicar la tècnica sense fer la web massa tècnica. El missatge principal ha de ser: **més facilitat per al professional, sense renunciar al sabor casolà**.

---

## 13. Secció “Botigues”

### Objectiu

Presentar la branca de venda directa al públic.

### Layout

- Mapa o llistat de botigues.
- Fotografies d’aparador, vitrines, plats i packaging.
- Text proper i comercial.

### Contingut orientatiu

**Títol:**  
Menjar preparat per emportar, cada dia més fàcil

**Text:**  
A les botigues La Iaia oferim una selecció de plats preparats per a persones que busquen una opció pràctica, saborosa i de confiança per al seu dia a dia.

### Elements possibles

- Horaris.
- Ubicacions.
- Telèfon.
- Enllaç a Google Maps.
- Botó “Troba la teva botiga”.

---

## 14. Secció “Qualitat i confiança”

### Objectiu

Reforçar la credibilitat de l’empresa.

### Layout

Secció amb fons net, icones i textos curts.

### Pilars de qualitat incorporats del briefing

1. **Selecció de matèries primeres**  
   Ingredients de primera categoria, proveïdors de confiança i selecció acurada per garantir sabor i resultat.

2. **Rigor en la preparació**  
   Mateixa recepta, mateix sabor. Pesatge i mesura precisa dels ingredients per assegurar regularitat en tots els plats.

3. **Cuina d’avantguarda**  
   Combinació de mètodes de cuina casolana amb equips d’última generació i processos de cocció adaptats a cada recepta.

4. **Envasat d’alta protecció**  
   Formats adaptats al ritme de vida actual, amb ús majoritari d’atmosfera protectora per preservar qualitats i vida útil del producte.

5. **Laboratori de control i seguretat**  
   Pla d’higiene i desinfecció per controlar cada fase de producció i distribució.

6. **Logística i cadena de fred**  
   Distribució eficient sense trencar la cadena de fred i conservació del producte a temperatura controlada, entre 2 °C i 4 °C fins al lliurament.

### Contingut orientatiu

**Títol:**  
Qualitat en cada pas

**Text:**  
La confiança es construeix amb processos rigorosos, producte regular i una manera de treballar orientada a garantir seguretat, sabor i servei.

> Evitar claims massa absoluts si no estan acreditats documentalment: “100% natural”, “sense additius”, “ecològic”, “artesà” si no es pot justificar.

---

## 15. Galeria visual

### Objectiu

Aportar ritme visual i reforçar l’apetit del producte.

### Format

- Mosaic d’imatges.
- Scroll horitzontal o carrusel.
- Fotos de producte, cuina, obrador i botigues.

### Efectes

- Hover amb zoom suau.
- Aparició progressiva en scroll.
- Parallax molt lleuger.

### Recomanació

Prioritzar fotografia real de La Iaia. Si s’utilitzen imatges de recurs, han de ser temporals i substituir-se per fotos pròpies.

---

## 16. Tancament emocional

### Objectiu

Acabar la pàgina amb una frase de marca i una crida clara a contactar.

### Contingut orientatiu

**Títol:**  
Cuinem perquè menjar bé sigui més fàcil

**Text:**  
Tant si busques plats preparats per al teu negoci com una solució pràctica per al dia a dia, La Iaia t’acosta una cuina preparada amb sabor, confiança i ofici.

**Botons:**

- Contacta amb nosaltres
- Coneix les nostres botigues

### Visual

- Imatge càlida d’una taula parada.
- Plat al centre.
- Mans servint menjar.
- Llum natural.

---

## 17. Contacte

### Objectiu

Facilitar el contacte comercial i corporatiu.

### Layout

Dues columnes:

- Esquerra: dades de contacte.
- Dreta: formulari.

### Camps del formulari

- Nom i cognoms.
- Empresa.
- Email.
- Telèfon.
- Tipus de consulta:
  - Informació comercial.
  - Producte per a professionals.
  - Botigues.
  - Distribució.
  - Altres.
- Missatge.
- Acceptació de política de privacitat.

### Dades a mostrar

- Telèfon.
- Email.
- Adreça corporativa.
- Xarxes socials.
- Enllaç a Google Maps si correspon.

---

## 18. Footer

### Contingut

- Logo La Iaia.
- Breu frase de marca.
- Menú d’ancoratges.
- Idiomes.
- Xarxes socials.
- Avís legal.
- Política de privacitat.
- Política de cookies.

### Exemple

```txt
La Iaia — Cuina preparada amb ànima.
© La Iaia. Tots els drets reservats.
```

---

## 19. Direcció visual

### Colors principals de marca

| Rol | HEX | Ús |
|---|---|---|
| **Color primari** | `#7aba78` | Accions principals, botons, destacats, icones, bordes actius |
| **Color secundari** | `#e8c870` | Accents càlids, hover, fons de seccions emocionals, detalls decoratius |

### Paleta de colors corporativa detectada

A partir de la imatge de referència aportada, s’incorpora aquesta gamma cromàtica com a base del disseny. Els valors **HEX** són els colors de treball per a web. Els **Pantone** són equivalències aproximades i s’haurien de validar amb una guia física o Pantone Connect abans d’imprimir.

| Ús recomanat | Color | RGB | HEX | Pantone aproximat |
|---|---|---:|---|---|
| Fons càlid, blocs destacats, seccions emocionals | Groc crema | 232, 200, 112 | `#E8C870` | Pantone 7403 C aprox. |
| Naturalesa, frescor, qualitat alimentària | Verd suau | 122, 186, 120 | `#7ABA78` | Pantone 7488 C aprox. |
| Confiança, tecnologia, obrador, higiene | Blau clar | 159, 185, 232 | `#9FB9E8` | Pantone 2717 C aprox. |
| Crides a l’acció, calidesa, producte cuinat | Coral / salmó | 217, 122, 122 | `#D97A7A` | Pantone 7607 C aprox. |
| Textos foscos, fons tècnics o contrast | Gris profund | 96, 96, 96 | `#606060` | Pantone Cool Gray 10 C aprox. |

### Variables CSS recomanades

```css
:root {
  --color-primary:   #7aba78;  /* Color primari de marca */
  --color-secondary: #e8c870;  /* Color secundari de marca */

  --color-groc-crema: #E8C870;
  --color-verd-suau: #7ABA78;
  --color-blau-clar: #9FB9E8;
  --color-coral: #D97A7A;
  --color-gris-profund: #606060;

  --color-fons: #FFFDF8;
  --color-fons-suau: #F7EFE3;
  --color-text: #3C2A21;
  --color-text-secundari: #606060;
}
```

### Ús dels colors

- **Groc crema `#E8C870`**: seccions càlides, introduccions, fons de targetes emocionals i detalls vinculats a tradició.
- **Verd suau `#7ABA78`**: qualitat, matèries primeres, sostenibilitat, frescor i apartats de producte.
- **Blau clar `#9FB9E8`**: tecnologia alimentària, obrador, seguretat, laboratori, cadena de fred i processos professionals.
- **Coral `#D97A7A`**: botons principals, destacats comercials, avisos visuals i elements relacionats amb cuina i sabor.
- **Gris profund `#606060`**: text secundari, fons de contrast, footer o elements estructurals.

### Criteri visual

La paleta té un punt amable i contemporani. Per evitar un resultat infantil o massa pla, cal combinar aquests colors amb molt blanc trencat, fotografia real de producte i una tipografia elegant. Els colors han de funcionar com a accents i blocs visuals, no tots alhora en la mateixa pantalla.

---

## 20. Tipografia

### Recomanació

Combinar una tipografia elegant per titulars amb una sans-serif llegible per textos.

### Opció 1

- Titulars: `Playfair Display` o similar.
- Textos: `Inter`, `Lato` o `Source Sans 3`.

### Opció 2

- Titulars: `Cormorant Garamond`.
- Textos: `Montserrat`.

### Criteri

- Títols grans, amb personalitat.
- Textos molt llegibles.
- Evitar un aspecte massa rústic o antiquat.
- La marca ha de semblar propera però també professional.

---

## 21. Iconografia

### Estil

- Icones lineals.
- Traç fi o mitjà.
- Sense excés de detall.
- Inspiració alimentària: cassola, cullera, fulla, plat, obrador, botiga, safata.

### Usos

- Canals professionals.
- Valors de qualitat.
- Procés productiu.
- Línies de negoci.

---

## 22. Fotografia i vídeo

### Estil fotogràfic

- Llum natural.
- Colors càlids.
- Plans detall de menjar.
- Mans cuinant.
- Producte real.
- Obrador net i professional.
- Botigues amb vida i proximitat.

### Imatges imprescindibles

1. Hero principal: plat o cuina amb molt impacte.
2. Obrador: procés productiu.
3. Producte: plats preparats.
4. Botiga: venda directa.
5. Equip o mans treballant.
6. Packaging o safates.

### Vídeo opcional

Un vídeo curt de 8-12 segons en loop pot funcionar molt bé al hero:

- Tallant ingredients.
- Remenant una cassola.
- Emplatant.
- Envasant producte.
- Obrador en moviment.

---

## 23. Animacions i moviment

### Principis

El moviment ha de reforçar la sensació de cuina viva, però sense convertir la web en una experiència pesada.

### Animacions recomanades

- Entrada suau dels blocs en fer scroll.
- Parallax lleuger en imatges grans.
- Slider lent al hero.
- Ingredients flotants molt subtils.
- Hover en targetes de producte.
- Línia de procés animada a la secció obrador.

### Evitar

- Animacions massa ràpides.
- Massa elements flotants alhora.
- Efectes que dificultin la lectura.
- Scroll artificial excessiu.

---

## 24. SEO bàsic

### Metatítols per idioma

#### Català

```txt
La Iaia | Cuina preparada i solucions alimentàries
```

#### Castellà

```txt
La Iaia | Cocina preparada y soluciones alimentarias
```

#### Anglès

```txt
La Iaia | Ready-made meals and food solutions
```

#### Francès

```txt
La Iaia | Plats préparés et solutions alimentaires
```

### Metadescripció en català

```txt
La Iaia és una empresa especialitzada en plats preparats, obrador alimentari, botigues i solucions gastronòmiques per a professionals i particulars.
```

### URLs recomanades

En una web multiidioma, millor utilitzar estructura per carpeta:

```txt
/ca/
/es/
/en/
/fr/
```

Exemples:

```txt
/ca/#obrador
/es/#obrador
/en/#workshop
/fr/#atelier
```

---

## 25. Accessibilitat

### Requisits mínims

- Bon contrast entre text i fons.
- Text alternatiu en totes les imatges.
- Botons clars i accessibles.
- Navegació per teclat.
- Evitar que el slider sigui imprescindible per entendre el contingut.
- Permetre lectura correcta en mòbil.
- No dependre només del color per transmetre informació.

---

## 26. Rendiment

### Recomanacions

- Optimitzar imatges en format WebP.
- Carregar el vídeo del hero només si és necessari.
- Lazy loading per imatges fora de pantalla.
- Evitar sliders massa pesats.
- Minimitzar JavaScript.
- Prioritzar una primera càrrega ràpida.

---

## 27. Estructura de continguts recomanada

```txt
/content
  ca.json
  es.json
  en.json
  fr.json

/assets
  /images
    hero-01.webp
    hero-02.webp
    obrador.webp
    botiga.webp
    producte-01.webp
    producte-02.webp
    producte-03.webp
  /video
    hero-cuina.mp4
  /icons
    obrador.svg
    botiga.svg
    qualitat.svg
    hostaleria.svg
    retail.svg
    distribucio.svg

/styles
  variables.css
  global.css
  animations.css
```

---

## 28. Estructura dels textos per idioma

Cada idioma hauria de seguir la mateixa estructura interna perquè sigui fàcil substituir textos.

```json
{
  "seo": {},
  "menu": {},
  "hero": {},
  "about": {},
  "businessLines": {},
  "products": {},
  "workshop": {},
  "channels": {},
  "shops": {},
  "quality": {},
  "gallery": {},
  "closing": {},
  "contact": {},
  "footer": {}
}
```

Això permet que el disseny sigui el mateix per a tots els idiomes i només canviï el contingut.

---

## 29. Components recomanats

### Header

Responsable de:

- Logo.
- Menú.
- Selector d’idioma.
- Estat sticky.
- Menú mòbil.

### Hero

Responsable de:

- Slider o vídeo.
- Títol principal.
- Botons.
- Elements flotants decoratius.

### SectionIntro

Component reutilitzable per a:

- Eyebrow.
- Títol.
- Text introductori.

### BusinessCard

Per mostrar:

- La Iaia Alimentació.
- La Iaia Botigues.

### ProductGrid

Per categories de producte.

### ProcessTimeline

Per mostrar el procés:

```txt
Recepta → Elaboració → Envasat → Distribució → Servei
```

### ContactForm

Formulari final.

---

## 30. Wireframe textual simplificat

```txt
[HEADER]
Logo La Iaia     La Iaia | Què fem | Obrador | Botigues | Qualitat | Contacte     CA ES EN FR

[HERO]
Imatge/vídeo potent de cuina
Cuina preparada amb ànima
La cuina de sempre, preparada per al món d’avui
[Conèixer La Iaia] [Contactar]

[QUI SOM]
Text corporatiu + imatge/collage

[DUES LÍNIES]
Card: La Iaia Alimentació     Card: La Iaia Botigues

[PRODUCTE]
Grid de categories gastronòmiques

[OBRADOR]
Imatge obrador + procés + punts forts

[CANALS]
Hostaleria | Retail | Col·lectivitats | Distribució | Empreses

[BOTIGUES]
Text + imatges + mapa/ubicacions

[QUALITAT]
Icones: seguretat | processos | matèries primeres | traçabilitat

[GALERIA]
Mosaic visual

[TANCAMENT]
Frase emocional + CTA

[CONTACTE]
Dades + formulari

[FOOTER]
Logo + legal + idiomes + xarxes
```

---

## 31. Copy base en català

Aquest copy ja incorpora els principals textos i idees dels documents aportats. Encara s’hauria d’ajustar amb dades reals finals, fotografies disponibles i decisió definitiva de nomenclatura La Iaia / La Yaya.

### Claims de marca disponibles

- El gust de la tradició, a punt per a la teva taula.
- Cuina de mercat amb el sabor casolà de sempre.
- La cuina que ens agrada, el menjar que et cuida.
- Ingredients de primera selecció per a un resultat excepcional.

### Hero

**Cuina preparada amb ànima**  
**La cuina de sempre, preparada per al món d’avui**  
Elaborem plats preparats amb sabor, ofici i confiança, des del nostre obrador fins a llars, botigues i professionals.

### Qui som

La Iaia és una empresa especialitzada en l’elaboració de plats preparats. Treballem des de l’ofici de la cuina tradicional i l’adaptem a les necessitats actuals de consum, distribució i servei.

Amb obrador propi i una proposta gastronòmica pensada per a diferents canals, oferim solucions alimentàries que combinen sabor, regularitat i confiança.

### La Iaia Alimentació

Produïm plats preparats i solucions de cinquena gamma per a clients professionals que necessiten producte segur, pràctic i adaptat al seu canal de venda o servei.

### La Iaia Botigues

Apropem la cuina preparada al consumidor final a través de botigues físiques, amb plats pensats per menjar bé sense renunciar a la comoditat.

### Obrador

Disposem d’un obrador industrial d’alta tecnologia dedicat a l’elaboració de plats cuinats de mercat en gran format. Des d’aquest espai transformem el receptari tradicional en una gamma àmplia de plats preparats, controlant cada fase del procés per garantir regularitat, seguretat i qualitat.

### Cinquena gamma

Elaborem productes de cinquena gamma pensats per facilitar la feina dels professionals de la restauració, l’hostaleria, el retail i les col·lectivitats. Plats i bases culinàries preparades perquè siguin fàcils de regenerar, estalviïn temps de preparació i mantinguin el sabor de la cuina casolana.

### Qualitat

La qualitat forma part de cada etapa: selecció, elaboració, envasat, conservació i servei. Treballem per oferir productes regulars, fiables i adaptats a les necessitats dels nostres clients.

### Tancament

Cuinem perquè menjar bé sigui més fàcil.

---

## 32. Notes importants per al desenvolupador

1. La web ha de funcionar com una **one page multiidioma**.
2. Els textos han d’estar separats per idioma en fitxers independents.
3. El selector d’idioma ha d’estar sempre visible, preferentment a la part superior dreta.
4. El disseny ha de permetre substituir fàcilment textos i imatges.
5. No s’han d’inventar dades quantitatives si no estan documentades.
6. El hero ha de tenir molta força visual, però sense penalitzar el rendiment.
7. El moviment ha de ser elegant i subtil.
8. La web ha de reflectir tant la part emocional de la cuina com la solidesa d’una empresa alimentària.
9. Cal preparar bé les etiquetes SEO per idioma.
10. El formulari de contacte ha de diferenciar consultes professionals i consultes de botigues.

---

## 33. Pendent de concretar

Un cop incorporada la informació dels documents aportats, queda validar o completar:

- Text corporatiu exacte de La Iaia.
- Història de l’empresa, si es vol incloure.
- Dades reals de l’obrador.
- Ubicació o ubicacions de botigues.
- Informació de contacte.
- Categories definitives de producte i si totes apareixen a la web o només en catàleg.
- Claims comercials aprovats legalment i per marca.
- Idiomes definitius.
- Fotografies reals disponibles.
- Logotip i manual de marca, si existeix.

