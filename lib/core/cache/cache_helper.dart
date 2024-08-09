import 'package:hive_flutter/hive_flutter.dart';

class CacheHelper {
  static late Box _box;

  Future<void> init() async {
    _box = await Hive.openBox('cacheBox');
  }

  Future<void> saveData({required String key, required dynamic value}) async {
    await _box.put(key, value);
  }

  dynamic getData({required String key}) {
    return _box.get(key);
  }

  Future<void> removeData({required String key}) async {
    await _box.delete(key);
  }

  bool containsKey({required String key}) {
    return _box.containsKey(key);
  }

  Future<void> clearData() async {
    await _box.clear();
  }
}
