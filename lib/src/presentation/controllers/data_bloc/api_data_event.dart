// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'api_data_bloc.dart';

abstract class ApiDataEvent extends Equatable {

  QueryParams? queryParams;

  ApiDataEvent(this.queryParams);

  @override
  List<Object?> get props => [queryParams];
}

/* class ApiDataCollection extends ApiDataEvent {

  ApiDataCollection({QueryParams? queryParams}) : super(queryParams);
}

class ApiDataSingle extends ApiDataEvent {

  ApiDataSingle({QueryParams? queryParams}) : super(queryParams);
} */

class ApiDataPagination extends ApiDataEvent {

  ApiDataPagination({QueryParams? queryParams}) : super(queryParams);
}

class ApiDataByPath extends ApiDataEvent {
  String path;

  ApiDataByPath(this.path, {QueryParams? queryParams}) : super(queryParams);
}