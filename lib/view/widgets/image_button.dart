
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final VoidCallback? onTap;
  const ImageButton({super.key, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(onPressed: onTap ?? () {}, icon: Image.asset(image, height: 20, width: 20));
  }
}