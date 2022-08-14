import 'package:aagel/src/core/services/service_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StorageService extends ServiceInterface {

  @override
  String get name => 'Storage';

  SharedPreferences? _preferences;

  @override
  Future initialize() async {
    return _preferences = await SharedPreferences.getInstance();
  }

  Future<Set<String>> keys() async {
    return _preferences!.getKeys();
  }

  Future<bool> has(String key) async {
    return _preferences!.containsKey(key);
  }

  // Removing
  Future<bool> clear(String key) async {
    return _preferences!.clear();
  }

  Future<bool> remove(String key) async {
    return _preferences!.remove(key);
  }

  // saving
  Future<bool> saveBool(String key, bool value) async {
    return _preferences!.setBool(key, value);
  }

  Future<bool> saveString(String key, String value) async {
    return _preferences!.setString(key, value);
  }

  Future<bool> saveInt(String key, int value) async {
    return _preferences!.setInt(key, value);
  }

  Future<bool> saveDouble(String key, double value) async {
    return _preferences!.setDouble(key, value);
  }

  Future<bool> saveList(String key, List<String> value) async {
    return _preferences!.setStringList(key, value);
  }


  ///for any get operation from data storage service it's the caller responsibility to handle null cases
  bool? getBool(String name) {
    try {
      return _preferences!.getBool(name);
    } on Exception catch (error) {
      if(kDebugMode){
        print(error.toString());
      }
    }
    return null;
  }

  String? getString(String name) {
    try {
      return _preferences!.getString(name);
    } on Exception catch (error) {
      if(kDebugMode){
        print(error.toString());
      }
    }
    return null;
  }

  int? getInt(String name) {
    try {
      return _preferences!.getInt(name);
    } on Exception catch (error) {
      if(kDebugMode){
        print(error.toString());
      }
    }
    return null;
  }

  double? getDouble(String name) {
    try {
      return _preferences!.getDouble(name);
    } on Exception catch (error) {
      if(kDebugMode){
        print(error.toString());
      }
    }
    return null;
  }

  List<String>? getList(String name) {
    try {
      return _preferences!.getStringList(name);
    } on Exception catch (error) {
      if(kDebugMode){
        print(error.toString());
      }
    }
    return null;
  }

  Set<String> getKeys() {
    return _preferences!.getKeys();
  }



  // singleton
  StorageService.init();
  static StorageService? _instance;
  factory StorageService() => _instance ??= StorageService.init();
}
