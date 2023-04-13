import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@JsonSerializable()
class CatFactText {
  @JsonKey(name: 'fact')
  final String catTextFact;

  CatFactText({required this.catTextFact});

  factory CatFactText.fromJson(Map<String, dynamic> json) => _$CatFactTextFromJson(json);
  Map<String, dynamic> toJson() => _$CatFactTextToJson(this);
}