import '../datasources/seventh_api/seventh_api_datasource.dart';
import '../../domain/models/video_model.dart';
import '../../domain/repositories/home_repository_abst.dart';

class HomeRepositoryImpl implements HomeRepositoryAbst {
  final SeventhApiDatasource seventhApi;

  HomeRepositoryImpl(this.seventhApi);

  @override
  Future<VideoModel> getUrlVideo(nameVideo) async {
    try {
      return await seventhApi.getUrlVideo(nameVideo).then((value) {
        if (value.isEmpty) {
          if (seventhApi.urlVideo != null && seventhApi.urlVideo!.isNotEmpty) {
            return VideoSuccess(seventhApi.urlVideo!);
          } else {}
        }
        return VideoError('Erro ao obter video. Tente novamente mais tarde');
      });
    } catch (e) {
      return VideoError(e.toString());
    }
  }
}
