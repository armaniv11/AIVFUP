import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

// msgtypes = [text,video,voice,file,image]

@JsonSerializable()
class NewsModel {
  final String imgurl;
  final String title;
  final String? subtitle;

  NewsModel({
    required this.imgurl,
    required this.title,
    this.subtitle,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
