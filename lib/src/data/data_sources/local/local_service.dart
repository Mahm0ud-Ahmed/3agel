import 'package:aagel/src/core/utils/constant.dart';
import 'package:aagel/src/data/models/article_model.dart';
import 'package:hive/hive.dart';

abstract class LocalService{
  Future<List<ArticleModel>> getAllArticle();
  Future<bool> addArticle(ArticleModel article);
  Future<bool> removeArticle(String url);
}

class LocalServiceImpl implements LocalService{

  @override
  Future<bool> addArticle(ArticleModel article) async{
    Box box = await _openBox(Constant.kBoxNameHive);
    if(box.isOpen){
      box.put(article.url, article);
      Hive.close();
      return true;
    }else if(!box.isOpen){
      box = await _openBox(Constant.kBoxNameHive);
      box.put(article.url, article);
      Hive.close();
      return true;
    }
    Hive.close();
    return false;
  }

  @override
  Future<List<ArticleModel>> getAllArticle() async{
    Box box = await _openBox(Constant.kBoxNameHive);
    List<ArticleModel> articles = [];
    if(box.isOpen){
      final keys = box.keys;
      for (var key in keys) {
        articles.add(box.get(key));
      }
    }
    Hive.close();
    return articles;
  }

  @override
  Future<bool> removeArticle(String url) async{
    Box box = await _openBox(Constant.kBoxNameHive);
    if(box.isOpen && box.containsKey(url)){
      box.delete(url);
      Hive.close();
      return true;
    }else if(!box.isOpen){
      box = await _openBox(Constant.kBoxNameHive);
      if(box.containsKey(url)){
        box.delete(url);
        Hive.close();
        return true;
      }
    }
    Hive.close();
    return false;
  }

  Future<Box> _openBox(String boxName) async{
    return await Hive.openBox(boxName);
  }

}
