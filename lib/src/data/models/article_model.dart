
import 'package:aagel/src/core/utils/reflector.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
@ModelReflector()
class ArticleModel {

  @JsonKey(ignore: true)
  final String route = 'top-headlines';
  
  @HiveField(0)
  final Map<String, dynamic>? source;
  @HiveField(1)
  final String? author;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? url;
  @HiveField(5)
  final String? urlToImage;
  @HiveField(6)
  final String? publishedAt;
  @HiveField(7)
  final String? content;

  ArticleModel({
    this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);

  Map<String, dynamic> toMap() => _$ArticleModelToJson(this);

}