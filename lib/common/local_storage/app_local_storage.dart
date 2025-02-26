import 'package:get_storage/get_storage.dart';

class AppLocalStorage {
  final GetStorage getStorage = GetStorage();

  void saveSomething(String key, String value) {
    getStorage.write(key, value);
  }

  String readSomething(String key) {
    return getStorage.read(key);
  }
}
