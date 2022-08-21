part of 'api_data_bloc.dart';

abstract class ApiDataState<T> extends Equatable {
  final T? data;
  final ErrorModel? error;
  const ApiDataState({this.data, this.error});
  
  @override
  List<Object?> get props => [data, error];
}

class ApiDataIdle extends ApiDataState {
  const ApiDataIdle();
}

class ApiDataLoading extends ApiDataState {
  const ApiDataLoading();
}

class ApiDataLoaded<T> extends ApiDataState<T> {
  const ApiDataLoaded(T data): super(data: data);
}

class ApiDataError extends ApiDataState {
  const ApiDataError(ErrorModel error): super(error: error);
}
