import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repository/auth/auth_repository.dart';
import 'network_service_provider.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final networkService = ref.watch(networkServiceProvider);
  return AuthRepository(networkService);
}
