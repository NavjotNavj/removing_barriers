// Create storage
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static FlutterSecureStorage? _secureStorage;
  static SharedPreferences? _pref;


  static Future init() async {
    _secureStorage = new FlutterSecureStorage();
    _pref = await SharedPreferences.getInstance();
  }

  static Future<dynamic> getValue(String key,
      {dynamic defaultValue, Type? cast}) async {
    try {
      if (cast != null) {
        switch (cast) {
          case String:
            return await _secureStorage!.read(key: key);
          case bool:
            return (await _secureStorage!.read(key: key)) == "true";
          case double:
            return double.tryParse((await _secureStorage!.read(key: key))!);
          case int:
            return int.tryParse((await _secureStorage!.read(key: key))!);
        }
      } else {
        return await _secureStorage!.read(key: key);
      }
    } catch (ex) {
      return defaultValue;
    }
  }

  static Future<void> clearSecureStorage() async {
    _secureStorage!.deleteAll();
    // FlutterFreshchat.resetUser();
  }

  static Future<void> setValue(String key, dynamic value) async {
    switch (value.runtimeType) {
      case String:
        await _secureStorage!.write(key: key, value: value.toString());
        break;
      case bool:
        await _secureStorage!.write(key: key, value: value ? "true" : "false");
        break;
      case double:
        await _secureStorage!.write(key: key, value: value.toString());
        break;
      case int:
        await _secureStorage!.write(key: key, value: value.toString());
        break;
      default:
        await _secureStorage!.write(key: key, value: value.toString());
        break;
    }
  }

  static dynamic getPref(String key, {dynamic defaultValue}) {
    if (_pref!.containsKey(key)) {
      return _pref!.get(key);
    } else {
      return defaultValue;
    }
  }

  static clearPrefs() {
    String fcmToken = getPref(PrefConstants.FCM_TOKEN);
    _pref!.clear();
    // FlutterFreshchat.resetUser();
    setPref(PrefConstants.FCM_TOKEN, fcmToken);
  }

  static void setPref(String key, dynamic value) {
    switch (value.runtimeType) {
      case String:
        _pref!.setString(key, value);
        return;
      case bool:
        _pref!.setBool(key, value);
        return;
      case double:
        _pref!.setDouble(key, value);
        return;
      case int:
        _pref!.setInt(key, value);
        return;
      case List:
        _pref!.setStringList(key, value);
        return;
    }
  }
}

class PrefConstants {
  static const String USER_ROLE = "userRole";
  static const String AUTO_LOGIN = "autoLogin";
  static const String IS_LOGGED_IN = "isLogin";
  static const String FCM_TOKEN = "fcmToken";
  static const String JWT_TOKEN = "fcmToken";
  static const String LANGUAGE_CODE = "languageCode";
  static const String LOCATION_ID = "locationId";
  static const String CUSTOMER_ID = "customerId";
  static const String LOCATION_MAPPING_ID = "locationMappingId";
  static const String ORG_ID = "orgId";
}
