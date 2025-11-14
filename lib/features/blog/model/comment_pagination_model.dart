class CommentPaginationModel {
  final int currentPage;
  final int perPage;
  final int totalComments;
  final int totalPages;

  CommentPaginationModel({
    required this.currentPage,
    required this.perPage,
    required this.totalComments,
    required this.totalPages,
  });

  factory CommentPaginationModel.fromJson(Map<String, dynamic> json) {
    return CommentPaginationModel(
      currentPage: json['current_page'],
      perPage: json['per_page'],
      totalComments: json['total_comments'],
      totalPages: json['total_pages'],
    );
  }
}
