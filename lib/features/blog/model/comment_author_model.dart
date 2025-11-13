class CommentAuthorModel {
  final String id;
  final String name;
  final String email;
  final String avatar;

  //====================== Constructor ===============
  CommentAuthorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  //====================== Factory Constructor =================
  factory CommentAuthorModel.fromJson(Map<String, dynamic> json) {
    return CommentAuthorModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      avatar: json['avatar']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'avatar': avatar};
  }

  //=========== Copy Method for update Author Model ============
  CommentAuthorModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
  }) {
    return CommentAuthorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }
}
