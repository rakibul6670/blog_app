import 'package:blog_app/features/blog/presentation/blog_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //================ Body Section =====================
      body: SafeArea(child: BlogScreen()),


      //======================= Bottom Navigation =============
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){},
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Blog"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline_sharp),label: "BookMarks"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),

      ]),

    );
  }
}
