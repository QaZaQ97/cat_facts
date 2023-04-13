import 'package:cat_facts/data/constants/apis.dart';
import 'package:cat_facts/data/models/cat_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(Apis.catImage)
  Future<dynamic> getCatImage();

  @GET(Apis.catFactText)
  Future<CatFactText> getCatFactText();
}
