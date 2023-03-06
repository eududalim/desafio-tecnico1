import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:seventh_flutter_app/app/layers/data/datasources/seventh_api/seventh_api_datasource.dart';
import 'package:seventh_flutter_app/app/layers/data/repositories/home_repository_impl.dart';
import 'package:seventh_flutter_app/app/layers/domain/models/video_model.dart';

@GenerateNiceMocks([MockSpec<SeventhApiDatasource>()])
import 'home_repository_impl_test.mocks.dart';

void main() {
  final datasource = MockSeventhApiDatasource();
  final homeRepository = HomeRepositoryImpl(datasource);

  test('Com o url nulo ele deve retornar um VideoError model', () async {
    datasource.token = token;

    when(datasource.getUrlVideo('bunny.mp4'))
        .thenAnswer((_) => Future.value(''));

    var result = await homeRepository.getUrlVideo('bunny.mp4');

    expect(result, isInstanceOf<VideoError>());
  });

  test('Com o url e token não nulos, ele deve retornar um VideoSucess model',
      () async {
    when(datasource.urlVideo).thenAnswer((_) => urlVideo);

    when(datasource.getUrlVideo('bunny.mp4'))
        .thenAnswer((_) => Future.value(''));

    var result = await homeRepository.getUrlVideo('bunny.mp4');

    expect(result, isInstanceOf<VideoSuccess>());
  });

  test('Deve obter o token do datasource e poder verificar-lo se é nulo ou não',
      () {
    when(datasource.token).thenAnswer((_) => token);

    assert(datasource.token != null);
    expect(datasource.token, isA<String?>());
  });

  test(
      'Deve obter a url do video do datasource e poder verificar-lo se é nulo ou não',
      () {
    when(datasource.urlVideo).thenAnswer((_) => urlVideo);

    assert(datasource.urlVideo != null);
    expect(datasource.urlVideo, isA<String?>());
  });
}

const token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImlkIjoiNDM4MWI2ZmEtNDEzNi00MDRhLTlkOTctOGU3N2NjNjdhOGU4IiwidXNlcm5hbWUiOiJjYW5kaWRhdG8tc2V2ZW50aCIsImxhc3RMb2dpbiI6IjIwMjItMTAtMjJUMjE6MTI6NDUuNTk1WiJ9LCJpYXQiOjE2NjY0NzMxNjUsImV4cCI6MTY2NjU1OTU2NX0.uIX2JGKCxMoUxnCb2CwYs9IUBWy06EVq8Wq8GEcTofc";

const urlVideo =
    "https://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_stereo_subs.m3u8";
