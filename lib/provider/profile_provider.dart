import 'package:blog_app/constants/api_urls.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/network/api_services.dart';
import 'package:flutter/widgets.dart';

class ProfileProvider extends ChangeNotifier {
  //--------------- Controller -----------
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  //--------------- profile data get loading ---------
  bool profileLoading = false;
  //--------------- profile data get message ---------
  String profileLoadMessage = "";
  //========================= Get User profile ==========================
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

  //=========================== Update Profile =================
  //---------- profile update loading ---------
  bool profileUpdateLoading = false;
  //---------- profile update message ------
  String profileUpdateMessage = '';

  Future<void> updateProfile() async {
    try {
      profileUpdateLoading = true;
      notifyListeners();

      //-------------- update data map ---------
      Map<String, dynamic> responseBody = {
        "name": "John Updated",
        "phone": "+9876543210",
      };

      final ApiLogResponse response = await ApiServices.postData(
        ApiUrls.profileUrl,
        responseBody,
      );

      profileUpdateLoading = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        profileUpdateMessage =
            response.message ?? "Profile update successful --";
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

  //=========================== Update Profile =================
  bool changePasswordLoading = false;
  String changePasswodMessage = '';

  //======================== Change Password ======================
  Future<void> changePassword() async {
    try {
      changePasswordLoading = true;
      notifyListeners();

      //-------------- update data map ---------
      Map<String, dynamic> responseBody = {
        "current_password": "oldpassword123",
        "new_password": "newpassword123",
      };

      final ApiLogResponse response = await ApiServices.postData(
        ApiUrls.profileUrl,
        responseBody,
      );

      changePasswordLoading = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
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
    passwordController.clear();
    newPasswordController.clear();
  }
}
