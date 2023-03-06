import 'package:flutter/foundation.dart';

enum AuthState { initial, loading, success, error }

class Auth {
  String messageError = '';
  var state = AuthState.initial;
  Auth();
}

class AuthLoginState extends ValueNotifier<Auth> {
  AuthLoginState(super.value);

  /// Altera o estado estado da autenticação para AuthState.loading
  /// e notifica todos os listeners
  setStateToLoading() {
    value.state = AuthState.loading;
    notifyListeners();
  }

  /// Altera o estado estado da autenticação para AuthState.success
  /// e notifica todos os listeners
  setStateToSuccess() {
    value.state = AuthState.success;
    notifyListeners();
  }

  /// Altera o estado estado da autenticação para AuthState.error,
  /// passando uma messagem de erro para informar ao usuario,
  /// e notifica todos os listeners
  setStateToError(String messageError) {
    value.messageError = messageError;
    value.state = AuthState.error;
    notifyListeners();
  }
}
