class ApiUrls {
  //------------------- Base Url --------------
  static final String _baseUrl = "https://api.zhndev.site/wp-json/blog-app/v1";

  //====================== Auth Type Url ====================
  static get registerUrl => Uri.parse("$_baseUrl/auth/register");
  static get loginUrl => Uri.parse("$_baseUrl/auth/login");
  static get changePasswordUrl => Uri.parse("$_baseUrl/user/change-password");
  static get refreshTokenUrl => Uri.parse("$_baseUrl/auth/refresh-token");
  static get logoutUrl => Uri.parse("$_baseUrl/auth/logout");

  //======================== Profile Url ===================
  static get profileUrl => Uri.parse("$_baseUrl/user/profile");

  static get getAllBlogUrl => Uri.parse("$_baseUrl/posts");

  //================== Comment Url ================
  static getCommentUrl(int postId, int pageNumber) =>
      Uri.parse("$_baseUrl/comments/post/$postId?page=$pageNumber&per_page=10");

  static postCommentUrl() => Uri.parse("$_baseUrl/comments");
}
