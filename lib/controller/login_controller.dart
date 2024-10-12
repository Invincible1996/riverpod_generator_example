import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/auth/auth_req.dart';
import '../utils/token_storage.dart';
import 'provider/auth_repository_provider.dart';
import 'state/login_state.dart';
import '../repository/auth/auth_repository.dart';
part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  late final AuthRepository _authRepository;

  @override
  LoginState build() {
    _authRepository = ref.read(authRepositoryProvider);
    return LoginState(status: LoginStatus.initial);
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(status: LoginStatus.loading);

    try {
      final response = await _authRepository.login(
        AuthReq(
          username: email,
          password: password,
        ),
      );
      final token = response.accessToken;
      final username = response.username;
      await TokenStorage.saveToken(token);
      state = state.copyWith(
        status: LoginStatus.success,
        credentials: UserCredentials(username: username, token: token),
      );
    } catch (e) {
      state = state.copyWith(
        status: LoginStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    await TokenStorage.deleteToken();
    state = LoginState(status: LoginStatus.initial);
  }

  Future<bool> checkLoginStatus() async {
    final token = await TokenStorage.getToken();
    // await Future.delayed(const Duration(seconds: 1));
    if (token != null) {
      state = state.copyWith(
        credentials: UserCredentials(
          username: '',
          token: token,
        ),
      );
      print('checkLoginStatus: true ${state.credentials.token}');
      return true;
    }
    return false;
  }
}
