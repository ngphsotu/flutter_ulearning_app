import '/lib.dart';
import '../common.dart';

class StorageService {
  late final SharedPreferences prefs;

  Future<StorageService> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await prefs.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }
}
