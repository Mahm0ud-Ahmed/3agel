import 'package:aagel/src/core/error/error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'data_state.freezed.dart';

@freezed
abstract class DataState<T> with _$DataState<T>{
  const factory DataState.success(T data) = Success<T>;
  const factory DataState.failure(ErrorModel? data) = Failure<T>;
}