import 'package:blog_app/constants/api_urls.dart';
import 'package:blog_app/features/profile/model/user_profile_model.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/helpers/profile_get_storage.dart';
import 'package:blog_app/network/api_services.dart';
import 'package:flutter/widgets.dart';

class ProfileProvider extends ChangeNotifier {
  //--------------- Controller -----------
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  bool isNewPasswordHide = true;
  bool isCurrentPasswordHide = true;

  //---------------- user profiel model -------
  UserProfileModel? userProfileModel;

  //====================== Current Password hide and show ===========
  void currentPasswordToggle() {
    isCurrentPasswordHide = !isCurrentPasswordHide;
    notifyListeners();
  }

  //====================== New Password hide and show ===========
  void newPasswordToggle() {
    isNewPasswordHide = !isNewPasswordHide;
    notifyListeners();
  }

  //========================= Get User profile ==========================
  //--------------- profile data get loading ---------
  bool profileLoading = false;
  //--------------- profile data get message ---------
  String profileLoadMessage = "";

  Future<void> getProfileData() async {
    try {
      profileLoading = true;
      notifyListeners();

      final ApiLogResponse response = await ApiServices.getData(
        ApiUrls.profileUrl,
      );

      profileLoading = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        //------------ set user profile model --------
        UserProfileModel model = UserProfileModel.fromJson(
          response.responseBody?["data"]["user"] ?? {},
        );

        userProfileModel = model;
        //---------- save user profile to local storage ------
        ProfileGetStorage.saveUserProfile(model);

        //---------------set success message ------
        profileLoadMessage = response.message ?? "Profile load successful --";

        notifyListeners();
      } else {
        profileLoadMessage = response.message ?? "profile load failed --";
        notifyListeners();
      }
    } catch (e) {
      profileLoadMessage = e.toString();
      notifyListeners();
    }
  }

  //=========================== Update Profile ============================
  //---------- profile update loading ---------
  bool profileUpdateLoading = false;
  bool isProfileUpdated = false;
  //---------- profile update message ------
  String profileUpdateMessage = '';
  //========= update profile method ======
  Future<void> updateProfile() async {
    try {
      profileUpdateLoading = true;
      notifyListeners();

      //-------------- update data map ---------
      Map<String, dynamic> responseBody = {
        "name": nameController.text.trim(),
        "phone": phoneController.text.trim(),
      };

      final ApiLogResponse response = await ApiServices.putData(
        ApiUrls.profileUrl,
        responseBody,
      );

      profileUpdateLoading = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        //---------- get update user profile ----
        getProfileData();

        profileUpdateMessage =
            response.message ?? "Profile update successful --";
        isProfileUpdated = true;
        notifyListeners();
      } else {
        profileUpdateMessage = response.message ?? "profile update failed --";
        notifyListeners();
      }
    } catch (e) {
      profileUpdateMessage = e.toString();
      notifyListeners();
    }
  }

  //================================ Update Profile =================
  bool changePasswordLoading = false;
  String changePasswodMessage = '';
  bool isPasswordUpdated = false;

  //=== Update Password Method ==
  Future<void> updatePassword() async {
    try {
      changePasswordLoading = true;
      notifyListeners();

      //-------------- update data map ---------
      Map<String, dynamic> responseBody = {
        "current_password": currentPasswordController.text.trim(),
        "new_password": newPasswordController.text.trim(),
      };

      final ApiLogResponse response = await ApiServices.postData(
        ApiUrls.changePasswordUrl,
        responseBody,
      );

      changePasswordLoading = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        isPasswordUpdated = true;
        changePasswodMessage =
            response.message ?? "Password change successful --";
        notifyListeners();
      } else {
        changePasswodMessage = response.message ?? "password change failed --";
        notifyListeners();
      }
    } catch (e) {
      changePasswodMessage = e.toString();
      notifyListeners();
    }
  }

  //================== clear profile update controller  field ===========
  void clearProfileUpdateFields() {
    nameController.clear();
    phoneController.clear();
  }

  //================== clear password change controller field ===========
  void clearChangePasswordFields() {
    currentPasswordController.clear();
    newPasswordController.clear();
  }
}
