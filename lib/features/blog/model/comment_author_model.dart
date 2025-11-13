import 'package:logger/logger.dart';

class CommentAuthorModel {
  final int id;
  final String name;
  final String avatar;

  const CommentAuthorModel({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory CommentAuthorModel.fromJson(Map<String, dynamic> json) {
    try {
      return CommentAuthorModel(
        id: int.tryParse(json['id']?.toString() ?? '0') ?? 0,
        name: json['name']?.toString().trim().isNotEmpty == true
            ? json['name'].toString()
            : 'Anonymous',
        avatar: json['avatar']?.toString() ?? '',
      );
    } catch (e) {
      //------------- default value set -------------
      Logger logger = Logger();
      logger.e(" Error parsing CommentAuthorModel: $e");

      return const CommentAuthorModel(id: 0, name: 'Anonymous', avatar: '');
    }
  }
}
