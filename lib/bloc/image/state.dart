
abstract class ImageState {}

class ImageInitState extends ImageState {}

class Loading extends ImageState {}

class ImageError extends ImageState {
  final String errorMessage;

  ImageError(this.errorMessage);
}

class ImageLoadedState extends ImageState {
  final String image;

  ImageLoadedState({
    required this.image,
  });
}
class ImageEndState extends ImageState {}