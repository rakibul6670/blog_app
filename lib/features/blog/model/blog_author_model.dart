class BlogAuthorModel {
  final int id;
  final String name;
  final String avatar;
  // final String bio;

  BlogAuthorModel({
    required this.id,
    required this.name,
    required this.avatar,
    // required this.bio,
  });

  factory BlogAuthorModel.fromJson(Map<String, dynamic> json) {
    return BlogAuthorModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }
}
