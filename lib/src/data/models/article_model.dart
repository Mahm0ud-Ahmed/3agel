
import 'package:aagel/src/core/utils/reflector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'article_model.g.dart';
part 'article_model.freezed.dart';

@HiveType(typeId: 0)
@ModelReflector()
@freezed
class ArticleModel with _$ArticleModel{
  
  factory ArticleModel({
    @HiveField(0)
    final Map<String, dynamic>? source,
    @HiveField(1)
    final String? author,
    @HiveField(2)
    final String? title,
    @HiveField(3)
    final String? description,
    @HiveField(4)
    final String? url,
    @HiveField(5)
    final String? urlToImage,
    @HiveField(6)
    final String? publishedAt,
    @HiveField(7)
    final String? content,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);

  // Map<String, dynamic> toMap() => _$ArticleModelToJson(this);

}