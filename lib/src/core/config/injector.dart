import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:aagel/src/data/data_sources/remote/api_service.dart';
import 'package:aagel/src/data/data_sources/remote/dio_clinet.dart';
import 'package:aagel/src/data/repositories/app_repository_imp.dart';
import 'package:aagel/src/presentation/blocs/api_data_bloc.dart';

import '../../domain/repositories/i_app_repository.dart';


final injector = GetIt.instance;

Future<void> initializeDependencies() async {

  injector.registerLazySingleton<Dio>(() => DioClient.initialDio());
  injector.registerLazySingleton<ApiService>(() => ApiService(injector()));
  injector.registerLazySingleton<IAppRepository>(() => AppRepositoryImp(injector()));
  injector.registerFactory<ApiDataBloc>(() => ApiDataBloc());

}
