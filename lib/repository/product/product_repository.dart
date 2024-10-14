import '../../model/product/product_model.dart';

import '../../service/network_service.dart';

class ProductRepository {
  final NetworkService _networkService;

  ProductRepository(this._networkService);

  Future<ProductResponse> getProducts() async {
    try {
      final response = await _networkService.get('/products');
      return ProductResponse.fromJson(response);
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  // Get products by a category
  Future<ProductResponse> getProductsByCategory(String category) async {
    try {
      final response =
          await _networkService.get('/products/category/$category');
      return ProductResponse.fromJson(response);
    } catch (e) {
      throw Exception('Error fetching products by category: $e');
    }
  }
}
