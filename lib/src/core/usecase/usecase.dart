import 'package:aagel/src/core/utils/data_state.dart';

abstract class UseCase<T>{

  Future<DataState> call({T params});
  
}