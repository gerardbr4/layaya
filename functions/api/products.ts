export async function onRequest(context) {
  const { request, env } = context;

  if (request.method === 'GET') {
    const url = new URL(request.url);
    const category = url.searchParams.get('category') || null;
    const language = url.searchParams.get('language') || 'ca';
    const limit = parseInt(url.searchParams.get('limit') || '100');
    const offset = parseInt(url.searchParams.get('offset') || '0');

    try {
      let query = `
        SELECT
          p.id,
          p.reference,
          p.color,
          pt.name,
          pt.description,
          ct.name as category_name,
          GROUP_CONCAT(at.name, ', ') as allergens
        FROM products p
        JOIN product_translations pt ON p.id = pt.product_id
        JOIN categories c ON pt.category_id = c.id
        JOIN category_translations ct ON c.id = ct.category_id AND ct.language = ?
        LEFT JOIN product_allergens pa ON p.id = pa.product_id
        LEFT JOIN allergen_translations at ON pa.allergen_id = at.allergen_id AND at.language = ?
        WHERE pt.language = ?
      `;

      const params = [language, language, language];

      if (category) {
        query += ` AND c.slug = ?`;
        params.push(category);
      }

      query += ` GROUP BY p.id, pt.id ORDER BY p.id LIMIT ? OFFSET ?`;
      params.push(limit, offset);

      const result = await env.DB.prepare(query).bind(...params).all();

      return Response.json({
        success: true,
        data: result.results,
        count: result.results.length,
      });
    } catch (error) {
      return Response.json(
        { success: false, error: error.message },
        { status: 500 }
      );
    }
  }

  return Response.json(
    { error: 'Method not allowed' },
    { status: 405 }
  );
}
