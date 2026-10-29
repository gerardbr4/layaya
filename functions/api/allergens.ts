export async function onRequest(context) {
  const { request, env } = context;

  if (request.method === 'GET') {
    const url = new URL(request.url);
    const language = url.searchParams.get('language') || 'ca';
    const productId = url.searchParams.get('product_id');

    try {
      let query = `
        SELECT DISTINCT
          a.id,
          a.slug,
          at.name
        FROM allergens a
        JOIN allergen_translations at ON a.id = at.allergen_id AND at.language = ?
      `;

      const params = [language];

      if (productId) {
        query += `
          WHERE a.id IN (
            SELECT allergen_id FROM product_allergens WHERE product_id = ?
          )
        `;
        params.push(parseInt(productId));
      }

      query += ` ORDER BY a.id`;

      const result = await env.DB.prepare(query).bind(...params).all();

      return Response.json({
        success: true,
        data: result.results,
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
