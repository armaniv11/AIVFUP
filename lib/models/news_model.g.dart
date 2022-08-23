// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      imgurl: json['imgurl'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'imgurl': instance.imgurl,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };
