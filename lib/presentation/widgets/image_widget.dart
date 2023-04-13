import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final Uint8List catImage;
  const ImageWidget({super.key, required this.catImage});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Image.memory(
        catImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
