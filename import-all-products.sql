-- Insert remaining products with translations
-- PASTA I ARROS (Category 1)

INSERT INTO products (reference, color) VALUES ('0314', '#FFA500');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (3, 'ca', 1, 'Tallarins carbonara', 'Tallarins cuinats al seu punt de coccio amb salsa carbonara feta amb formatge Grana-Padano');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (3, 'es', 1, 'Tallarines carbonara', 'Tallarines cocidos al su punto de coccio con salsa carbonara hecha con queso Grana-Padano');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (3, 'en', 1, 'Tagliatelle Carbonara', 'Tagliatelle cooked at the right point with carbonara sauce made with Grana-Padano cheese');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (3, 'fr', 1, 'Tagliatelles carbonara', 'Tagliatelles cuites a point avec sauce carbonara preparee avec fromage Grana-Padano');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (3, 1), (3, 2);

INSERT INTO products (reference, color) VALUES ('0048', '#FFA500');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (4, 'ca', 1, 'Macarrons bolonyesa', 'Recepta tipica de totes les cases, els nostres macarrons bolonyesa no deixaran indiferent');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (4, 'es', 1, 'Macarrones bolognesa', 'Receta tipica de todas las casas, nuestros macarrones bolognesa no dejaran indiferentes');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (4, 'en', 1, 'Bolognese Pasta', 'Typical recipe, our bolognese pasta will not leave anyone indifferent');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (4, 'fr', 1, 'Pates a la bolognaise', 'Recette typique, nos pates a la bolognaise ne laisseront personne indifferent');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (4, 1), (4, 7);

INSERT INTO products (reference, color) VALUES ('0246', '#FFA500');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (5, 'ca', 1, 'Lassanya vegetal', 'Elaborada amb pasta fresca i les millors verdures de temporada recoberta de beixamel');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (5, 'es', 1, 'Lasana vegetal', 'Elaborada con pasta fresca y las mejores verduras de temporada cubierta de bechamel');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (5, 'en', 1, 'Vegetable Lasagna', 'Made with fresh pasta and best seasonal vegetables covered with bechamel');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (5, 'fr', 1, 'Lasagnes vegetales', 'Preparees avec pates fraiches et meilleures legumes de saison recouvertes de bechamel');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (5, 1), (5, 2);

INSERT INTO products (reference, color) VALUES ('0222', '#FFA500');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (6, 'ca', 1, 'Lassanya bolonyesa', 'Elaborat tradicionalment amb la millor pasta fresca i la seva cremosa beixamel');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (6, 'es', 1, 'Lasana bolognesa', 'Elaborado tradicionalmente con la mejor pasta fresca y su cremosa bechamel');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (6, 'en', 1, 'Bolognese Lasagna', 'Traditionally made with best fresh pasta and creamy bechamel');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (6, 'fr', 1, 'Lasagnes a la bolognaise', 'Elaborees traditionnellement avec meilleures pates fraiches et sa bechamel onctueuse');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (6, 1), (6, 2);

INSERT INTO products (reference, color) VALUES ('1946', '#FFA500');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (7, 'ca', 1, 'Arros de muntanya', 'Plat tipic de la cuina catalana amb un potent sofregit que ressalta tot el seu sabor');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (7, 'es', 1, 'Arroz de montana', 'Plato tipico de la cocina catalana con un potente sofrito que resalta todo su sabor');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (7, 'en', 1, 'Mountain Rice', 'Typical Catalan dish with powerful sofrito that brings out all its flavor');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (7, 'fr', 1, 'Riz de montagne', 'Plat typique de cuisine catalane avec sofrito puissant qui met en avant sa saveur');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (7, 8);

INSERT INTO products (reference, color) VALUES ('0086b', '#FFA500');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (8, 'ca', 1, 'Udon amb verdures i gambes', 'Plat tipic de la cuina xinesa fet amb verdures i gambes amb un toc de salsa teriayaki');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (8, 'es', 1, 'Udon con verduras y gambas', 'Plato tipico de la cocina china hecho con verduras y gambas con un toque de salsa teriyaki');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (8, 'en', 1, 'Udon with Vegetables and Prawns', 'Typical Chinese dish made with vegetables and prawns with touch of teriyaki sauce');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (8, 'fr', 1, 'Udon aux legumes et crevettes', 'Plat typique de cuisine chinoise prepare avec legumes et crevettes avec touche sauce teriyaki');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (8, 1), (8, 2);

INSERT INTO products (reference, color) VALUES ('1670', '#FFA500');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (9, 'ca', 1, 'Noodles amb verdures i vedella', 'Fideus de blat de sarrai que conte altes propietats de proteina i fibra');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (9, 'es', 1, 'Noodles con verduras y ternera', 'Fideos de trigo sarraceno que contiene altas propiedades de proteina y fibra');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (9, 'en', 1, 'Noodles with Vegetables and Veal', 'Buckwheat noodles with high protein and fiber properties');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (9, 'fr', 1, 'Nouilles aux legumes et veau', 'Nouilles de sarrasin qui contient proprietes elevees en proteines et fibres');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (9, 1), (9, 7);

-- PESCAT (Category 2)

INSERT INTO products (reference, color) VALUES ('1939', '#4A90E2');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (10, 'ca', 2, 'Pastis de tonyina', 'Pastis fred de tonyina ideal per a qualsevol epoca de l any');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (10, 'es', 2, 'Pate de atun', 'Pate frio de atun ideal para cualquier epoca del ano');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (10, 'en', 2, 'Tuna Pate', 'Cold tuna pate ideal for any time of year');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (10, 'fr', 2, 'Pate de thon', 'Pate froid de thon ideal pour toute epoque de l annee');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (10, 1), (10, 2), (10, 3);

INSERT INTO products (reference, color) VALUES ('0208', '#4A90E2');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (11, 'ca', 2, 'Esqueixada de bacalla', 'Plat tipic de la cuina catalana amb ingredients frescos i de maxima qualitat');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (11, 'es', 2, 'Esqueixada de bacalao', 'Plato tipico de la cocina catalana con ingredientes frescos y de maxima calidad');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (11, 'en', 2, 'Cod Salad', 'Typical Catalan dish with fresh top-quality ingredients');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (11, 'fr', 2, 'Salade de morue', 'Plat typique de cuisine catalane avec ingredients frais et qualite superieure');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (11, 4);

INSERT INTO products (reference, color) VALUES ('0079', '#4A90E2');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (12, 'ca', 2, 'Paella de marisc', 'Elaborada amb calamar gambes i musclos amb el nostre fumet de peix');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (12, 'es', 2, 'Paella de marisco', 'Elaborada con calamar gambas y mejillones con nuestro fumet de pez');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (12, 'en', 2, 'Seafood Paella', 'Made with squid prawns and mussels with our fish stock');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (12, 'fr', 2, 'Paella aux fruits de mer', 'Preparee avec calmar crevettes et moules avec notre bouillon de pez');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (12, 4), (12, 5);

INSERT INTO products (reference, color) VALUES ('0307', '#4A90E2');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (13, 'ca', 2, 'Risotto de gambes i verdures', 'Recepta italiana elaborada amb arros carnaroli verdures gambes i formatge Grana-Padano');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (13, 'es', 2, 'Risotto de gambas y verduras', 'Receta italiana elaborada con arroz carnaroli verduras gambas y queso Grana-Padano');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (13, 'en', 2, 'Prawn and Vegetable Risotto', 'Italian recipe made with carnaroli rice vegetables prawns and Grana-Padano cheese');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (13, 'fr', 2, 'Risotto aux crevettes et legumes', 'Recette italienne elaboree avec riz carnaroli legumes crevettes et fromage Grana-Padano');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (13, 2), (13, 5), (13, 6);

INSERT INTO products (reference, color) VALUES ('0253', '#4A90E2');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (14, 'ca', 2, 'Lluc amb salsa verda', 'Plat tipic del pais basc elaborat amb suprema de lluc salsa verda i patata panadera');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (14, 'es', 2, 'Merluza con salsa verde', 'Plato tipico del pais vasco elaborado con suprema de merluza salsa verde y patata panadera');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (14, 'en', 2, 'Hake with Green Sauce', 'Typical Basque dish made with hake green sauce and pan-fried potato');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (14, 'fr', 2, 'Lieu a la sauce verte', 'Plat typique du Pays basque elabore avec lieu sauce verte et patate poele');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (14, 4);

INSERT INTO products (reference, color) VALUES ('1922', '#4A90E2');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (15, 'ca', 2, 'Bacalla amb pisto', 'Bacalla cuinada manera tradicional amb pisto casolà');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (15, 'es', 2, 'Bacalao con pisto', 'Bacalao cocinado manera tradicional con pisto casero');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (15, 'en', 2, 'Cod with Pisto', 'Cod cooked in traditional way with homemade pisto');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (15, 'fr', 2, 'Morue au pisto', 'Morue cuite de maniere traditionnelle avec pisto maison');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (15, 4);

INSERT INTO products (reference, color) VALUES ('0284', '#4A90E2');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (16, 'ca', 2, 'Popets encebats', 'Fets al xup-xup per donar-li una textura immillorable amb ceba caramelitzada');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (16, 'es', 2, 'Pulpitos guisados', 'Hechos al xup-xup para darle una textura inmejorable con cebolla caramelizada');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (16, 'en', 2, 'Stewed Octopus', 'Made in slow cooker for unbeatable texture with caramelized onion');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (16, 'fr', 2, 'Poulpe en ragout', 'Prepare a la cocotte minute pour textura imbattable avec oignon caramelize');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (16, 6);

-- VERDURES (Category 3)

INSERT INTO products (reference, color) VALUES ('0017', '#50C878');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (17, 'ca', 3, 'Ensaladilla russa', 'Feta amb verdures de primera seleccio i una salsa suau i cremosa');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (17, 'es', 3, 'Ensaladilla rusa', 'Hecha con verduras de primera seleccio y una salsa suave y cremosa');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (17, 'en', 3, 'Russian Salad', 'Made with first-class vegetables and soft creamy sauce');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (17, 'fr', 3, 'Salade russe', 'Faite avec legumes de premiere selection et sauce douce et onctueuse');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (17, 3), (17, 4), (17, 2);

INSERT INTO products (reference, color) VALUES ('0321', '#50C878');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (18, 'ca', 3, 'Trinxat de la Cerdanya', 'Plat tradicional elaborat amb patata col i cansalada saltejada');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (18, 'es', 3, 'Trinxat de la Cerdanya', 'Plato tradicional elaborado con patata col y tocino salteado');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (18, 'en', 3, 'Trinxat from Cerdanya', 'Traditional dish made with potato cabbage and sauteed bacon');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (18, 'fr', 3, 'Trinxat de Cerdanya', 'Plat traditionnel elabore avec patata col et lard saute');

INSERT INTO products (reference, color) VALUES ('0178', '#50C878');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (19, 'ca', 3, 'Cigrons amb ou', 'Recepta tradicionalment catalana fet al xup xup i amb ou dur');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (19, 'es', 3, 'Garbanzos con huevo', 'Receta tradicionalmente catalana hecho al xup xup y con huevo duro');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (19, 'en', 3, 'Chickpeas with Egg', 'Traditionally Catalan recipe made in slow cooker with hard-boiled egg');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (19, 'fr', 3, 'Pois chiches aux oeufs', 'Recette traditionellement catalane faite a la cocotte minute et oeuf dur');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (19, 1), (19, 3), (19, 8), (19, 9);

INSERT INTO products (reference, color) VALUES ('0291', '#50C878');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (20, 'ca', 3, 'Risotto de bolets', 'Recepta italiana elaborada amb arros carnaroli bolets i formatge Grana-Padano');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (20, 'es', 3, 'Risotto de setas', 'Receta italiana elaborada con arroz carnaroli setas y queso Grana-Padano');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (20, 'en', 3, 'Mushroom Risotto', 'Italian recipe made with carnaroli rice mushrooms and Grana-Padano cheese');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (20, 'fr', 3, 'Risotto aux champignons', 'Recette italienne elaboree avec riz carnaroli champignons et fromage Grana-Padano');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (20, 2), (20, 8), (20, 7);

INSERT INTO products (reference, color) VALUES ('1878', '#50C878');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (21, 'ca', 3, 'Croquetes de bolets', 'Croquetes de xiitake girgola i nameko aptes per a vegetarians');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (21, 'es', 3, 'Croquetas de setas', 'Croquetas de shiitake seta de ostra y nameko aptas para vegetarianos');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (21, 'en', 3, 'Mushroom Croquettes', 'Croquettes with shiitake oyster mushroom and nameko suitable for vegetarians');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (21, 'fr', 3, 'Croquettes de champignons', 'Croquettes avec champignon de Paris champignon de couche et nameko convenant aux vegetariens');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (21, 1), (21, 3), (21, 2);

-- CARNS (Category 4)

INSERT INTO products (reference, color) VALUES ('0024', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (22, 'ca', 4, 'Costelles de porc BBQ', 'Cuinades durant 18 hores a baixa temperatura i banyades amb salsa barbacoa');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (22, 'es', 4, 'Costillas de cerdo BBQ', 'Cocinadas durante 18 horas a baja temperatura y banadas con salsa barbacoa');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (22, 'en', 4, 'BBQ Pork Ribs', 'Cooked for 18 hours at low temperature and bathed in barbecue sauce');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (22, 'fr', 4, 'Cotes de porc BBQ', 'Cuites pendant 18 heures a basse temperature et baignees dans sauce barbecue');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (22, 8);

INSERT INTO products (reference, color) VALUES ('0185', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (23, 'ca', 4, 'Aletes de pollastre BBQ', 'Cruixents i sucoses així definim les nostres aletes de pollastre');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (23, 'es', 4, 'Alitas de pollo BBQ', 'Crujientes y jugosas asi definimos nuestras alitas de pollo');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (23, 'en', 4, 'BBQ Chicken Wings', 'Crispy and juicy is how we define our chicken wings');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (23, 'fr', 4, 'Ailes de poulet BBQ', 'Croustillantes et juteuses c est ainsi que nous decrivons nos ailes de poulet');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (23, 8);

INSERT INTO products (reference, color) VALUES ('0277', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (24, 'ca', 4, 'Mandonguilles amb samfaina', 'Mandonguilles fetes tradicionalment amb verdures seleccionades i sofregit de tomàquet');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (24, 'es', 4, 'Albondigas con samfaina', 'Albondigas hechas tradicionalmente con verduras seleccionadas y sofrito de tomate');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (24, 'en', 4, 'Meatballs with Samfaina', 'Meatballs made traditionally with selected vegetables and tomato sofrito');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (24, 'fr', 4, 'Boulettes de viande avec samfaina', 'Boulettes de viande preparees traditionnellement avec legumes selectionnes et sofrito tomate');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (24, 7), (24, 8);

INSERT INTO products (reference, color) VALUES ('1915', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (25, 'ca', 4, 'Estofat de vedella', 'Cuinat a baixa temperatura durant hores per aconseguir la textura melosa de la carn');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (25, 'es', 4, 'Estofado de ternera', 'Cocinado a baja temperatura durante horas para conseguir la textura melosa de la carne');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (25, 'en', 4, 'Veal Stew', 'Cooked at low temperature for hours to achieve soft texture of meat');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (25, 'fr', 4, 'Ragout de veau', 'Cuit a basse temperature pendant heures pour obtenir textura tendre de viande');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (25, 8);

INSERT INTO products (reference, color) VALUES ('0147', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (26, 'ca', 4, 'Galtes de vedella i patata', 'Elaborades a foc molt lent caramelitzant la carn amb vi negre i parmentier patata');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (26, 'es', 4, 'Mejillas de ternera y patata', 'Elaboradas a fuego muy lento caramelizando la carne con vino tinto y parmentier patata');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (26, 'en', 4, 'Veal Cheeks and Potato', 'Made over very low heat caramelizing meat with red wine and potato parmentier');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (26, 'fr', 4, 'Joues de veau et pomme terre', 'Elaborees a feu tres doux caramelisant la viande avec vin rouge et parmentier patate');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (26, 7), (26, 1), (26, 2), (26, 8);

INSERT INTO products (reference, color) VALUES ('0192', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (27, 'ca', 4, 'Cua de bou i patata', 'Cuinades a baixa temperatura durant 18 hores acompanyat de puree patata');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (27, 'es', 4, 'Cola de buey y patata', 'Cocinadas a baja temperatura durante 18 horas acompanado de pure patata');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (27, 'en', 4, 'Oxtail and Potato', 'Cooked at low temperature for 18 hours accompanied by potato puree');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (27, 'fr', 4, 'Queue de boeuf et patate', 'Cuites a basse temperature pendant 18 heures accompagnees de pure patate');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (27, 7), (27, 1), (27, 2), (27, 8);

INSERT INTO products (reference, color) VALUES ('8436', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (28, 'ca', 4, 'Callos de vedella', 'Elaborats artesanalment sense additius ni conservants cuinat a foc lent');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (28, 'es', 4, 'Callos de ternera', 'Elaborados artesanalmente sin aditivos ni conservantes cocinado a fuego lento');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (28, 'en', 4, 'Veal Tripe', 'Made artisanally without additives or preservatives cooked over low heat');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (28, 'fr', 4, 'Tripes de veau', 'Preparees artisanalement sans aditifs ni conservateurs cuites a feu doux');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (28, 8);

INSERT INTO products (reference, color) VALUES ('0215', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (29, 'ca', 4, 'Fabada Asturiana', 'Plat tipic de la cuina asturiana elaborats amb faves i embolits asturians');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (29, 'es', 4, 'Fabada Asturiana', 'Plato tipico de la cocina asturiana elaborados con habas y embutidos asturianos');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (29, 'en', 4, 'Asturian Bean Stew', 'Typical Asturian cuisine dish made with beans and Asturian sausages');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (29, 'fr', 4, 'Fabada Asturienne', 'Plat typique de cuisine asturienne elabore avec feves et saucisses asturiennes');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (29, 8);

INSERT INTO products (reference, color) VALUES ('0093', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (30, 'ca', 4, 'Llenties Riojana', 'Plat tipic elaborat amb el millor embolit asturía cuinat al xup-xup');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (30, 'es', 4, 'Lentejas Riojana', 'Plato tipico elaborado con el mejor embutido asturiano cocinado al xup-xup');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (30, 'en', 4, 'Rioja Lentils', 'Typical dish made with best Asturian sausage cooked in slow cooker');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (30, 'fr', 4, 'Lentilles a la Rioja', 'Plat typique elabore avec meilleure saucisse asturienne cuite a la cocotte minute');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (30, 8), (30, 7);

INSERT INTO products (reference, color) VALUES ('0123', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (31, 'ca', 4, 'Fricandó de vedella', 'Plat tradicional amb base de carn de bovi bolets i salsa feta durant hores');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (31, 'es', 4, 'Fricandeau de ternera', 'Plato tradicional con base de carne de buey setas y salsa hecha durante horas');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (31, 'en', 4, 'Veal Fricandeau', 'Traditional dish with beef base mushrooms and sauce made for hours');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (31, 'fr', 4, 'Fricandeau de veau', 'Plat traditionnel avec base boeuf champignons et sauce cuite pendant heures');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (31, 1), (31, 8);

INSERT INTO products (reference, color) VALUES ('1885', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (32, 'ca', 4, 'Croquetes de pernil', 'Cruixents per fora i meloses per dins amb pernil de qualitat');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (32, 'es', 4, 'Croquetas de jamon', 'Crujientes por fuera y cremosas por dentro con jamon de calidad');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (32, 'en', 4, 'Ham Croquettes', 'Crispy outside and creamy inside with quality ham');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (32, 'fr', 4, 'Croquettes de jambon', 'Croustillantes dehors et onctueuses dedans avec jambon de qualite');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (32, 1), (32, 3), (32, 2);

INSERT INTO products (reference, color) VALUES ('1892', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (33, 'ca', 4, 'Croquetes de pollastre', 'Croqueta de pollastre de tota la vida pero amb un toc diferenciador');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (33, 'es', 4, 'Croquetas de pollo', 'Croqueta de pollo de toda la vida pero con un toque diferenciador');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (33, 'en', 4, 'Chicken Croquettes', 'Classic chicken croquettes with a special differentiating touch');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (33, 'fr', 4, 'Croquettes de poulet', 'Croquettes de poulet classiques avec touche differenciadora speciale');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (33, 1), (33, 3), (33, 2);

INSERT INTO products (reference, color) VALUES ('1953', '#FF7F50');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (34, 'ca', 4, 'Hamburguesa', 'Hamburguesa de vedella 100% amb formatge cheddar i condiments');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (34, 'es', 4, 'Hamburguesa', 'Hamburguesa de ternera 100% con queso cheddar y condimentos');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (34, 'en', 4, 'Hamburger', '100% veal hamburger with cheddar cheese and condiments');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (34, 'fr', 4, 'Hamburger', 'Hamburger 100% veau avec fromage cheddar et condiments');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (34, 1), (34, 2);

-- ROSTITS (Category 5)

INSERT INTO products (reference, color) VALUES ('0338', '#2C2C2C');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (35, 'ca', 5, 'Pollastre a l ast', 'Cuinat amb rostidor durant 2 hores per obtenir la maxima suculència');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (35, 'es', 5, 'Pollo al horno', 'Cocinado con asador durante 2 horas para obtener la maxima jugosidad');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (35, 'en', 5, 'Roasted Chicken', 'Cooked with rotisserie for 2 hours to achieve maximum juiciness');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (35, 'fr', 5, 'Poulet roti', 'Cuit a la broche pendant 2 heures pour obtenir maximum jutosité');

INSERT INTO products (reference, color) VALUES ('0345', '#2C2C2C');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (36, 'ca', 5, 'Cuixa a l ast amb patata', 'Cuinada tradicionalment i acompanyada d una patata rostida');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (36, 'es', 5, 'Muslo al horno con patata', 'Cocinado tradicionalmente y acompanado de una patata asada');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (36, 'en', 5, 'Roasted Thigh with Potato', 'Cooked traditionally and accompanied with roasted potato');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (36, 'fr', 5, 'Cuisse rotie avec patate', 'Cuite traditionnellement et accompagnee d une patate rotie');

-- HORECA (Category 6)

INSERT INTO products (reference, color) VALUES ('1960', '#9370DB');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (37, 'ca', 6, 'Gambes a l allet', 'Cuinades lentament amb oli d oliva verge extra per extreure n el maxi sabor');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (37, 'es', 6, 'Gambas al ajillo', 'Cocinadas lentamente con aceite de oliva virgen extra para extraer al maximo sabor');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (37, 'en', 6, 'Garlic Prawns', 'Cooked slowly with extra virgin olive oil to extract maximum flavor');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (37, 'fr', 6, 'Crevettes a l ail', 'Cuites lentement avec huile olive vierge extra pour extraire maximum saveur');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (37, 5);

INSERT INTO products (reference, color) VALUES ('1953b', '#9370DB');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (38, 'ca', 6, 'Cap i pota', 'Plat tipic de la cuina catalana cuinat lentament per aconseguir textura sucosa');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (38, 'es', 6, 'Cabeza y pata', 'Plato tipico de la cocina catalana cocinado lentamente para conseguir textura jugosa');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (38, 'en', 6, 'Head and Paw', 'Typical Catalan dish cooked slowly to achieve juicy texture');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (38, 'fr', 6, 'Tete et patte', 'Plat typique de cuisine catalane cuit lentement pour obtenir textura sucosa');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (38, 8);
