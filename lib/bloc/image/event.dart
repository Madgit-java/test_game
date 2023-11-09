import 'package:equatable/equatable.dart';

class ImageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadImagesEvent extends ImageEvent {}

class ChangeImageEvent extends ImageEvent {}

class EndImageEvent extends ImageEvent {}