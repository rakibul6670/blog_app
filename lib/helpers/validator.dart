class Validator {
  //--------------- Username Validator -----------------
  static String? validatename(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    }

    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }

    // ----space -a b ,c and underscrore check
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegex.hasMatch(value)) {
      return 'Username can only contain letters, \n numbers, and underscores';
    }

    return null;
  }

  //--------------- Email Validator -----------------
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  //--------------- Password Validator -----------------
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  //--------------- Confirm Password Validator -----------------
  static String? validateConfirmPassword(
    String? value,
    String? originalPassword,
  ) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  //-----------------Phoen number validator -----------
  static String? validatePhone(String? value){
    if(value == null || value.isEmpty){
      return "Phone can't be empty";
    }
    if(value.length < 10){
      return "phone number must be at leat 10 digits";
    }
    return null;

  }



}
