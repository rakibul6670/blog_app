import 'package:flutter/material.dart';

class CustomLoadingProgress extends StatelessWidget {
  final Color? color;

  const CustomLoadingProgress({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: color ?? Colors.blue),
    );
  }
}
