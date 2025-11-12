import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class AuthGetStorage {
  static final GetStorage _storage = GetStorage();

  static final String _userTokenKey = "user_token_key";
  static final String _loginStatusKey = "login_status_key";

  //============== Save login status ==========
  static Future<void> loginStatusSave(bool status) async {
    await _storage.write(_loginStatusKey, status);
  }

  //========== Get Login status =========
  static bool getLoginStatus() {
    return _storage.read(_loginStatusKey) ?? false;
  }

  //================ - Clear Login Status==========
  static clearLoginStatus() async {
    await _storage.remove(_loginStatusKey);
  }

  //--------------------- save user token ---------
  static Future<void> saveUserToken(String token) async {
    Logger logger = Logger();

    await _storage.write(_userTokenKey, token);
    logger.i("Save token $token to storage");
  }

  //------------------ get user token ------------
  static String? getUserToken() {
    return _storage.read(_userTokenKey);
  }

  //-------------------- Clear Token ----------
  static clearUserToken() async {
    await _storage.remove(_userTokenKey);
  }
}
