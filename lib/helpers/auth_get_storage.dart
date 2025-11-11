import 'package:get_storage/get_storage.dart';

class AuthGetStorage {
  static final GetStorage storage = GetStorage();
  static String userTokenKey = "user_token_key";

  //--------------------- save user token ---------
  static Future<void> saveUserToken(String token) async {
    await storage.write(userTokenKey, token);
  }

  //------------------ get user token ------------
  static String? getUserToken() {
    return storage.read(userTokenKey);
  }

  //-------------------- Clear Token ----------
  static clearUserToken() async {
    await storage.remove(userTokenKey);
  }
}
