
import 'dart:typed_data';

abstract class CatState {}

class CatInitialState extends CatState {}

class CatLoadingState extends CatState {}

class CatLoadedState extends CatState {
  final String catText;
  final Uint8List catImage;

  CatLoadedState({required this.catText, required this.catImage});
}

class CatErrorState extends CatState {
  final String error;

  CatErrorState({required this.error});
}