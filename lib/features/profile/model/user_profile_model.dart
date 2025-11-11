class UserProfileModel {
  final String name;
  final String email;
  final String phone;

  //==================== Constructor ==================
  UserProfileModel({
    required this.name,
    required this.email,
    required this.phone,
  });

  //================ Factory Constructor ============
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
    );
  }

  //================= To Json =============
  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "phone": phone};
  }
}
