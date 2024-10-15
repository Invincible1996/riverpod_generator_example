import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/shopcart/shopcart_model.dart';
import 'provider/shopcart_repository_provider.dart';

part 'shopcart_controller.g.dart';

@riverpod
class ShopcartController extends _$ShopcartController {
  @override
  FutureOr<List<ShopcartModel>> build() async {
    return getShopcartList();
  }

  // get shopcart list
  Future<List<ShopcartModel>> getShopcartList() async {
    final shopcartRepository = ref.read(shopcartRepositoryProvider);
    try {
      return await shopcartRepository.getShopcartProducts();
    } catch (e) {
      throw Exception('Failed to fetch shopcart list: $e');
    }
  }
}
