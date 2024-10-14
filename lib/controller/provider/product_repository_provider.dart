import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repository/product/product_repository.dart';
import 'network_service_provider.dart';

part 'product_repository_provider.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  final networkService = ref.watch(networkServiceProvider);
  return ProductRepository(networkService);
}
