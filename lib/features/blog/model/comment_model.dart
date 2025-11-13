import 'package:blog_app/features/blog/model/comment_author_model.dart';
import 'package:logger/logger.dart';

class CommentModel {
  final int id;
  final int postId;
  final int userId;
  final int parentId;
  final String content;
  final int likesCount;
  final String createdAt;
  final String updatedAt;
  final CommentAuthorModel author;
  final List<CommentModel> replies;
  final bool isLiked;

  const CommentModel({
    required this.id,
    required this.postId,
    required this.userId,
    required this.parentId,
    required this.content,
    required this.likesCount,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
    required this.replies,
    required this.isLiked,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    try {
      return CommentModel(
        id: int.tryParse(json['id']?.toString() ?? '0') ?? 0,
        postId: int.tryParse(json['post_id']?.toString() ?? '0') ?? 0,
        userId: int.tryParse(json['user_id']?.toString() ?? '0') ?? 0,
        parentId: int.tryParse(json['parent_id']?.toString() ?? '0') ?? 0,
        content: json['content']?.toString() ?? '',
        likesCount: int.tryParse(json['likes_count']?.toString() ?? '0') ?? 0,
        createdAt: json['created_at']?.toString() ?? '',
        updatedAt: json['updated_at']?.toString() ?? '',
        author: CommentAuthorModel.fromJson(json['author'] ?? {}),
        replies: (json['replies'] is List)
            ? (json['replies'] as List)
                  .map((e) => CommentModel.fromJson(e))
                  .toList()
            : [],
        isLiked: json['is_liked'] == true,
      );
    } catch (e) {
      //----------------- default value set and error handle -------
      Logger logger = Logger();
      logger.e(" Error parsing CommentModel: $e");

      return const CommentModel(
        id: 0,
        postId: 0,
        userId: 0,
        parentId: 0,
        content: '',
        likesCount: 0,
        createdAt: '',
        updatedAt: '',
        author: CommentAuthorModel(id: 0, name: 'Anonymous', avatar: ''),
        replies: [],
        isLiked: false,
      );
    }
  }
}
