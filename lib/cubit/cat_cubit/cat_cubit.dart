import 'package:cat_facts/cubit/cat_cubit/cat_state.dart';
import 'package:cat_facts/data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatCubit extends Cubit<CatState> {
  ApiService? _catImage;
  ApiService? _catText;

  CatCubit() : super(CatInitialState()) {
    _catImage = ApiService(Dio(BaseOptions(responseType: ResponseType.bytes)));
    _catText = ApiService(Dio(BaseOptions(contentType: 'application/json')));
  }

  void getCatData() async {
    emit(CatLoadingState());
    try {
      final data = await Future.wait([_catText!.getCatFactText(), _catImage!.getCatImage()]);
      final catText = data[0].catTextFact;
      final catImage = data[1];
      emit(CatLoadedState(catText: catText, catImage: catImage));
    } catch (e) {
      emit(CatErrorState(error: e.toString()));
    }
  }
}