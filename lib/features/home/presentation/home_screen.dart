import 'package:blog_app/features/blog/presentation/blog_screen.dart';
import 'package:blog_app/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            //================ Body Section =====================
            body: provider.screens[provider.selectedIndex],

            //======================= Bottom Navigation =============
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: provider.selectedIndex,
              onTap: provider.onTapScreenChange,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Blog"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_outline_sharp),
                  label: "BookMarks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
