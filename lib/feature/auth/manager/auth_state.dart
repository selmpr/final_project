enum AuthStatus { initial, loding, success, error }

class RegisterState {
  final bool isPatient;
  final AuthStatus status;
  final String? errorMessage;
  const RegisterState({
    this.status = AuthStatus.initial,
    this.errorMessage,
    this.isPatient = true,
  });
  RegisterState copyWith({
    AuthStatus? status,
    String? errorMessage,
    bool? isPatient,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isPatient: isPatient ?? this.isPatient,
    );
  }

  @override
  String toString() {
    return 'status: $status error:$errorMessage';
  }
}

class LoginState {
  final AuthStatus status;
  final String? errorMessage;
  final bool isPatient;

  const LoginState({
    this.status = AuthStatus.initial,
    this.errorMessage,
    this.isPatient = true,
  });
  LoginState copyWith({
    AuthStatus? status,
    String? errorMessage,
    bool? isPatient,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isPatient: isPatient ?? this.isPatient,
    );
  }

  @override
  String toString() {
    return 'status: $status error:$errorMessage';
  }
}
