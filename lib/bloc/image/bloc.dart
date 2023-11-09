
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_game/bloc/image/state.dart';
import 'event.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  String imageUrl = 'https://picsum.photos/400/300';
  ImageBloc() : super(ImageInitState()){

    on<LoadImagesEvent>((event, emit) async {
      emit(Loading());
      try {
          emit(ImageLoadedState(image: imageUrl));
      } catch (e) {
        emit(ImageError('Failed to fetch data: $e'));
      }
    });

    on<ChangeImageEvent>((event, emit) {
      imageUrl = 'https://picsum.photos/400/300?random=${DateTime.now().millisecondsSinceEpoch}';
      emit(Loading());
      try {
        emit(ImageLoadedState(image: imageUrl));
      } catch (e) {
        emit(ImageError('Failed to fetch data: $e'));
      }
    });

    on<EndImageEvent>((event, emit) {
      emit(ImageEndState());
    });
  }
  }

