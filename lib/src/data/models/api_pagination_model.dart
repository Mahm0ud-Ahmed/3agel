import 'package:equatable/equatable.dart';
import 'package:reflectable/reflectable.dart';
import 'package:aagel/src/core/utils/reflector.dart';

@ModelReflector()
class ApiPaginationModel<MODEL> extends Equatable{
  List<MODEL>? data;
  int? total;
  dynamic skip;
  int? limit;

  ApiPaginationModel({this.data, this.total, this.skip, this.limit});

  factory ApiPaginationModel.fromJson(Map<String, dynamic> json) {

    ClassMirror classMirror = modelReflector.reflectType(MODEL) as ClassMirror;
    List<MODEL> data = [];
    for (var element in (json['products'] as List)) {
      data.add(classMirror.newInstance('fromJson', [element]) as MODEL);
    }

    return ApiPaginationModel<MODEL>(
      limit: json['limit'],
      skip: json['skip'],
      total: json['total'],
      data: data,
    );
  }
  @override
  List<Object?> get props => [data, total, skip, limit];

  reflectObject(Map<String, dynamic> json){
    ClassMirror classMirror = modelReflector.reflectType(MODEL) as ClassMirror;
    return classMirror.newInstance('fromJson', [json]) as MODEL;
  }
}