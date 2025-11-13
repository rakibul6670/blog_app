import 'package:flutter/material.dart';

class TabBarProvider extends ChangeNotifier {
  //================ Selected Tab Bar ===============
  int selectedTab = 0;

  //================ OnTapChangeTap ===========
  void onTapChangeTap(index) {
    selectedTab = index;
    notifyListeners();
  }
}
