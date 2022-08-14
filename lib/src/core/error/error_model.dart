import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel extends Equatable{
  final String? status;
  final String? code;
  final String? message;

  const ErrorModel({
    this.status,
    this.code,
    this.message,
  }
  );

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
  
  @override
  List<Object?> get props => [status, code, message];


}