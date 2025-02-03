import 'package:ecommerce/domain/models/authentication/authentication_data_model.dart';
import 'package:ecommerce/presentation/core/storage/keys/defined_stored_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppLocalStorage {
  static late FlutterSecureStorage flutterSecureStorage;

  static void initFlutterSecureStorage() {
    flutterSecureStorage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  static Future<void> setUserInfo(AuthenticationDataModel userInfo) {
    String value =
        "${userInfo.user?.name}_${userInfo.user?.email}_${userInfo.user?.role}_${userInfo.token}";
    return flutterSecureStorage.write(
        key: DefinedStoredKeys.userInfoKey, value: value);
  }

  static Future<AuthenticationDataModel?> getUserInfo() async {
    var storedValue =
        await flutterSecureStorage.read(key: DefinedStoredKeys.userInfoKey);
    List<String> infoList = storedValue?.split("_") ?? [];
    if (infoList.isNotEmpty) {
      return AuthenticationDataModel(
          message: "No Message",
          user: UserData(
              name: infoList[0], email: infoList[1], role: infoList[2]),
          token: infoList[3]);
    }
    return null;
  }
}
