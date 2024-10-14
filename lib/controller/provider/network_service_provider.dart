import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../service/network_service.dart';

part 'network_service_provider.g.dart';

@riverpod
NetworkService networkService(NetworkServiceRef ref) {
  return NetworkService();
}
