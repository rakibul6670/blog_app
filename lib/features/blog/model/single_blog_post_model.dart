import 'package:blog_app/features/blog/model/single_blog_post_auther_model.dart';
import 'package:logger/web.dart';

class SingleBlogPostModel {
  final int id;
  final String title;
  final String content;
  final String excerpt;
  final String featuredImage;
  final SingleBlogPostAuthorModel author;
  final List<String> categories;
  final List<String> tags;
  final int readTime;
  final DateTime createdAt;
  final int likeCount;
  final int commentCount;
  final int singlePostCount;
  final bool isLiked;
  final bool isBookmarked;

  SingleBlogPostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.featuredImage,
    required this.author,
    required this.categories,
    required this.tags,
    required this.readTime,
    required this.createdAt,
    required this.likeCount,
    required this.commentCount,
    required this.singlePostCount,
    required this.isLiked,
    required this.isBookmarked,
  });

  factory SingleBlogPostModel.fromJson(Map<String, dynamic> json) {
    try {
      return SingleBlogPostModel(
        id: (json['id'] is int)
            ? json['id']
            : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
        title: json['title']?.toString() ?? '',
        content: json['content']?.toString() ?? '',
        excerpt: json['excerpt']?.toString() ?? '',
        featuredImage: json['featured_image']?.toString() ?? '',
        author: SingleBlogPostAuthorModel.fromJson(json['author'] ?? {}),
        categories: List<String>.from(json['categories'] ?? []),
        tags: List<String>.from(json['tags'] ?? []),
        readTime: (json['read_time'] is int)
            ? json['read_time']
            : int.tryParse(json['read_time']?.toString() ?? '0') ?? 0,
        createdAt:
            DateTime.tryParse(json['created_at']?.toString() ?? '') ??
            DateTime.now(),
        likeCount: (json['like_count'] is int)
            ? json['like_count']
            : int.tryParse(json['like_count']?.toString() ?? '0') ?? 0,
        commentCount: (json["comment_count"] is int)
            ? json["comment_count"]
            : int.tryParse(json["comment_count"]),
        singlePostCount: (json['singlePost_count'] is int)
            ? json['singlePost_count']
            : int.tryParse(json['singlePost_count']?.toString() ?? '0') ?? 0,
        isLiked: json['is_liked'] ?? false,
        isBookmarked: json['is_bookmarked'] ?? false,
      );
    } catch (e) {
      //  any parsing error, then return a safe default model
      Logger logger = Logger();
      logger.e(" Parsing error in SingleBlogPostsModel: $e'");

      return SingleBlogPostModel(
        id: 0,
        title: 'Parsing Error',
        content: '',
        excerpt: '',
        featuredImage: '',
        author: SingleBlogPostAuthorModel.fromJson({}),
        categories: [],
        tags: [],
        readTime: 0,
        createdAt: DateTime.now(),
        likeCount: 0,
        commentCount: 0,
        singlePostCount: 0,
        isLiked: false,
        isBookmarked: false,
      );
    }
  }
}
