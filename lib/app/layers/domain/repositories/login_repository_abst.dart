abstract class LoginRepositoryAbst {
  /// Tenta fazer login com username e password.
  /// Caso sucesso, retorna string vazia.
  /// Caso dê erro, retorna string com mensagem de erro
  Future<String> login(String username, String password);

  /// Busca estado atual de autenticação.
  /// Caso sucesso retorna true.
  /// Caso dê erro retorna false.
  bool getAuth();
}
