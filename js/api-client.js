// Layaya API Client
// Usa aquesta classe per comunicar-te amb les Pages Functions

class LayayaAPI {
  constructor(baseUrl = '/api') {
    this.baseUrl = baseUrl;
    this.language = localStorage.getItem('language') || 'ca';
  }

  setLanguage(lang) {
    this.language = lang;
    localStorage.setItem('language', lang);
  }

  async request(endpoint, options = {}) {
    const url = new URL(`${this.baseUrl}${endpoint}`, window.location.origin);

    // Add language to all requests
    url.searchParams.append('language', this.language);

    const response = await fetch(url, {
      method: options.method || 'GET',
      headers: {
        'Content-Type': 'application/json',
        ...options.headers,
      },
      body: options.body ? JSON.stringify(options.body) : undefined,
    });

    if (!response.ok) {
      throw new Error(`API Error: ${response.status} ${response.statusText}`);
    }

    return response.json();
  }

  // GET all products, optionally filtered by category
  async getProducts(category = null, limit = 100, offset = 0) {
    let endpoint = '/products';
    const params = new URLSearchParams({
      limit,
      offset,
      language: this.language,
    });

    if (category) {
      params.append('category', category);
    }

    return this.request(`${endpoint}?${params}`);
  }

  // GET all categories
  async getCategories() {
    return this.request('/categories');
  }

  // GET allergens (all or for a specific product)
  async getAllergens(productId = null) {
    let endpoint = '/allergens';
    const params = new URLSearchParams({
      language: this.language,
    });

    if (productId) {
      params.append('product_id', productId);
    }

    return this.request(`${endpoint}?${params}`);
  }

  // Admin methods (require authorization)

  async createProduct(data, authToken) {
    return this.request('/admin/products', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${authToken}`,
      },
      body: data,
    });
  }

  async updateProduct(id, data, authToken) {
    return this.request('/admin/products', {
      method: 'PUT',
      headers: {
        'Authorization': `Bearer ${authToken}`,
      },
      body: {
        id,
        ...data,
      },
    });
  }

  async deleteProduct(id, authToken) {
    return this.request(`/admin/products?id=${id}`, {
      method: 'DELETE',
      headers: {
        'Authorization': `Bearer ${authToken}`,
      },
    });
  }
}

// Usage examples:
// const api = new LayayaAPI();
//
// // Get all products in Catalan
// api.getProducts().then(res => console.log(res.data));
//
// // Get only fish products in English
// api.setLanguage('en');
// api.getProducts('peix').then(res => console.log(res.data));
//
// // Get categories
// api.getCategories().then(res => console.log(res.data));
//
// // Get allergens for product with id 1
// api.getAllergens(1).then(res => console.log(res.data));
