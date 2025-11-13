import 'package:logger/web.dart';

class SingleBlogPostAuthorModel {
  final int id;
  final String name;
  final String avatar;
  final String bio;

  const SingleBlogPostAuthorModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.bio,
  });

  factory SingleBlogPostAuthorModel.fromJson(Map<String, dynamic> json) {
    try {
      return SingleBlogPostAuthorModel(
        id: (json['id'] is int)
            ? json['id']
            : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
        name: json['name']?.toString() ?? 'Unknown Author',
        avatar: json['avatar']?.toString() ?? '',
        bio: json['bio']?.toString() ?? 'No bio available',
      );
    } catch (e) {
      // Return default fallback Model.. when parsing failure
      Logger logger = Logger();
      logger.e("Error parsing SingleBlogPostAuthorModel: $e'");

      return const SingleBlogPostAuthorModel(
        id: 0,
        name: 'Unknown Author',
        avatar: '',
        bio: 'No bio available',
      );
    }
  }
}
