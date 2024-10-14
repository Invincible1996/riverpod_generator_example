import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/product/category_model.dart';
import 'provider/product_category_repository_provider.dart';

part 'product_category_controller.g.dart';

@riverpod
class ProductCategoryController extends _$ProductCategoryController {
  @override
  FutureOr<List<CategoryModel>> build() {
    return getProductCategories();
  }

  Future<List<CategoryModel>> getProductCategories() async {
    final categoryRepository = ref.read(categoryRepositoryProvider);
    try {
      return await categoryRepository.getCategories();
    } catch (e) {
      throw Exception('Failed to fetch product categories: $e');
    }
  }
}
