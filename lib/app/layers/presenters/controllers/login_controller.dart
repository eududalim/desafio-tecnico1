import 'package:flutter/foundation.dart';
import 'package:seventh_flutter_app/app/layers/domain/repositories/login_repository_abst.dart';
import 'package:seventh_flutter_app/app/layers/presenters/controllers/auth_controller.dart';

class LoginController {
  final LoginRepositoryAbst repository;
  final AuthController auth;

  LoginController(this.repository, this.auth);

  var obscurePassword = ValueNotifier(true);

  setObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  /// Realiza login usando username e password passados,
  /// e altera o estado do AuthLoginState atráves do AuthController
  void login(String username, String password) async {
    auth.setToLoading();

    /// Tenta fazer o login com username e password.
    /// Caso sucesso, recebe string vazia,
    /// Caso dê erro, recebe string com messagem de erro
    /// e notifica o AuthLoginState
    var result = await repository.login(username, password);

    if (result.isEmpty) {
      auth.setToSuccess();
    } else {
      auth.setToError(result);
    }
  }
}
