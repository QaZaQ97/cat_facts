import 'package:flutter/material.dart';

class MainTextWidget extends StatelessWidget {
  final String catText;
  const MainTextWidget({super.key, required this.catText});

  @override
  Widget build(BuildContext context) {
    return Text(
      catText,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
