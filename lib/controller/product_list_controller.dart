import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/product/category_model.dart';
import '../model/product/product_model.dart';
import 'provider/product_repository_provider.dart';

part 'product_list_controller.g.dart';

@riverpod
class ProductListController extends _$ProductListController {
  @override
  FutureOr<ProductResponse> build(CategoryModel category) async {
    return getProducts(category);
  }

  Future<ProductResponse> getProducts(CategoryModel category) async {
    final productService = ref.read(productRepositoryProvider);
    return productService.getProductsByCategory(category.slug);
  }
}
