import '../../model/product/category_model.dart';
import '../../service/network_service.dart';

class CategoryRepository {
  final NetworkService _networkService;

  CategoryRepository(this._networkService);

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _networkService.get('/products/categories');
      if (response is List) {
        return response.map((e) => CategoryModel.fromJson(e)).toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }

  //category-list
  Future<List<CategoryModel>> getCategoryList() async {
    try {
      final response = await _networkService.get('/products/categories');
      if (response is List) {
        return response.map((e) => CategoryModel.fromJson(e)).toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }
}
