-- ============================================
-- LAYAYA D1 DATABASE SCHEMA
-- ============================================

-- CATEGORIES TABLE
CREATE TABLE IF NOT EXISTS categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS category_translations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  category_id INTEGER NOT NULL,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id),
  UNIQUE(category_id, language)
);

-- ALLERGENS TABLE
CREATE TABLE IF NOT EXISTS allergens (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS allergen_translations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  allergen_id INTEGER NOT NULL,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  FOREIGN KEY (allergen_id) REFERENCES allergens(id),
  UNIQUE(allergen_id, language)
);

-- PRODUCTS TABLE
CREATE TABLE IF NOT EXISTS products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  reference TEXT UNIQUE NOT NULL,
  color TEXT
);

CREATE TABLE IF NOT EXISTS product_translations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  product_id INTEGER NOT NULL,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  category_id INTEGER,
  description TEXT,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (category_id) REFERENCES categories(id),
  UNIQUE(product_id, language)
);

CREATE TABLE IF NOT EXISTS product_allergens (
  product_id INTEGER NOT NULL,
  allergen_id INTEGER NOT NULL,
  PRIMARY KEY (product_id, allergen_id),
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (allergen_id) REFERENCES allergens(id)
);

-- ============================================
-- INSERT CATEGORIES
-- ============================================

INSERT INTO categories (slug) VALUES
(''pasta-arros''),
(''peix''),
(''verdures''),
(''carns''),
(''rostits''),
(''horeca'');

-- Category Translations (Catalan)
INSERT INTO category_translations (category_id, language, name) VALUES
(1, ''ca'', ''Pasta i arròs''),
(2, ''ca'', ''Peix''),
(3, ''ca'', ''Verdures''),
(4, ''ca'', ''Carns''),
(5, ''ca'', ''Rostits''),
(6, ''ca'', ''Horeca/Foodservice'');

-- Category Translations (Spanish)
INSERT INTO category_translations (category_id, language, name) VALUES
(1, ''es'', ''Pasta y arroz''),
(2, ''es'', ''Pescado''),
(3, ''es'', ''Verduras''),
(4, ''es'', ''Carnes''),
(5, ''es'', ''Asados''),
(6, ''es'', ''Horeca/Foodservice'');

-- Category Translations (English)
INSERT INTO category_translations (category_id, language, name) VALUES
(1, ''en'', ''Pasta and Rice''),
(2, ''en'', ''Seafood''),
(3, ''en'', ''Vegetables''),
(4, ''en'', ''Meats''),
(5, ''en'', ''Roasted''),
(6, ''en'', ''Horeca/Foodservice'');

-- Category Translations (French)
INSERT INTO category_translations (category_id, language, name) VALUES
(1, ''fr'', ''Pâtes et riz''),
(2, ''fr'', ''Fruits de mer''),
(3, ''fr'', ''Légumes''),
(4, ''fr'', ''Viandes''),
(5, ''fr'', ''Rôtis''),
(6, ''fr'', ''Horeca/Foodservice'');

-- ============================================
-- INSERT ALLERGENS
-- ============================================

INSERT INTO allergens (slug) VALUES
(''gluten''),
(''lactis''),
(''ou''),
(''peix''),
(''crustacis''),
(''molluscs''),
(''soja''),
(''sulfits''),
(''fruits-secs'');

-- Allergen Translations (Catalan)
INSERT INTO allergen_translations (allergen_id, language, name) VALUES
(1, ''ca'', ''Gluten''),
(2, ''ca'', ''Lactis''),
(3, ''ca'', ''Ou''),
(4, ''ca'', ''Peix''),
(5, ''ca'', ''Crustacis''),
(6, ''ca'', ''Molluscs''),
(7, ''ca'', ''Soja''),
(8, ''ca'', ''Sulfits''),
(9, ''ca'', ''Fruits secs'');

-- Allergen Translations (Spanish)
INSERT INTO allergen_translations (allergen_id, language, name) VALUES
(1, ''es'', ''Gluten''),
(2, ''es'', ''Lácteos''),
(3, ''es'', ''Huevo''),
(4, ''es'', ''Pescado''),
(5, ''es'', ''Crustáceos''),
(6, ''es'', ''Moluscos''),
(7, ''es'', ''Soja''),
(8, ''es'', ''Sulfitos''),
(9, ''es'', ''Frutos secos'');

-- Allergen Translations (English)
INSERT INTO allergen_translations (allergen_id, language, name) VALUES
(1, ''en'', ''Gluten''),
(2, ''en'', ''Dairy''),
(3, ''en'', ''Egg''),
(4, ''en'', ''Fish''),
(5, ''en'', ''Crustaceans''),
(6, ''en'', ''Molluscs''),
(7, ''en'', ''Soy''),
(8, ''en'', ''Sulfites''),
(9, ''en'', ''Tree nuts'');

-- Allergen Translations (French)
INSERT INTO allergen_translations (allergen_id, language, name) VALUES
(1, ''fr'', ''Gluten''),
(2, ''fr'', ''Produits laitiers''),
(3, ''fr'', ''Oeuf''),
(4, ''fr'', ''Poisson''),
(5, ''fr'', ''Crustacés''),
(6, ''fr'', ''Mollusques''),
(7, ''fr'', ''Soja''),
(8, ''fr'', ''Sulfites''),
(9, ''fr'', ''Fruits à coque'');

-- ============================================
-- INSERT PRODUCTS
-- ============================================

-- PASTA I ARRÒS (Category 1)
INSERT INTO products (reference, color) VALUES
(''0031'', ''#FFA500''),  -- Fideuà marinera
(''0086'', ''#FFA500''),  -- Canelons de carn
(''0314'', ''#FFA500''),  -- Tallarins carbonara
(''0048'', ''#FFA500''),  -- Macarrons bolonyesa
(''0246'', ''#FFA500''),  -- Lassanya vegetal
(''0222'', ''#FFA500''),  -- Lassanya bolonyesa
(''1946'', ''#FFA500''),  -- Arròs de muntanya
(''0086b'', ''#FFA500''), -- Udon amb verdures i gambes
(''1670'', ''#FFA500'');  -- Noodles amb verdures i vedella

-- PESCAT (Category 2)
INSERT INTO products (reference, color) VALUES
(''1939'', ''#4A90E2''),  -- Pastís de tonyina
(''0208'', ''#4A90E2''),  -- Esqueixada de bacallà
(''0079'', ''#4A90E2''),  -- Paella de marisc
(''0307'', ''#4A90E2''),  -- Risotto de gambes i verdures
(''0253'', ''#4A90E2''),  -- Lluç amb salsa verda
(''1922'', ''#4A90E2''),  -- Bacallà amb pisto
(''0284'', ''#4A90E2'');  -- Popets encebats

-- VERDURES (Category 3)
INSERT INTO products (reference, color) VALUES
(''0017'', ''#50C878''),  -- Ensaladilla russa
(''0321'', ''#50C878''),  -- Trinxat de la Cerdanya
(''0178'', ''#50C878''),  -- Cigrons amb ou
(''0291'', ''#50C878''),  -- Risotto de bolets
(''1878'', ''#50C878'');  -- Croquetes de bolets

-- CARNS (Category 4)
INSERT INTO products (reference, color) VALUES
(''0024'', ''#FF7F50''),  -- Costelles de porc BBQ
(''0185'', ''#FF7F50''),  -- Aletes de pollastre BBQ
(''0277'', ''#FF7F50''),  -- Mandonguilles amb samfaina
(''1915'', ''#FF7F50''),  -- Estofat de vedella
(''0147'', ''#FF7F50''),  -- Galtes de vedella i patata
(''0192'', ''#FF7F50''),  -- Cua de bou i patata
(''8436'', ''#FF7F50''),  -- Callos de vedella
(''0215'', ''#FF7F50''),  -- Fabada Asturiana
(''0093'', ''#FF7F50''),  -- Llenties Riojana
(''0123'', ''#FF7F50''),  -- Fricandó de vedella
(''1885'', ''#FF7F50''),  -- Croquetes de pernil
(''1892'', ''#FF7F50''),  -- Croquetes de pollastre
(''1953'', ''#FF7F50'');  -- Hamburguesa

-- ROSTITS (Category 5)
INSERT INTO products (reference, color) VALUES
(''0338'', ''#2C2C2C''),  -- Pollastre a l''ast
(''0345'', ''#2C2C2C'');  -- Cuixa a l''ast amb patata

-- HORECA (Category 6)
INSERT INTO products (reference, color) VALUES
(''1960'', ''#9370DB''),  -- Gambes a l''allet
(''1953b'', ''#9370DB''); -- Cap i pota

-- ============================================
-- INSERT PRODUCT TRANSLATIONS (CATALAN)
-- ============================================

INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES
(1, ''ca'', 1, ''Fideuà marinera'', ''Plat típic de la nostra cuina, elaborat amb sèpia, sofregit casolà i el nostre fumet fet al xup-xup durant hores.''),
(2, ''ca'', 1, ''Canelons de carn'', ''Elaborats amb pollastre rostit al foc, beixamel lleugera i amb mozzarella per damunt. Només caldrà gratinar al forn o al microones a màxima potencia.''),
(3, ''ca'', 1, ''Tallarins carbonara'', ''Tallarins cuinats al seu punt de cocció, amb salsa carbonara feta amb formatge Grana-Padano i bacó curat.''),
(4, ''ca'', 1, ''Macarrons bolonyesa'', ''Recepta típica de totes les cases, els nostres macarrons bolonyesa no deixaran indiferent als petits i grans de la casa.''),
(5, ''ca'', 1, ''Lassanya vegetal'', ''Elaborada amb pasta fresca, i les millors verdures de temporada triades pel nostre cuiner, recoberta de beixamel i mozzarella.''),
(6, ''ca'', 1, ''Lassanya bolonyesa'', ''Elaborat tradicionalment amb la millor pasta fresca i la seva cremosa beixamel.''),
(7, ''ca'', 1, ''Arròs de muntanya'', ''Plat típic de la cuina catalana, amb un potent sofregit que ressalta tot el seu sabor, i amb bolets de temporada.''),
(8, ''ca'', 1, ''Udon amb verdures i gambes'', ''Plat típic de la cuina xinesa, fet amb verdures i gambes amb un toc de salsa teriayaki.''),
(9, ''ca'', 1, ''Noodles amb verdures i vedella'', ''Fideus de blat de sarraí que contè altes propietats de proteïna i fibra. Acompanyat de verdures i carn de vedella fa que sigui un plat nutricionalment molt equilibrat.''),
(10, ''ca'', 2, ''Pastís de tonyina'', ''Pastís fred de tonyina, ideal per a qualsevol època del any. Com entrant i plat principal.''),
(11, ''ca'', 2, ''Esqueixada de bacallà'', ''Plat típic de la cuina catalana amb ingredients frescos i de màxima qualitat.''),
(12, ''ca'', 2, ''Paella de marisc'', ''Elaborada amb calamar, gambes i musclos. Un plat típic de la nostra cuina, agafant com a base el nostre fumet de peix-casolà.''),
(13, ''ca'', 2, ''Risotto de gambes i verdures'', ''Recepta italiana, elaborada amb arròs carnaroli, verdures segons temporada, gambes i el formatge Grana-Padano de primera qualitat. Arrodonit amb un fumet de gambes vermelles que fa espectacular el conjunt.''),
(14, ''ca'', 2, ''Lluç amb salsa verda'', ''Plat típic del país basc, elaborat amb suprema de lluç, salsa verda i per acompanyar la clàssica patata panadera.''),
(15, ''ca'', 2, ''Bacallà amb pisto'', ''Bacallà cuinat manera tradicional amb pisto casolà.''),
(16, ''ca'', 2, ''Popets encebats'', ''Fets al xup-xup per donar-li una textura immillorable juntament amb la ceba caramelitzada a foc lent.''),
(17, ''ca'', 3, ''Ensaladilla russa'', ''Feta amb verdures de primera selecció i una salsa suau i cremosa.''),
(18, ''ca'', 3, ''Trinxat de la Cerdanya'', ''Plat tradicional de la Cerdanya, elaborat amb patata, col i d\''acompanyament cansalada saltejada.''),
(19, ''ca'', 3, ''Cigrons amb ou'', ''Recepta tradicionalment catalana, fet al xup xup i amb ou dur. Aconseguint un plat complet i ple de nutrients.''),
(20, ''ca'', 3, ''Risotto de bolets'', ''Recepta italiana, elaborada amb arròs carnaroli, bolets segons temporada i el formatge Grana-Padano de primera qualitat. Aromatitzat amb un brou de cocció lenta.''),
(21, ''ca'', 3, ''Croquetes de bolets'', ''Croquetes de xiitake, gírgola i nameko, aptes per a vegetarians i preparades amb 3 minuts. Sense necessitat de fregidora.''),
(22, ''ca'', 4, ''Costelles de porc BBQ'', ''Plat de la cuina tradicional americana. Cuinades durant 18 hores a baixa temperatura i banyades amb salsa barbacoa.''),
(23, ''ca'', 4, ''Aletes de pollastre BBQ'', ''Cruixents i sucoses així definim les nostres aletes de pollastre.''),
(24, ''ca'', 4, ''Mandonguilles amb samfaina'', ''Clàssiques mandonguilles fetes tradicionalment amb verdures seleccionades i el seu sofregit de tomàquet.''),
(25, ''ca'', 4, ''Estofat de vedella'', ''Cuinat a baixa temperatura durant hores per aconseguir la textura melosa de la carn.''),
(26, ''ca'', 4, ''Galtes de vedella i patata'', ''Elaborades a foc molt lent, caramelitzant la carn amb el seu propi suc i vi negre, acompanyat d\''un untuós parmentier de patata.''),
(27, ''ca'', 4, ''Cua de bou i patata'', ''Cuinades a baixa temperatura durant 18 hores, acompanyat d\''un purè de patata fet de forma tradicional i amb un toc especial.''),
(28, ''ca'', 4, ''Callos de vedella'', ''Elaborats artesanalment sense cap mena d\''additius ni conservants. Cuinat a foc lent durant 10 hores per aconseguir una textura cremosa i única.''),
(29, ''ca'', 4, ''Fabada Asturiana'', ''Plat típic de la cuina asturiana, elaborats amb faves i embolits asturians.''),
(30, ''ca'', 4, ''Llenties Riojana'', ''Plat típic de la cuina de Rioja, elaborat amb el millor embolit asturía. Cuinat al xup-xup durant hores, per donar el millor sabor.''),
(31, ''ca'', 4, ''Fricandó de vedella'', ''Plat tradicional de la cuina catalana, amb base de carn de bovi, bolets segons temporada i la salsa feta durant hores al xup-xup.''),
(32, ''ca'', 4, ''Croquetes de pernil'', ''Cruixents per fora i meloses per dins.''),
(33, ''ca'', 4, ''Croquetes de pollastre'', ''Croqueta de pollastre de tota la vida, però amb un toc last diferenciador.''),
(34, ''ca'', 4, ''Hamburguesa'', ''Hamburguesa de vedella 100%, amb formatge cheddar i acompanyada de maionesa i ketchup perquè puguis ficar-ho al teu gust. Hamburguesa illesta per menjar en 90 segons.''),
(35, ''ca'', 5, ''Pollastre a l\''ast'', ''Cuinat amb rostidor durant 2 hores per obtenir la màxima suculència per dins i mantenir el toc cruixent per fora. Una recepta familiar amb més de vint-i-cinc anys.''),
(36, ''ca'', 5, ''Cuixa a l\''ast amb patata'', ''Cuinada tradicionalment i acompanyada d\''una patata rostida amb un toc de picada d\''all i julivert.''),
(37, ''ca'', 6, ''Gambes a l\''allet'', ''Cuinades lentament amb oli d\''oliva verge extra, per extreure\''n el màxim el sabor de l\''all.''),
(38, ''ca'', 6, ''Cap i pota'', ''Plat típic de la cuina catalana, cuinat lentament en el qual s\''aconsegueix una textura sucosa.'');

-- ============================================
-- INSERT PRODUCT TRANSLATIONS (SPANISH)
-- ============================================

INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES
(1, ''es'', 1, ''Fideuà marinera'', ''Plato típico de nuestra cocina, elaborado con sepia, sofrito casero y nuestro fumet hecho al xup-xup durante horas.''),
(2, ''es'', 1, ''Canelones de carne'', ''Elaborados con pollo asado al fuego, bechamel ligera y con mozzarella por encima. Solo habrá que gratinar al horno o al microondas a máxima potencia.''),
(3, ''es'', 1, ''Tallarines carbonara'', ''Tallarines cocidos al su punto de cocción, con salsa carbonara hecha con queso Grana-Padano y bacon curado.''),
(4, ''es'', 1, ''Macarrones boloñesa'', ''Receta típica de todas las casas, nuestros macarrones boloñesa no dejarán indiferentes a grandes y pequeños de la casa.''),
(5, ''es'', 1, ''Lasaña vegetal'', ''Elaborada con pasta fresca, y las mejores verduras de temporada elegidas por nuestro cocinero, cubierta de bechamel y mozzarella.''),
(6, ''es'', 1, ''Lasaña boloñesa'', ''Elaborado tradicionalmente con la mejor pasta fresca y su cremosa bechamel.''),
(7, ''es'', 1, ''Arroz de montaña'', ''Plato típico de la cocina catalana, con un potente sofrito que resalta todo su sabor, y con setas de temporada.''),
(8, ''es'', 1, ''Udon con verduras y gambas'', ''Plato típico de la cocina china, hecho con verduras y gambas con un toque de salsa teriyaki.''),
(9, ''es'', 1, ''Noodles con verduras y ternera'', ''Fideos de trigo sarraceno que contiene altas propiedades de proteína y fibra. Acompañado de verduras y carne de ternera hace que sea un plato nutricionalmente muy equilibrado.''),
(10, ''es'', 2, ''Paté de atún'', ''Paté frío de atún, ideal para cualquier época del año. Como entrante y plato principal.''),
(11, ''es'', 2, ''Esqueixada de bacalao'', ''Plato típico de la cocina catalana con ingredientes frescos y de máxima calidad.''),
(12, ''es'', 2, ''Paella de marisco'', ''Elaborada con calamar, gambas y mejillones. Un plato típico de nuestra cocina, tomando como base nuestro fumet de pez casero.''),
(13, ''es'', 2, ''Risotto de gambas y verduras'', ''Receta italiana, elaborada con arroz carnaroli, verduras según temporada, gambas y el queso Grana-Padano de primera calidad. Rematado con un fumet de gambas rojas que hace espectacular el conjunto.''),
(14, ''es'', 2, ''Merluza con salsa verde'', ''Plato típico del país vasco, elaborado con suprema de merluza, salsa verde y para acompañar la clásica patata panadera.''),
(15, ''es'', 2, ''Bacalao con pisto'', ''Bacalao cocinado manera tradicional con pisto casero.''),
(16, ''es'', 2, ''Pulpitos guisados'', ''Hechos al xup-xup para darle una textura inmejorable juntamente con la cebolla caramelizada a fuego lento.''),
(17, ''es'', 3, ''Ensaladilla rusa'', ''Hecha con verduras de primera selección y una salsa suave y cremosa.''),
(18, ''es'', 3, ''Trinxat de la Cerdanya'', ''Plato tradicional de la Cerdanya, elaborado con patata, col y de acompañamiento tocino salteado.''),
(19, ''es'', 3, ''Garbanzos con huevo'', ''Receta tradicionalmente catalana, hecho al xup xup y con huevo duro. Consiguiendo un plato completo y lleno de nutrientes.''),
(20, ''es'', 3, ''Risotto de setas'', ''Receta italiana, elaborada con arroz carnaroli, setas según temporada y el queso Grana-Padano de primera calidad. Aromatizado con un caldo de cocción lenta.''),
(21, ''es'', 3, ''Croquetas de setas'', ''Croquetas de shiitake, seta de ostra y nameko, aptas para vegetarianos y preparadas con 3 minutos. Sin necesidad de freidora.''),
(22, ''es'', 4, ''Costillas de cerdo BBQ'', ''Plato de la cocina tradicional americana. Cocinadas durante 18 horas a baja temperatura y bañadas con salsa barbacoa.''),
(23, ''es'', 4, ''Alitas de pollo BBQ'', ''Crujientes y jugosas así definimos nuestras alitas de pollo.''),
(24, ''es'', 4, ''Albóndigas con samfaina'', ''Clásicas albóndigas hechas tradicionalmente con verduras seleccionadas y su sofrito de tomate.''),
(25, ''es'', 4, ''Estofado de ternera'', ''Cocinado a baja temperatura durante horas para conseguir la textura melosa de la carne.''),
(26, ''es'', 4, ''Mejillas de ternera y patata'', ''Elaboradas a fuego muy lento, caramelizando la carne con su propio jugo y vino tinto, acompañado de un sabroso parmentier de patata.''),
(27, ''es'', 4, ''Cola de buey y patata'', ''Cocinadas a baja temperatura durante 18 horas, acompañado de un puré de patata hecho de forma tradicional y con un toque especial.''),
(28, ''es'', 4, ''Callos de ternera'', ''Elaborados artesanalmente sin ningún tipo de aditivos ni conservantes. Cocinado a fuego lento durante 10 horas para conseguir una textura cremosa y única.''),
(29, ''es'', 4, ''Fabada Asturiana'', ''Plato típico de la cocina asturiana, elaborados con habas y embutidos asturianos.''),
(30, ''es'', 4, ''Lentejas Riojana'', ''Plato típico de la cocina de Rioja, elaborado con el mejor embutido asturiano. Cocinado al xup-xup durante horas, para dar el mejor sabor.''),
(31, ''es'', 4, ''Fricandó de ternera'', ''Plato tradicional de la cocina catalana, con base de carne de buey, setas según temporada y la salsa hecha durante horas al xup-xup.''),
(32, ''es'', 4, ''Croquetas de jamón'', ''Crujientes por fuera y cremosas por dentro.''),
(33, ''es'', 4, ''Croquetas de pollo'', ''Croqueta de pollo de toda la vida, pero con un toque last diferenciador.''),
(34, ''es'', 4, ''Hamburguesa'', ''Hamburguesa de ternera 100%, con queso cheddar y acompañada de mayonesa y ketchup para que puedas ficarlo a tu gusto. Hamburguesa lista para comer en 90 segundos.''),
(35, ''es'', 5, ''Pollo al horno'', ''Cocinado con asador durante 2 horas para obtener la máxima jugosidad por dentro y mantener el toque crujiente por fuera. Una receta familiar con más de veinticinco años.''),
(36, ''es'', 5, ''Muslo al horno con patata'', ''Cocinado tradicionalmente y acompañado de una patata asada con un toque de picada de ajo y perejil.''),
(37, ''es'', 6, ''Gambas al ajillo'', ''Cocinadas lentamente con aceite de oliva virgen extra, para extraer al máximo el sabor del ajo.''),
(38, ''es'', 6, ''Cabeza y pata'', ''Plato típico de la cocina catalana, cocinado lentamente en el cual se consigue una textura jugosa.'');

-- ============================================
-- INSERT PRODUCT TRANSLATIONS (ENGLISH)
-- ============================================

INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES
(1, ''en'', 1, ''Noodle Stew Marinière'', ''A typical dish from our cuisine, made with cuttlefish, homemade sofrito and our stock made in a slow cooker for hours.''),
(2, ''en'', 1, ''Cannelloni with Meat'', ''Made with roasted chicken, light béchamel and mozzarella on top. Just bake in the oven or microwave at full power.''),
(3, ''en'', 1, ''Tagliatelle Carbonara'', ''Tagliatelle cooked at the right point, with carbonara sauce made with Grana-Padano cheese and cured bacon.''),
(4, ''en'', 1, ''Bolognese Pasta'', ''Typical recipe from every house, our bolognese pasta will not leave anyone indifferent, neither children nor adults.''),
(5, ''en'', 1, ''Vegetable Lasagna'', ''Made with fresh pasta, and the best seasonal vegetables chosen by our chef, covered with béchamel and mozzarella.''),
(6, ''en'', 1, ''Bolognese Lasagna'', ''Traditionally made with the best fresh pasta and its creamy béchamel.''),
(7, ''en'', 1, ''Mountain Rice'', ''A typical dish from Catalan cuisine, with a powerful sofrito that brings out all its flavor, and with seasonal mushrooms.''),
(8, ''en'', 1, ''Udon with Vegetables and Prawns'', ''A typical Chinese cuisine dish, made with vegetables and prawns with a touch of teriyaki sauce.''),
(9, ''en'', 1, ''Noodles with Vegetables and Veal'', ''Buckwheat noodles that contain high protein and fiber properties. Accompanied with vegetables and veal makes it a nutritionally very balanced dish.''),
(10, ''en'', 2, ''Tuna Pâté'', ''Cold tuna pâté, ideal for any time of year. As an appetizer and main course.''),
(11, ''en'', 2, ''Cod Salad'', ''A typical dish from Catalan cuisine with fresh, top-quality ingredients.''),
(12, ''en'', 2, ''Seafood Paella'', ''Made with squid, prawns and mussels. A typical dish from our cuisine, based on our homemade fish stock.''),
(13, ''en'', 2, ''Prawn and Vegetable Risotto'', ''Italian recipe, made with carnaroli rice, seasonal vegetables, prawns and first-class Grana-Padano cheese. Finished with a red prawn stock that makes the whole dish spectacular.''),
(14, ''en'', 2, ''Hake with Green Sauce'', ''A typical Basque Country dish, made with hake supreme, green sauce and to accompany the classic pan-fried potato.''),
(15, ''en'', 2, ''Cod with Pisto'', ''Cod cooked in a traditional way with homemade pisto.''),
(16, ''en'', 2, ''Stewed Octopus'', ''Made in a slow cooker to give it an unbeatable texture together with caramelized onion cooked slowly.''),
(17, ''en'', 3, ''Russian Salad'', ''Made with first-class vegetables and a soft, creamy sauce.''),
(18, ''en'', 3, ''Trinxat from Cerdanya'', ''Traditional dish from Cerdanya, made with potato, cabbage and accompanied with sautéed bacon.''),
(19, ''en'', 3, ''Chickpeas with Egg'', ''Traditionally Catalan recipe, made in a slow cooker and with hard-boiled egg. Achieving a complete and nutrient-rich dish.''),
(20, ''en'', 3, ''Mushroom Risotto'', ''Italian recipe, made with carnaroli rice, seasonal mushrooms and first-class Grana-Padano cheese. Aromatic with a slow-cooked broth.''),
(21, ''en'', 3, ''Mushroom Croquettes'', ''Croquettes with shiitake, oyster mushroom and nameko, suitable for vegetarians and prepared with 3 minutes. No need for a deep fryer.''),
(22, ''en'', 4, ''BBQ Pork Ribs'', ''Dish from traditional American cuisine. Cooked for 18 hours at low temperature and bathed in barbecue sauce.''),
(23, ''en'', 4, ''BBQ Chicken Wings'', ''Crispy and juicy is how we define our chicken wings.''),
(24, ''en'', 4, ''Meatballs with Samfaina'', ''Classic meatballs made traditionally with selected vegetables and tomato sofrito.''),
(25, ''en'', 4, ''Veal Stew'', ''Cooked at low temperature for hours to achieve the soft texture of the meat.''),
(26, ''en'', 4, ''Veal Cheeks and Potato'', ''Made over very low heat, caramelizing the meat with its own juice and red wine, accompanied by a savory potato parmentier.''),
(27, ''en'', 4, ''Oxtail and Potato'', ''Cooked at low temperature for 18 hours, accompanied by a potato purée made in a traditional way and with a special touch.''),
(28, ''en'', 4, ''Veal Tripe'', ''Made artisanally without any additives or preservatives. Cooked over low heat for 10 hours to achieve a creamy and unique texture.''),
(29, ''en'', 4, ''Asturian Bean Stew'', ''Typical Asturian cuisine dish, made with beans and Asturian sausages.''),
(30, ''en'', 4, ''Rioja Lentils'', ''Typical dish from Rioja cuisine, made with the best Asturian sausage. Cooked in a slow cooker for hours, to give the best flavor.''),
(31, ''en'', 4, ''Veal Fricandó'', ''Traditional Catalan cuisine dish, with beef base, seasonal mushrooms and sauce made for hours in a slow cooker.''),
(32, ''en'', 4, ''Ham Croquettes'', ''Crispy outside and creamy inside.''),
(33, ''en'', 4, ''Chicken Croquettes'', ''Classic chicken croquettes, but with a special differentiating touch.''),
(34, ''en'', 4, ''Hamburger'', ''100% veal hamburger, with cheddar cheese and accompanied by mayonnaise and ketchup so you can add it to your taste. Ready to eat hamburger in 90 seconds.''),
(35, ''en'', 5, ''Roasted Chicken'', ''Cooked with a rotisserie for 2 hours to achieve maximum juiciness inside and maintain the crispy touch outside. A family recipe with more than twenty-five years.''),
(36, ''en'', 5, ''Roasted Thigh with Potato'', ''Cooked traditionally and accompanied with a roasted potato with a touch of garlic and parsley picada.''),
(37, ''en'', 6, ''Garlic Prawns'', ''Cooked slowly with extra virgin olive oil, to extract the maximum garlic flavor.''),
(38, ''en'', 6, ''Head and Paw'', ''Typical Catalan cuisine dish, cooked slowly in which a juicy texture is achieved.'');

-- ============================================
-- INSERT PRODUCT TRANSLATIONS (FRENCH)
-- ============================================

INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES
(1, ''fr'', 1, ''Fideuà marinière'', ''Un plat typique de notre cuisine, préparé avec de la seiche, un sofrito maison et notre bouillon préparé à la cocotte minute pendant des heures.''),
(2, ''fr'', 1, ''Cannelloni à la viande'', ''Préparés avec du poulet rôti au feu, une béchamel légère et de la mozzarella par-dessus. Il suffit de gratin au four ou au micro-ondes à puissance maximale.''),
(3, ''fr'', 1, ''Tagliatelles à la carbonara'', ''Tagliatelles cuites à point, avec une sauce carbonara préparée avec du fromage Grana-Padano et du bacon fumé.''),
(4, ''fr'', 1, ''Pâtes à la bolognaise'', ''Recette typique de tous les foyers, nos pâtes à la bolognaise ne laisseront personne indifférent, ni les enfants ni les adultes.''),
(5, ''fr'', 1, ''Lasagnes végétales'', ''Préparées avec des pâtes fraîches, et les meilleures légumes de saison choisis par notre chef, recouvertes de béchamel et de mozzarella.''),
(6, ''fr'', 1, ''Lasagnes à la bolognaise'', ''Traditionnellement préparées avec les meilleures pâtes fraîches et sa béchamel crémeuse.''),
(7, ''fr'', 1, ''Riz de montagne'', ''Un plat typique de la cuisine catalane, avec un sofrito puissant qui met en avant toute sa saveur, et avec des champignons de saison.''),
(8, ''fr'', 1, ''Udon aux légumes et crevettes'', ''Un plat typique de la cuisine chinoise, préparé avec des légumes et des crevettes avec une touche de sauce teriyaki.''),
(9, ''fr'', 1, ''Nouilles aux légumes et veau'', ''Nouilles de sarrasin qui contiennent des propriétés élevées en protéines et en fibres. Accompagnées de légumes et de veau, cela en fait un plat très équilibré sur le plan nutritionnel.''),
(10, ''fr'', 2, ''Pâté de thon'', ''Pâté de thon froid, idéal pour toute époque de l\''année. En tant qu\''entrée et plat principal.''),
(11, ''fr'', 2, ''Salade de morue'', ''Un plat typique de la cuisine catalane avec des ingrédients frais et de qualité supérieure.''),
(12, ''fr'', 2, ''Paella aux fruits de mer'', ''Préparée avec du calmar, des crevettes et des moules. Un plat typique de notre cuisine, basé sur notre bouillon de poisson maison.''),
(13, ''fr'', 2, ''Risotto aux crevettes et légumes'', ''Recette italienne, préparée avec du riz carnaroli, des légumes de saison, des crevettes et du fromage Grana-Padano de première qualité. Finalisé avec un bouillon de crevettes rouges qui rend le plat spectaculaire.''),
(14, ''fr'', 2, ''Lieu à la sauce verte'', ''Un plat typique du Pays basque, préparé avec du lieu, une sauce verte et accompagné de la classique pomme de terre poêlée.''),
(15, ''fr'', 2, ''Morue au pisto'', ''Morue cuite de manière traditionnelle avec du pisto maison.''),
(16, ''fr'', 2, ''Poulpe en ragoût'', ''Préparé à la cocotte minute pour lui donner une texture inégalée avec de l\''oignon caramélisé cuit lentement.''),
(17, ''fr'', 3, ''Salade russe'', ''Préparée avec des légumes de première qualité et une sauce douce et crémeuse.''),
(18, ''fr'', 3, ''Trinxat de Cerdanya'', ''Plat traditionnel de Cerdanya, préparé avec de la pomme de terre, du chou et accompagné de lard poêlé.''),
(19, ''fr'', 3, ''Pois chiches aux œufs'', ''Recette traditionnellement catalane, préparée à la cocotte minute et avec un œuf dur. Obtenant un plat complet et riche en nutriments.''),
(20, ''fr'', 3, ''Risotto aux champignons'', ''Recette italienne, préparée avec du riz carnaroli, des champignons de saison et du fromage Grana-Padano de première qualité. Aromatisé avec un bouillon cuit lentement.''),
(21, ''fr'', 3, ''Croquettes de champignons'', ''Croquettes avec champignon de Paris, champignon de couche et nameko, convenant aux végétariens et préparées en 3 minutes. Pas besoin de friteuse.''),
(22, ''fr'', 4, ''Côtes de porc BBQ'', ''Plat de la cuisine traditionnelle américaine. Cuites pendant 18 heures à basse température et baignées dans une sauce barbecue.''),
(23, ''fr'', 4, ''Ailes de poulet BBQ'', ''Croustillantes et juteuses, c\''est ainsi que nous décrivons nos ailes de poulet.''),
(24, ''fr'', 4, ''Boulettes de viande avec samfaina'', ''Classiques boulettes de viande préparées traditionnellement avec des légumes sélectionnés et un sofrito de tomate.''),
(25, ''fr'', 4, ''Ragoût de veau'', ''Cuit à basse température pendant des heures pour obtenir la texture tendre de la viande.''),
(26, ''fr'', 4, ''Joues de veau et pomme de terre'', ''Préparées à très basse température, caramélisant la viande avec son propre jus et vin rouge, accompagnées d\''une savoureuse pommes de terre parmentier.''),
(27, ''fr'', 4, ''Queue de bœuf et pomme de terre'', ''Cuites à basse température pendant 18 heures, accompagnées d\''une purée de pomme de terre préparée de manière traditionnelle et avec une touche spéciale.''),
(28, ''fr'', 4, ''Tripes de veau'', ''Préparées artisanalement sans aucun additif ni conservateur. Cuites à feu doux pendant 10 heures pour obtenir une texture crémeuse et unique.''),
(29, ''fr'', 4, ''Fabada Asturienne'', ''Plat typique de la cuisine asturienne, préparé avec des fèves et des saucisses asturiennes.''),
(30, ''fr'', 4, ''Lentilles à la Rioja'', ''Plat typique de la cuisine de Rioja, préparé avec la meilleure saucisse asturienne. Cuit à la cocotte minute pendant des heures, pour donner le meilleur goût.''),
(31, ''fr'', 4, ''Fricandeau de veau'', ''Plat traditionnel de la cuisine catalane, à base de bœuf, champignons de saison et sauce cuite pendant des heures à la cocotte minute.''),
(32, ''fr'', 4, ''Croquettes de jambon'', ''Croustillantes à l\''extérieur et crémeuses à l\''intérieur.''),
(33, ''fr'', 4, ''Croquettes de poulet'', ''Croquettes de poulet classiques, mais avec une touche différenciatrice spéciale.''),
(34, ''fr'', 4, ''Hamburger'', ''Hamburger 100% veau, avec fromage cheddar et accompagné de mayonnaise et de ketchup pour que vous puissiez l\''ajouter à votre goût. Hamburger prêt à manger en 90 secondes.''),
(35, ''fr'', 5, ''Poulet rôti'', ''Cuit à la broche pendant 2 heures pour obtenir un maximum de jutosité à l\''intérieur et maintenir le toucher croustillant à l\''extérieur. Une recette familiale avec plus de vingt-cinq ans.''),
(36, ''fr'', 5, ''Cuisse rôtie avec pomme de terre'', ''Cuite traditionnellement et accompagnée d\''une pomme de terre rôtie avec une touche de picada d\''ail et de persil.''),
(37, ''fr'', 6, ''Crevettes à l\''ail'', ''Cuites lentement avec de l\''huile d\''olive vierge extra, pour extraire au maximum la saveur de l\''ail.''),
(38, ''fr'', 6, ''Tête et patte'', ''Plat typique de la cuisine catalane, cuit lentement dans lequel une texture juteuse est obtenue.'');

-- ============================================
-- INSERT PRODUCT_ALLERGENS RELATIONSHIPS
-- ============================================

-- Fideuà marinera (0031) - gluten(1), crustacis(5), peix(4), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (1, 1), (1, 4), (1, 5), (1, 8);

-- Canelons de carn (0086) - gluten(1), lactis(2), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (2, 1), (2, 2), (2, 8);

-- Tallarins carbonara (0314) - gluten(1), lactis(2), soja(7), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (3, 1), (3, 2), (3, 7), (3, 8);

-- Macarrons bolonyesa (0048) - gluten(1), sulfits(8), soja(7)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (4, 1), (4, 7), (4, 8);

-- Lassanya vegetal (0246) - gluten(1), lactis(2), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (5, 1), (5, 2), (5, 8);

-- Lassanya bolonyesa (0222) - gluten(1), lactis(2), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (6, 1), (6, 2), (6, 8);

-- Arròs de muntanya (1946) - sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (7, 8);

-- Udon amb verdures i gambes (0086b) - gluten(1), lactis(2), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (8, 1), (8, 2), (8, 8);

-- Noodles amb verdures i vedella (1670) - gluten(1), soja(7), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (9, 1), (9, 7), (9, 8);

-- Pastís de tonyina (1939) - gluten(1), ou(3), lactis(2)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (10, 1), (10, 3), (10, 2);

-- Esqueixada de bacallà (0208) - peix(4)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (11, 4);

-- Paella de marisc (0079) - peix(4), crustacis(5), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (12, 4), (12, 5), (12, 8);

-- Risotto de gambes i verdures (0307) - lactis(2), crustacis(5), molluscs(6), peix(4), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (13, 2), (13, 5), (13, 6), (13, 4), (13, 8);

-- Lluç amb salsa verda (0253) - peix(4), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (14, 4), (14, 8);

-- Bacallà amb pisto (1922) - peix(4)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (15, 4);

-- Popets encebats (0284) - molluscs(6), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (16, 6), (16, 8);

-- Ensaladilla russa (0017) - ou(3), peix(4), lactis(2)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (17, 3), (17, 4), (17, 2);

-- Trinxat de la Cerdanya (0321) - (sense alergens no especificats)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (18, 8);

-- Cigrons amb ou (0178) - gluten(1), ou(3), sulfits(8), fruits-secs(9)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (19, 1), (19, 3), (19, 8), (19, 9);

-- Risotto de bolets (0291) - lactis(2), sulfits(8), soja(7)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (20, 2), (20, 8), (20, 7);

-- Croquetes de bolets (1878) - gluten(1), ou(3), lactis(2), llet(2)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (21, 1), (21, 3), (21, 2);

-- Costelles de porc BBQ (0024) - sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (22, 8);

-- Aletes de pollastre BBQ (0185) - sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (23, 8);

-- Mandonguilles amb samfaina (0277) - soja(7), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (24, 7), (24, 8);

-- Estofat de vedella (1915) - sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (25, 8);

-- Galtes de vedella i patata (0147) - soja(7), gluten(1), lactis(2), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (26, 7), (26, 1), (26, 2), (26, 8);

-- Cua de bou i patata (0192) - soja(7), gluten(1), lactis(2), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (27, 7), (27, 1), (27, 2), (27, 8);

-- Callos de vedella (8436) - sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (28, 8);

-- Fabada Asturiana (0215) - sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (29, 8);

-- Llenties Riojana (0093) - sulfits(8), soja(7)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (30, 8), (30, 7);

-- Fricandó de vedella (0123) - gluten(1), sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (31, 1), (31, 8);

-- Croquetes de pernil (1885) - gluten(1), ou(3), lactis(2), llet(2)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (32, 1), (32, 3), (32, 2);

-- Croquetes de pollastre (1892) - gluten(1), ou(3), lactis(2), llet(2)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (33, 1), (33, 3), (33, 2);

-- Hamburguesa (1953) - gluten(1), lactis(2)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (34, 1), (34, 2);

-- Pollastre a l''ast (0338) - (sense alergens)
-- (no allergens specified in PDF)

-- Cuixa a l''ast amb patata (0345) - (sense alergens)
-- (no allergens specified in PDF)

-- Gambes a l''allet (1960) - crustacis(5)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (37, 5);

-- Cap i pota (1953b) - sulfits(8)
INSERT INTO product_allergens (product_id, allergen_id) VALUES (38, 8);
