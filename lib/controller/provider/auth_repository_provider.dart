import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../repository/auth/auth_repository.dart';
import '../../service/network_service.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final networkService = NetworkService();
  return AuthRepository(networkService);
}
