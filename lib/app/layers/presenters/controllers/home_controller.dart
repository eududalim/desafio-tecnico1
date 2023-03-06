import 'package:flutter/material.dart';
import 'package:seventh_flutter_app/app/layers/domain/models/video_model.dart';
import 'package:seventh_flutter_app/app/layers/domain/repositories/home_repository_abst.dart';

class HomeController {
  final HomeRepositoryAbst repository;

  HomeController(this.repository);

  /// Variavel que faz a gerencia de estado do video na homepage
  /// usando o ValueNotifier com as classes do tipo VideoModel
  var video = ValueNotifier<VideoModel>(VideoIdle());

  /// Busca na camada de repository o video com url.
  /// O resultado desta busca é recebido pela variável video.value que atualiza o estado da view.
  /// Primeiro, recebe um loading, depois o resultado.
  /// Caso seja sucesso, recebe um VideoSuccess, contendo a url do video.
  /// Caso dê erro, recebe um VideoError, contendo uma mensagem de erro
  Future<VideoModel> getVideo() async {
    video.value = VideoLoading();

    video.value = await repository.getUrlVideo('bunny.mp4');

    return video.value;
  }
}
