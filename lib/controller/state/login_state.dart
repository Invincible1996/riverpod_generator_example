enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class UserCredentials {
  final String? username;
  final String? token;

  UserCredentials({this.username, this.token});
}

class LoginState {
  final LoginStatus status;
  final String? errorMessage;
  final UserCredentials credentials;

  LoginState({
    required this.status,
    this.errorMessage,
    UserCredentials? credentials,
  }) : credentials = credentials ?? UserCredentials();

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
    UserCredentials? credentials,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      credentials: credentials ?? this.credentials,
    );
  }
}
