// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:reflectable/reflectable.dart';

import 'package:aagel/src/core/utils/reflector.dart';

@ModelReflector()
class ApiPaginationModel<MODEL> extends Equatable {
  List<MODEL>? data;
  int? totalResults;
  String? status;

  ApiPaginationModel({
    this.data,
    this.totalResults,
    this.status,
  });



  factory ApiPaginationModel.fromJson(Map<String, dynamic> json) {

    ClassMirror classMirror = modelReflector.reflectType(MODEL) as ClassMirror;
    List<MODEL> data = [];
    for (var element in (json["articles"] as List)) {
      data.add(classMirror.newInstance('fromJson', [element]) as MODEL);
    }

    return ApiPaginationModel<MODEL>(
      totalResults: json['totalResults'],
      status: json['status'],
      data: data,
    );
  }
  @override
  List<Object?> get props => [data, totalResults, status];
}
