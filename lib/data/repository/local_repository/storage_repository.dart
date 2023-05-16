

import 'package:get_storage/get_storage.dart';

late GetStorage _box;

class LocalStore {
  static void initialize() => _box = GetStorage();

  static readValue({required key}) => _box.read(key);
  static void writeValue({required key, required value}) => _box.write(key, value);
  static void removeValue({required key}) => _box.remove(key);

}