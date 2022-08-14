import 'package:aagel/src/core/utils/data_state.dart';
import 'package:aagel/src/core/utils/query_params.dart';

abstract class UseCase{

  Future<DataState> call({required QueryParams params});
  
}