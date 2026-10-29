// Simple auth helper
function validateAuth(request) {
  const auth = request.headers.get('Authorization');
  if (!auth || !auth.startsWith('Bearer ')) {
    return null;
  }

  const token = auth.slice(7);
  // TODO: Replace with real JWT validation or API key check
  const ADMIN_TOKEN = 'your-secure-token-here';
  return token === ADMIN_TOKEN ? true : null;
}

export async function onRequest(context) {
  const { request, env } = context;

  // Validate authentication
  if (!validateAuth(request)) {
    return Response.json(
      { error: 'Unauthorized' },
      { status: 401 }
    );
  }

  try {
    if (request.method === 'POST') {
      // Create new product
      const body = await request.json();
      const { reference, color, translations, allergen_ids } = body;

      if (!reference || !translations) {
        return Response.json(
          { error: 'Missing required fields' },
          { status: 400 }
        );
      }

      // Insert product
      const productResult = await env.DB.prepare(
        'INSERT INTO products (reference, color) VALUES (?, ?)'
      ).bind(reference, color).run();

      const productId = productResult.meta.last_row_id;

      // Insert translations
      for (const [language, data] of Object.entries(translations)) {
        await env.DB.prepare(
          'INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (?, ?, ?, ?, ?)'
        ).bind(productId, language, data.category_id, data.name, data.description).run();
      }

      // Insert allergens
      if (allergen_ids && Array.isArray(allergen_ids)) {
        for (const allergenId of allergen_ids) {
          await env.DB.prepare(
            'INSERT INTO product_allergens (product_id, allergen_id) VALUES (?, ?)'
          ).bind(productId, allergenId).run();
        }
      }

      return Response.json({
        success: true,
        message: 'Product created',
        id: productId,
      }, { status: 201 });
    }

    if (request.method === 'PUT') {
      // Update product
      const body = await request.json();
      const { id, reference, color, translations, allergen_ids } = body;

      if (!id || !translations) {
        return Response.json(
          { error: 'Missing required fields' },
          { status: 400 }
        );
      }

      // Update product base
      await env.DB.prepare(
        'UPDATE products SET reference = ?, color = ? WHERE id = ?'
      ).bind(reference, color, id).run();

      // Delete old translations
      await env.DB.prepare(
        'DELETE FROM product_translations WHERE product_id = ?'
      ).bind(id).run();

      // Insert new translations
      for (const [language, data] of Object.entries(translations)) {
        await env.DB.prepare(
          'INSERT INTO product_translations (product_id, language, category_id, name, description) VALUES (?, ?, ?, ?, ?)'
        ).bind(id, language, data.category_id, data.name, data.description).run();
      }

      // Delete old allergens
      await env.DB.prepare(
        'DELETE FROM product_allergens WHERE product_id = ?'
      ).bind(id).run();

      // Insert new allergens
      if (allergen_ids && Array.isArray(allergen_ids)) {
        for (const allergenId of allergen_ids) {
          await env.DB.prepare(
            'INSERT INTO product_allergens (product_id, allergen_id) VALUES (?, ?)'
          ).bind(id, allergenId).run();
        }
      }

      return Response.json({
        success: true,
        message: 'Product updated',
      });
    }

    if (request.method === 'DELETE') {
      const url = new URL(request.url);
      const id = url.searchParams.get('id');

      if (!id) {
        return Response.json(
          { error: 'Missing product id' },
          { status: 400 }
        );
      }

      // Delete allergens
      await env.DB.prepare(
        'DELETE FROM product_allergens WHERE product_id = ?'
      ).bind(id).run();

      // Delete translations
      await env.DB.prepare(
        'DELETE FROM product_translations WHERE product_id = ?'
      ).bind(id).run();

      // Delete product
      await env.DB.prepare(
        'DELETE FROM products WHERE id = ?'
      ).bind(id).run();

      return Response.json({
        success: true,
        message: 'Product deleted',
      });
    }

    return Response.json(
      { error: 'Method not allowed' },
      { status: 405 }
    );
  } catch (error) {
    return Response.json(
      { success: false, error: error.message },
      { status: 500 }
    );
  }
}
