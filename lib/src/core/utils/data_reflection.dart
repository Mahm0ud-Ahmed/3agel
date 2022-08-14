import 'package:reflectable/reflectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:aagel/src/core/utils/data_state.dart';
import 'package:aagel/src/core/utils/reflector.dart';

class DataReflection<T>{

  DataState<T> reflectResponse<MODEL>(HttpResponse response){
    T data;
    if(MODEL == String || MODEL == int || MODEL == double || MODEL == bool || MODEL == Map){
      if(response.data is List){
        List<MODEL> list = [];
        for (var item in response.data) {
          list.add(item as MODEL);
        }
        data = list as T;
      } else{
        data = response.data as T;
      }
    }else{
      ClassMirror classMirror = modelReflector.reflectType(MODEL) as ClassMirror;

      if(response.data is! List){
        data = classMirror.newInstance('fromJson', [response.data]) as T;
      } else{

        List<MODEL> list = [];
        for (var item in response.data) {
          list.add(classMirror.newInstance('fromJson', [item]) as MODEL);
        }
        data = list as T;
      }
    }

    return DataSuccess(data);
    
  }

}