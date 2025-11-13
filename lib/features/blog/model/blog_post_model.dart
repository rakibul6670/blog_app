import 'package:blog_app/features/blog/model/blog_author_model.dart';

class BlogPostModel {
  final int id;
  final String title;
  final String excerpt;
  final String featuredImage;
  final BlogAuthorModel author;
  final List<String> categories;
  final String readTime;
  final String createdAt;
  final int likeCount;
  final int commentCount;
  final bool isLiked;
  final bool isBookmarked;

  const BlogPostModel({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.featuredImage,
    required this.author,
    required this.categories,
    required this.readTime,
    required this.createdAt,
    required this.likeCount,
    required this.commentCount,
    required this.isLiked,
    required this.isBookmarked,
  });

  factory BlogPostModel.fromJson(Map<String, dynamic> json) {
    // Handle categories - they might come as List<dynamic> or List<String>
    List<String> categoriesList = [];
    if (json['categories'] != null) {
      if (json['categories'] is List) {
        categoriesList = List<String>.from(
          json['categories'].map((item) => item.toString()),
        );
      }
    }

    // Handle author data
    BlogAuthorModel authorModel;
    if (json['author'] != null && json['author'] is Map<String, dynamic>) {
      authorModel = BlogAuthorModel.fromJson(json['author']);
    } else {
      authorModel = BlogAuthorModel(id: 0, name: 'Unknown', avatar: '');
    }

    return BlogPostModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      title: json['title']?.toString() ?? 'No Title',
      excerpt: json['excerpt']?.toString() ?? '',
      featuredImage: json['featured_image']?.toString() ?? '',
      author: authorModel,
      categories: categoriesList,
      readTime: json['read_time']?.toString() ?? '0',
      createdAt: json['created_at']?.toString() ?? '',
      likeCount: json['like_count'] is int
          ? json['like_count']
          : int.tryParse(json['like_count'].toString()) ?? 0,
      commentCount: json['comment_count'] is int
          ? json['comment_count']
          : int.tryParse(json['comment_count'].toString()) ?? 0,
      isLiked: json['is_liked'] is bool
          ? json['is_liked']
          : (json['is_liked']?.toString() == 'true'),
      isBookmarked: json['is_bookmarked'] is bool
          ? json['is_bookmarked']
          : (json['is_bookmarked']?.toString() == 'true'),
    );
  }
}
