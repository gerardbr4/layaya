export async function onRequest(context) {
  const { request, env } = context;

  if (request.method === 'GET') {
    const url = new URL(request.url);
    const language = url.searchParams.get('language') || 'ca';

    try {
      const result = await env.DB.prepare(`
        SELECT
          c.id,
          c.slug,
          ct.name,
          COUNT(DISTINCT p.id) as product_count
        FROM categories c
        JOIN category_translations ct ON c.id = ct.category_id AND ct.language = ?
        LEFT JOIN product_translations pt ON c.id = pt.category_id AND pt.language = ?
        LEFT JOIN products p ON pt.product_id = p.id
        GROUP BY c.id
        ORDER BY c.id
      `).bind(language, language).all();

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
