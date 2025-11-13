class BlogAuthorModel {
  final int id;
  final String name;
  final String avatar;

  BlogAuthorModel({required this.id, required this.name, required this.avatar});

  factory BlogAuthorModel.fromJson(Map<String, dynamic> json) {
    return BlogAuthorModel(
      id: (json['id'] is int)
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      name: json['name']?.toString() ?? '',
      avatar: json['avatar']?.toString() ?? '',
    );
  }
}
