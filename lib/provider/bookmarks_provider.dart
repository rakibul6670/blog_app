import 'package:flutter/material.dart';

class BookmarksProvider extends ChangeNotifier {
  BookmarksProvider() {
    bookmarkSearchList = bookmarkedItems;
  }

  //============== Bookmarked items List =============
  List bookmarkedItems = [
    {
      "title": "The Future of Flutter in 2025",
      "subtitle":
          "Why Flutter continues to dominate cross-platform development.",
    },
    {
      "title": "10 Common Dart Mistakes Developers Make",
      "subtitle": "Avoid these pitfalls to write cleaner and faster Dart code.",
    },
    {
      "title": "State Management: Provider vs GetX",
      "subtitle": "A detailed comparison for real-world Flutter projects.",
    },
    {
      "title": "Building a Blog App with WordPress REST API",
      "subtitle":
          "Step-by-step guide to connect Flutter with your WordPress backend.",
    },
    {
      "title": "Understanding Null Safety in Dart",
      "subtitle":
          "Learn how null safety prevents crashes and improves reliability.",
    },
    {
      "title": "Designing a Modern UI with Flutter",
      "subtitle": "Best practices for building elegant and responsive UIs.",
    },
    {
      "title": "How to Store Data Locally in Flutter",
      "subtitle": "Using SharedPreferences, Hive, and GetStorage efficiently.",
    },
    {
      "title": "Optimizing Flutter App Performance",
      "subtitle":
          "Techniques to reduce jank, optimize build time, and improve FPS.",
    },
    {
      "title": "Integrating Firebase Auth in Your App",
      "subtitle": "Simple login and signup flow with Firebase Authentication.",
    },
    {
      "title": "Top 5 Flutter Packages You Must Try",
      "subtitle":
          "From animations to APIs — tools to speed up your development.",
    },
  ];

  //-------------- Query search List ---------------------
  List bookmarkSearchList = [];

  //=========== Bookmark search query ============
  void searchBookmarks(String query) {
    bookmarkSearchList = bookmarkedItems.where((item) {
      final titleLower = item["title"]!.toString().toLowerCase();
      final subtitleLower = item["subtitle"]!.toString().toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          subtitleLower.contains(searchLower);
    }).toList();

    notifyListeners();
  }
}
