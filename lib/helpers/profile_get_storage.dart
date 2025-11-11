import 'dart:convert';

import 'package:blog_app/features/profile/model/user_profile_model.dart';
import 'package:get_storage/get_storage.dart';

class ProfileGetStorage {
  static final GetStorage _storage = GetStorage();

  static final String _userProfileKey = "User_Profile_key";

  //=================== Save User Profile ================
  static Future<void> saveUserProfile(UserProfileModel profile) async {
    //---------- conver profile model to json Strign -------
    final profileJosn = profile.toJson();
    //--------- strore user profile data in local storage ------
    final encodedData = jsonEncode(profileJosn);
    await _storage.write(_userProfileKey, encodedData);
  }

  //=================== Get User Profile =============
  static Future getUserProfile() async {
    final profileJson = _storage.read(_userProfileKey);

    if (profileJson != null) {
      //------------- decode json string -----
      final decodedProfile = jsonDecode(profileJson);
      //---------convert json string to user profile model-
      return UserProfileModel.fromJson(decodedProfile);
    }
    return null;
  }

  //================= Clear user profile ============
  static clearUserProfile() async {
    await _storage.remove(_userProfileKey);
  }
}
