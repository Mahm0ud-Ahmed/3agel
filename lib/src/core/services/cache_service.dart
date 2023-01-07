import 'package:aagel/src/core/services/service_interface.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/models/article_model.dart';


class CacheService extends ServiceInterface {

  @override
  String get name => 'Cache';


  @override
  Future initialize() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(ArticleModelAdapter());
  }


  // singleton
  CacheService.init();
  static CacheService? _instance;
  factory CacheService() => _instance ??= CacheService.init();
}
