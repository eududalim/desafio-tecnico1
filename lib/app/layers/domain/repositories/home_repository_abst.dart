import 'package:seventh_flutter_app/app/layers/domain/models/video_model.dart';

abstract class HomeRepositoryAbst {
  /// Busca url do video que deve ser transmitido,
  /// solicitando por paramentro o nome do video.
  /// Caso seja sucesso, retorna um VideoSuccess contendo a url.
  /// Caso dê erro, retorna um VideoError contendo uma mensagem de erro.
  Future<VideoModel> getUrlVideo(String nameVideo);
}
