// class BlogCommentModel {
//   final int id;
//   final int userId;
//   final String userName;
//   final String userAvatar;
//   final String content;
//   final String createdAt;

//   const BlogCommentModel({
//     required this.id,
//     required this.userId,
//     required this.userName,
//     required this.userAvatar,
//     required this.content,
//     required this.createdAt,
//   });

//   factory BlogCommentModel.fromJson(Map<String, dynamic> json) {
//     return BlogCommentModel(
//       id: json['id'] ?? 0,
//       userId: json['user_id'] ?? 0,
//       userName: json['user_name'] ?? 'Unknown User',
//       userAvatar:
//           json['user_avatar'] ??
//           'https://via.placeholder.com/150', // default avatar
//       content: json['content'] ?? '',
//       createdAt: json['created_at'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'user_id': userId,
//       'user_name': userName,
//       'user_avatar': userAvatar,
//       'content': content,
//       'created_at': createdAt,
//     };
//   }
// }
