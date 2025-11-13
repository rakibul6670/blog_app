import 'package:blog_app/features/blog/model/comment_author_model.dart';

class BlogCommentModel {
  final String id;
  final String postId;
  final String userId;
  final String parentId;
  final String content;
  final int likesCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String authorName;
  final List<BlogCommentModel> replies;
  final CommentAuthorModel author;
  final bool isLiked;

  //=============== Constructor =============
  BlogCommentModel({
    required this.id,
    required this.postId,
    required this.userId,
    required this.parentId,
    required this.content,
    required this.likesCount,
    required this.createdAt,
    required this.updatedAt,
    required this.authorName,
    required this.replies,
    required this.author,
    required this.isLiked,
  });

  //=============== Factory Constructor ======
  factory BlogCommentModel.fromJson(Map<String, dynamic> json) {
    return BlogCommentModel(
      id: json['id']?.toString() ?? '',
      postId: json['post_id']?.toString() ?? '',
      userId: json['user_id']?.toString() ?? '',
      parentId: json['parent_id']?.toString() ?? '0',
      content: json['content']?.toString() ?? '',
      likesCount: int.tryParse(json['likes_count']?.toString() ?? '0') ?? 0,
      createdAt: DateTime.parse(
        json['created_at']?.toString() ?? DateTime.now().toString(),
      ),
      updatedAt: DateTime.parse(
        json['updated_at']?.toString() ?? DateTime.now().toString(),
      ),
      authorName: json['author_name']?.toString() ?? '',
      replies: (json['replies'] as List<dynamic>? ?? [])
          .map((replyJson) => BlogCommentModel.fromJson(replyJson))
          .toList(),
      author: CommentAuthorModel.fromJson(json['author'] ?? {}),
      isLiked: json['is_liked'] ?? false,
    );
  }

  //=============== Conver to json when data sent ===
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'post_id': postId,
      'user_id': userId,
      'parent_id': parentId,
      'content': content,
      'likes_count': likesCount.toString(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'author_name': authorName,
      'replies': replies.map((reply) => reply.toJson()).toList(),
      'author': author.toJson(),
      'is_liked': isLiked,
    };
  }

  // ---------------  CopyWith Method ----------
  BlogCommentModel copyWith({
    String? id,
    String? postId,
    String? userId,
    String? parentId,
    String? content,
    int? likesCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? authorName,
    List<BlogCommentModel>? replies,
    CommentAuthorModel? author,
    bool? isLiked,
  }) {
    return BlogCommentModel(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      parentId: parentId ?? this.parentId,
      content: content ?? this.content,
      likesCount: likesCount ?? this.likesCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      authorName: authorName ?? this.authorName,
      replies: replies ?? this.replies,
      author: author ?? this.author,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
