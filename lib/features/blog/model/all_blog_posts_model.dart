import 'package:logger/web.dart';

class AllBlogPostsModel {
  final int id;
  final String title;
  final String excerpt;
  final String featuredImage;
  final List<String> categories;

  const AllBlogPostsModel({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.featuredImage,
    required this.categories,
  });

  factory AllBlogPostsModel.fromJson(Map<String, dynamic> json) {
    try {
      // Handle categories safely
      List<String> categoriesList = [];
      if (json['categories'] != null && json['categories'] is List) {
        categoriesList = List<String>.from(
          json['categories'].map((item) => item.toString()),
        );
      }

      return AllBlogPostsModel(
        id: json['id'] is int
            ? json['id']
            : int.tryParse(json['id'].toString()) ?? 0,
        title: json['title']?.toString() ?? 'Untitled Post',
        excerpt: json['excerpt']?.toString() ?? '',
        featuredImage: json['featured_image']?.toString() ?? '',
        categories: categoriesList,
      );
    } catch (e) {
      //  any parsing error, then return a safe default model
      Logger logger = Logger();
      logger.e(" Parsing error in AllBlogPostsModel: $e'");
      return const AllBlogPostsModel(
        id: 0,
        title: 'Unknown Post',
        excerpt: 'Error loading data',
        featuredImage: '',
        categories: [],
      );
    }
  }
}
