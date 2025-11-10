import 'package:blog_app/features/blog/presentation/blog_screen.dart';
import 'package:blog_app/features/bookmark/presentation/bookmarks_screen.dart';
import 'package:blog_app/features/profile/presentation/profile_screen.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  int selectedIndex = 0;

  List<Widget> screens = [BlogScreen(), BookmarksScreen(), ProfileScreen()];

  //=================== OnTap Screen Change ===============
  void onTapScreenChange(value) {
    selectedIndex = value;
    notifyListeners();
  }
}
