import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../repository/user/user_repository.dart';
import 'network_service_provider.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  final networkService = ref.watch(networkServiceProvider);
  return UserRepository(networkService);
}
