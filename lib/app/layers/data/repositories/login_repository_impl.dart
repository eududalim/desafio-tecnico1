import 'dart:developer';

import '../datasources/seventh_api/seventh_api_datasource.dart';
import '../../domain/repositories/login_repository_abst.dart';

class LoginRepositoryImpl implements LoginRepositoryAbst {
  final SeventhApiDatasource seventhApi;

  LoginRepositoryImpl(this.seventhApi);

  @override
  Future<String> login(String username, String password) async {
    var messageError = '';

    try {
      messageError = await seventhApi.loginWithUsernameAndPassword(
          username: username, password: password);
    } on Exception catch (e) {
      log(e.toString());
      messageError = 'Ocorreu um erro. Tente novamente mais tarde.';
    }

    return messageError;
  }

  @override
  bool getAuth() => seventhApi.getAuthState();
}
