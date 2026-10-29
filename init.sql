-- Create tables
CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY AUTOINCREMENT, slug TEXT UNIQUE NOT NULL);
CREATE TABLE IF NOT EXISTS category_translations (id INTEGER PRIMARY KEY AUTOINCREMENT, category_id INTEGER NOT NULL, language TEXT NOT NULL, name TEXT NOT NULL, FOREIGN KEY (category_id) REFERENCES categories(id), UNIQUE(category_id, language));
CREATE TABLE IF NOT EXISTS allergens (id INTEGER PRIMARY KEY AUTOINCREMENT, slug TEXT UNIQUE NOT NULL);
CREATE TABLE IF NOT EXISTS allergen_translations (id INTEGER PRIMARY KEY AUTOINCREMENT, allergen_id INTEGER NOT NULL, language TEXT NOT NULL, name TEXT NOT NULL, FOREIGN KEY (allergen_id) REFERENCES allergens(id), UNIQUE(allergen_id, language));
CREATE TABLE IF NOT EXISTS products (id INTEGER PRIMARY KEY AUTOINCREMENT, reference TEXT UNIQUE NOT NULL, color TEXT);
CREATE TABLE IF NOT EXISTS product_translations (id INTEGER PRIMARY KEY AUTOINCREMENT, product_id INTEGER NOT NULL, language TEXT NOT NULL, name TEXT NOT NULL, category_id INTEGER, description TEXT, FOREIGN KEY (product_id) REFERENCES products(id), FOREIGN KEY (category_id) REFERENCES categories(id), UNIQUE(product_id, language));
CREATE TABLE IF NOT EXISTS product_allergens (product_id INTEGER NOT NULL, allergen_id INTEGER NOT NULL, PRIMARY KEY (product_id, allergen_id), FOREIGN KEY (product_id) REFERENCES products(id), FOREIGN KEY (allergen_id) REFERENCES allergens(id));

-- Insert categories
INSERT INTO categories (slug) VALUES ('pasta-arros');
INSERT INTO categories (slug) VALUES ('peix');
INSERT INTO categories (slug) VALUES ('verdures');
INSERT INTO categories (slug) VALUES ('carns');
INSERT INTO categories (slug) VALUES ('rostits');
INSERT INTO categories (slug) VALUES ('horeca');

-- Insert category translations
INSERT INTO category_translations (category_id, language, name) VALUES (1, 'ca', 'Pasta i arros');
INSERT INTO category_translations (category_id, language, name) VALUES (2, 'ca', 'Peix');
INSERT INTO category_translations (category_id, language, name) VALUES (3, 'ca', 'Verdures');
INSERT INTO category_translations (category_id, language, name) VALUES (4, 'ca', 'Carns');
INSERT INTO category_translations (category_id, language, name) VALUES (5, 'ca', 'Rostits');
INSERT INTO category_translations (category_id, language, name) VALUES (6, 'ca', 'Horeca/Foodservice');

INSERT INTO category_translations (category_id, language, name) VALUES (1, 'es', 'Pasta y arroz');
INSERT INTO category_translations (category_id, language, name) VALUES (2, 'es', 'Pescado');
INSERT INTO category_translations (category_id, language, name) VALUES (3, 'es', 'Verduras');
INSERT INTO category_translations (category_id, language, name) VALUES (4, 'es', 'Carnes');
INSERT INTO category_translations (category_id, language, name) VALUES (5, 'es', 'Asados');
INSERT INTO category_translations (category_id, language, name) VALUES (6, 'es', 'Horeca/Foodservice');

INSERT INTO category_translations (category_id, language, name) VALUES (1, 'en', 'Pasta and Rice');
INSERT INTO category_translations (category_id, language, name) VALUES (2, 'en', 'Seafood');
INSERT INTO category_translations (category_id, language, name) VALUES (3, 'en', 'Vegetables');
INSERT INTO category_translations (category_id, language, name) VALUES (4, 'en', 'Meats');
INSERT INTO category_translations (category_id, language, name) VALUES (5, 'en', 'Roasted');
INSERT INTO category_translations (category_id, language, name) VALUES (6, 'en', 'Horeca/Foodservice');

INSERT INTO category_translations (category_id, language, name) VALUES (1, 'fr', 'Pates et riz');
INSERT INTO category_translations (category_id, language, name) VALUES (2, 'fr', 'Fruits de mer');
INSERT INTO category_translations (category_id, language, name) VALUES (3, 'fr', 'Legumes');
INSERT INTO category_translations (category_id, language, name) VALUES (4, 'fr', 'Viandes');
INSERT INTO category_translations (category_id, language, name) VALUES (5, 'fr', 'Rotis');
INSERT INTO category_translations (category_id, language, name) VALUES (6, 'fr', 'Horeca/Foodservice');

-- Insert allergens
INSERT INTO allergens (slug) VALUES ('gluten');
INSERT INTO allergens (slug) VALUES ('lactis');
INSERT INTO allergens (slug) VALUES ('ou');
INSERT INTO allergens (slug) VALUES ('peix');
INSERT INTO allergens (slug) VALUES ('crustacis');
INSERT INTO allergens (slug) VALUES ('molluscs');
INSERT INTO allergens (slug) VALUES ('soja');
INSERT INTO allergens (slug) VALUES ('sulfits');
INSERT INTO allergens (slug) VALUES ('fruits-secs');

-- Insert allergen translations (Catalan)
INSERT INTO allergen_translations (allergen_id, language, name) VALUES (1, 'ca', 'Gluten');
INSERT INTO allergen_translations (allergen_id, language, name) VALUES (2, 'ca', 'Lactis');
INSERT INTO allergen_translations (allergen_id, language, name) VALUES (3, 'ca', 'Ou');
INSERT INTO allergen_translations (allergen_id, language, name) VALUES (4, 'ca', 'Peix');
INSERT INTO allergen_translations (allergen_id, language, name) VALUES (5, 'ca', 'Crustacis');
INSERT INTO allergen_translations (allergen_id, language, name) VALUES (6, 'ca', 'Molluscs');
INSERT INTO allergen_translations (allergen_id, language, name) VALUES (7, 'ca', 'Soja');
INSERT INTO allergen_translations (allergen_id, language, name) VALUES (8, 'ca', 'Sulfits');
INSERT INTO allergen_translations (allergen_id, language, name) VALUES (9, 'ca', 'Fruits secs');

-- Insert sample products (simplified without apostrophes)
INSERT INTO products (reference, color) VALUES ('0031', '#FFA500');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (1, 'ca', 1, 'Fideua marinera', 'Plat classic de la nostra cuina');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (1, 'es', 1, 'Fideau marinera', 'Plato clasico de nuestra cocina');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (1, 'en', 1, 'Seafood Noodle Stew', 'Classic dish from our cuisine');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (1, 'fr', 1, 'Fideua mariniere', 'Plat classique de notre cuisine');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (1, 1);
INSERT INTO product_allergens (product_id, allergen_id) VALUES (1, 4);

-- Add more products...
INSERT INTO products (reference, color) VALUES ('0086', '#FFA500');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (2, 'ca', 1, 'Canelons de carn', 'Elaborats amb pollastre rostit');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (2, 'es', 1, 'Canelones de carne', 'Elaborados con pollo asado');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (2, 'en', 1, 'Meat Cannelloni', 'Made with roasted chicken');
INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (2, 'fr', 1, 'Cannelloni a la viande', 'Prepares avec du poulet roti');
INSERT INTO product_allergens (product_id, allergen_id) VALUES (2, 1);
INSERT INTO product_allergens (product_id, allergen_id) VALUES (2, 2);
