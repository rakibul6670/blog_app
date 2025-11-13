class PaginationModel {
  final int currentPage;
  final int perPage;
  final int totalPosts;
  final int totalPages;

  PaginationModel({
    required this.currentPage,
    required this.perPage,
    required this.totalPosts,
    required this.totalPages,
  });

  // factory PaginationModel.fromJson(Map<String, dynamic> json) {
  //   return PaginationModel(
  //     currentPage: (json['current_page'] is int)
  //         ? json['current_page']
  //         : int.tryParse(json['current_page']?.toString() ?? '1') ?? 1,
  //     perPage: (json['per_page'] is int)
  //         ? json['per_page']
  //         : int.tryParse(json['per_page']?.toString() ?? '10') ?? 10,
  //     totalPosts: (json['total_posts'] is int)
  //         ? json['total_posts']
  //         : int.tryParse(json['total_posts']?.toString() ?? '0') ?? 0,
  //     totalPages: (json['total_pages'] is int)
  //         ? json['total_pages']
  //         : int.tryParse(json['total_pages']?.toString() ?? '1') ?? 1,
  //   );
  // }
}
