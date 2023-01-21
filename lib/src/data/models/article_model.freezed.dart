// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'article_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return _ArticleModel.fromJson(json);
}

/// @nodoc
mixin _$ArticleModel {
  @HiveField(0)
  Map<String, dynamic>? get source => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get author => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get urlToImage => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get publishedAt => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleModelCopyWith<ArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleModelCopyWith<$Res> {
  factory $ArticleModelCopyWith(
          ArticleModel value, $Res Function(ArticleModel) then) =
      _$ArticleModelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) Map<String, dynamic>? source,
      @HiveField(1) String? author,
      @HiveField(2) String? title,
      @HiveField(3) String? description,
      @HiveField(4) String? url,
      @HiveField(5) String? urlToImage,
      @HiveField(6) String? publishedAt,
      @HiveField(7) String? content});
}

/// @nodoc
class _$ArticleModelCopyWithImpl<$Res> implements $ArticleModelCopyWith<$Res> {
  _$ArticleModelCopyWithImpl(this._value, this._then);

  final ArticleModel _value;
  // ignore: unused_field
  final $Res Function(ArticleModel) _then;

  @override
  $Res call({
    Object? source = freezed,
    Object? author = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? urlToImage = freezed,
    Object? publishedAt = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: urlToImage == freezed
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ArticleModelCopyWith<$Res>
    implements $ArticleModelCopyWith<$Res> {
  factory _$$_ArticleModelCopyWith(
          _$_ArticleModel value, $Res Function(_$_ArticleModel) then) =
      __$$_ArticleModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) Map<String, dynamic>? source,
      @HiveField(1) String? author,
      @HiveField(2) String? title,
      @HiveField(3) String? description,
      @HiveField(4) String? url,
      @HiveField(5) String? urlToImage,
      @HiveField(6) String? publishedAt,
      @HiveField(7) String? content});
}

/// @nodoc
class __$$_ArticleModelCopyWithImpl<$Res>
    extends _$ArticleModelCopyWithImpl<$Res>
    implements _$$_ArticleModelCopyWith<$Res> {
  __$$_ArticleModelCopyWithImpl(
      _$_ArticleModel _value, $Res Function(_$_ArticleModel) _then)
      : super(_value, (v) => _then(v as _$_ArticleModel));

  @override
  _$_ArticleModel get _value => super._value as _$_ArticleModel;

  @override
  $Res call({
    Object? source = freezed,
    Object? author = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? urlToImage = freezed,
    Object? publishedAt = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_ArticleModel(
      source: source == freezed
          ? _value._source
          : source // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: urlToImage == freezed
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArticleModel implements _ArticleModel {
  _$_ArticleModel(
      {@HiveField(0) final Map<String, dynamic>? source,
      @HiveField(1) this.author,
      @HiveField(2) this.title,
      @HiveField(3) this.description,
      @HiveField(4) this.url,
      @HiveField(5) this.urlToImage,
      @HiveField(6) this.publishedAt,
      @HiveField(7) this.content})
      : _source = source;

  factory _$_ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleModelFromJson(json);

  final Map<String, dynamic>? _source;
  @override
  @HiveField(0)
  Map<String, dynamic>? get source {
    final value = _source;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @HiveField(1)
  final String? author;
  @override
  @HiveField(2)
  final String? title;
  @override
  @HiveField(3)
  final String? description;
  @override
  @HiveField(4)
  final String? url;
  @override
  @HiveField(5)
  final String? urlToImage;
  @override
  @HiveField(6)
  final String? publishedAt;
  @override
  @HiveField(7)
  final String? content;

  @override
  String toString() {
    return 'ArticleModel(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleModel &&
            const DeepCollectionEquality().equals(other._source, _source) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other.urlToImage, urlToImage) &&
            const DeepCollectionEquality()
                .equals(other.publishedAt, publishedAt) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_source),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(urlToImage),
      const DeepCollectionEquality().hash(publishedAt),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$_ArticleModelCopyWith<_$_ArticleModel> get copyWith =>
      __$$_ArticleModelCopyWithImpl<_$_ArticleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleModelToJson(
      this,
    );
  }
}

abstract class _ArticleModel implements ArticleModel {
  factory _ArticleModel(
      {@HiveField(0) final Map<String, dynamic>? source,
      @HiveField(1) final String? author,
      @HiveField(2) final String? title,
      @HiveField(3) final String? description,
      @HiveField(4) final String? url,
      @HiveField(5) final String? urlToImage,
      @HiveField(6) final String? publishedAt,
      @HiveField(7) final String? content}) = _$_ArticleModel;

  factory _ArticleModel.fromJson(Map<String, dynamic> json) =
      _$_ArticleModel.fromJson;

  @override
  @HiveField(0)
  Map<String, dynamic>? get source;
  @override
  @HiveField(1)
  String? get author;
  @override
  @HiveField(2)
  String? get title;
  @override
  @HiveField(3)
  String? get description;
  @override
  @HiveField(4)
  String? get url;
  @override
  @HiveField(5)
  String? get urlToImage;
  @override
  @HiveField(6)
  String? get publishedAt;
  @override
  @HiveField(7)
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleModelCopyWith<_$_ArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
