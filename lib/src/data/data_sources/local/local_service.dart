import 'package:aagel/src/core/utils/constant.dart';
import 'package:aagel/src/data/models/article_model.dart';
import 'package:hive/hive.dart';

abstract class LocalService{
  Future<List<ArticleModel>> getAllArticle();
  Future<bool> addArticle(ArticleModel article);
  Future<bool> removeArticle(String url);
  Future<bool> checkArticle(String url);
}

class LocalServiceImpl implements LocalService{

  String getUrl(String url){
    if(url.length > 255){
        return url.substring(0, 254);
    }
    return url;
  }
  @override
  Future<bool> addArticle(ArticleModel article) async{
    Box box = await _openBox(Constant.kBoxNameHive);
    String keyUrl = getUrl(article.url!);
    if(box.isOpen){
      box.put(keyUrl, article);
      Hive.close();
      return true;
    }else if(!box.isOpen){
      box = await _openBox(Constant.kBoxNameHive);
      box.put(keyUrl, article);
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
    String keyUrl = getUrl(url);
    if(box.isOpen && box.containsKey(keyUrl)){
      box.delete(keyUrl);
      // Hive.close();
      return true;
    }else if(!box.isOpen){
      box = await _openBox(Constant.kBoxNameHive);
      if(box.containsKey(url)){
        box.delete(url);
        // Hive.close();
        return true;
      }
    }
    // Hive.close();
    return false;
  }

  @override
  Future<bool> checkArticle(String url) async{
    Box box = await _openBox(Constant.kBoxNameHive);
    String keyUrl = getUrl(url);
    if(box.isOpen){
      return box.containsKey(keyUrl) ? true : false;
    }else{
      box = await _openBox(Constant.kBoxNameHive);
      return box.containsKey(keyUrl) ? true : false;
    }
  }

  Future<Box> _openBox(String boxName) async{
    return await Hive.openBox(boxName);
  }
  
  

}
