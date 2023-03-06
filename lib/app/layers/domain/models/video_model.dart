abstract class VideoModel {
  VideoModel();
}

class VideoLoading extends VideoModel {}

class VideoIdle extends VideoModel {}

class VideoError extends VideoModel {
  final String message;

  String get messageError => message;

  VideoError(this.message);
}

class VideoSuccess extends VideoModel {
  final String urlVideo;

  VideoSuccess(this.urlVideo);
}
