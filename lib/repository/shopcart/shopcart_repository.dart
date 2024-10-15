import 'package:riverpod_generator_example/model/shopcart/shopcart_model.dart';

import '../../model/product/product_model.dart';
import '../../service/network_service.dart';

class ShopcartRepository {
  final NetworkService _networkService;

  ShopcartRepository(this._networkService);

  Future<void> addProductToShopcart(Product product) async {
    // Add product to shopcart
    // 'https://dummyjson.com/carts/add'
    try {
      final response =
          await _networkService.post('/carts/add', data: product.toJson());
      return response;
    } catch (e) {
      throw Exception('Error adding product to shopcart: $e');
    }
  }

  Future<void> removeProductFromShopcart(Product product) async {
    try {
      final response = await _networkService.delete('/carts/${product.id}');
      return response;
    } catch (e) {
      throw Exception('Error removing product from shopcart: $e');
    }
  }

  Future<List<ShopcartModel>> getShopcartProducts() async {
    // Get shopcart products
    // 'https://dummyjson.com/carts'
    try {
      final response = await _networkService.get('/carts');
      final List<ShopcartModel> shopcartProducts = [];
      for (final product in response['carts']) {
        shopcartProducts.add(ShopcartModel.fromJson(product));
      }
      return shopcartProducts;
    } catch (e) {
      throw Exception('Error fetching shopcart products: $e');
    }
  }
}
