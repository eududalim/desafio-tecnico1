import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:seventh_flutter_app/app/layers/data/datasources/seventh_api/seventh_api_datasource.dart';
import 'package:seventh_flutter_app/app/layers/data/repositories/login_repository_impl.dart';

@GenerateNiceMocks([MockSpec<SeventhApiDatasource>()])
import 'login_repository_impl_test.mocks.dart';

void main() {
  final datasource = MockSeventhApiDatasource();
  final loginRepository = LoginRepositoryImpl(datasource);

  const username = 'candidato-seventh';
  const password = '8n5zSrYq';
  test(
      'Deve fazer login com o username e senha corretos com sucesso e retornar uma string vazia',
      () async {
    when(datasource.loginWithUsernameAndPassword(
            username: username, password: password))
        .thenAnswer((_) => Future.value(''));

    var result = await loginRepository.login(username, password);

    expect(result, equals(''));
  });

  test(
      'Deve retornar uma mensagem de erro quando informado um username e senha incorretos',
      () async {
    when(datasource.loginWithUsernameAndPassword(
            username: username, password: password))
        .thenAnswer((_) => Future.value('Autentication Failed'));

    var result = await loginRepository.login(username, password);

    expect(result, isNot(''));
  });

  test('Deve obter o estado da autenticação do usuario', () {
    when(datasource.getAuthState()).thenAnswer((_) => false);

    var result = loginRepository.getAuth();

    expect(result, isA<bool>());
  });
}
