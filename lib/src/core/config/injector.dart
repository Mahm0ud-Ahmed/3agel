import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:aagel/src/data/data_sources/remote/api_service.dart';
import 'package:aagel/src/data/repositories/app_repository_imp.dart';

import '../../domain/repositories/i_app_repository.dart';
import '../../presentation/controllers/data_bloc/api_data_bloc.dart';
import '../services/cache_service.dart';
import '../services/dio_service.dart';
import '../services/setting_service.dart';
import '../services/storage_service.dart';


final injector = GetIt.instance;

Future<void> initializeDependencies() async {

  final dioService = await DioService().initialize();

  injector.registerLazySingleton<Dio>(() => dioService);
  injector.registerLazySingleton<StorageService>(() => StorageService());
  injector.registerLazySingleton<ApiService>(() => ApiService(injector()));
  injector.registerLazySingleton<IAppRepository>(() => AppRepositoryImp(injector()));
  injector.registerFactory<ApiDataBloc>(() => ApiDataBloc());

  await StorageService().initialize();
  await SettingService().initialize();
  await CacheService().initialize();

}
