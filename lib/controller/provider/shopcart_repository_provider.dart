import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repository/shopcart/shopcart_repository.dart';
import 'network_service_provider.dart';

part 'shopcart_repository_provider.g.dart';

@riverpod
ShopcartRepository shopcartRepository(ShopcartRepositoryRef ref) {
  final networkService = ref.watch(networkServiceProvider);
  return ShopcartRepository(networkService);
}
