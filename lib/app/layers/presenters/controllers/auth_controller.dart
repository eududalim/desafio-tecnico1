import 'package:seventh_flutter_app/app/layers/domain/repositories/login_repository_abst.dart';

import 'auth_state.dart';

class AuthController {
  final LoginRepositoryAbst repository;

  /// Sempre que é criado chama a funcção que busca
  /// o estado da autenticação atual
  AuthController(this.repository) {
    _loadAuth();
  }
  var state = AuthLoginState(Auth());

  /// Altera o status do AuthLoginState para AuthState.loading
  /// e notifica todos os listeners
  setToLoading() => state.setStateToLoading();

  /// Altera o status do AuthLoginState para AuthState.success
  /// e notifica todos os listeners
  setToSuccess() => state.setStateToSuccess();

  /// Altera o status do AuthLoginState para AuthState.error e
  /// informa mensagem de erro e notifica todos os listeners
  setToError(message) => state.setStateToError(message);

  /// busca verificar se o usuario está autenticado
  _loadAuth() {
    setToLoading();
    var isLoggedIn = repository.getAuth();
    isLoggedIn ? setToSuccess() : setToError('Usuario desconectado.');
  }
}
