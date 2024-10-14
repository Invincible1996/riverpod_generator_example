import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repository/category/category_repository.dart';
import 'network_service_provider.dart';

part 'product_category_repository_provider.g.dart';

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepository(ref.read(networkServiceProvider));
}
