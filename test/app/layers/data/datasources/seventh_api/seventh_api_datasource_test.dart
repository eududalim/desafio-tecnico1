import 'package:flutter_test/flutter_test.dart';
import 'package:seventh_flutter_app/app/layers/data/datasources/seventh_api/seventh_api_datasource.dart';

void main() {
  final datasource = SeventhApiDatasource();

  test('Deve realizar login corretamente e retornar token de acesso', () async {
    var result = await datasource.loginWithUsernameAndPassword(
        username: 'candidato-seventh', password: '8n5zSrYq');

    assert(result.isEmpty);
    assert(datasource.token != null);
  });

  test('Deve obter url do video usando um token de teste', () async {
    datasource.token = token;
    var result = await datasource.getUrlVideo('bunny.mp4');

    assert(result.isEmpty);
    assert(datasource.urlVideo != null);
  });

  test('Deve realizar login e logo em seguida obter o url do video', () async {
    await datasource.loginWithUsernameAndPassword(
        username: 'candidato-seventh', password: '8n5zSrYq');

    var result = await datasource.getUrlVideo('bunny.mp4');

    assert(result.isEmpty);
    assert(datasource.urlVideo != null);
  });
}

const token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImlkIjoiNDM4MWI2ZmEtNDEzNi00MDRhLTlkOTctOGU3N2NjNjdhOGU4IiwidXNlcm5hbWUiOiJjYW5kaWRhdG8tc2V2ZW50aCIsImxhc3RMb2dpbiI6IjIwMjItMTAtMjJUMjE6MTI6NDUuNTk1WiJ9LCJpYXQiOjE2NjY0NzMxNjUsImV4cCI6MTY2NjU1OTU2NX0.uIX2JGKCxMoUxnCb2CwYs9IUBWy06EVq8Wq8GEcTofc";
