import 'package:flutter/material.dart';

class BlogCategoriesScreen extends StatelessWidget {
  const BlogCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //====================== App Bar Section ===============
      appBar: AppBar(title: Text("Categories"), centerTitle: true),

      //===================== Body Section =============================
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, index) {
              return Card(
                elevation: 8,

                child: Column(
                  children: [
                    //----------------- Categories Image ----------
                    Image.network(
                      "",
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.heart_broken);
                      },
                    ),

                    //--------------- Categories Title ------------
                    Text("Categories title"),

                    //--------------- Categories Post -------------
                    Text("Categories post 20"),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
