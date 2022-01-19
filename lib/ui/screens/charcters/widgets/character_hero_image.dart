import 'package:flutter/material.dart';

class CharacterHeroImage extends StatelessWidget {
  const CharacterHeroImage(
      {Key? key, required this.imagePath, required this.index})
      : super(key: key);

  final String imagePath;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Hero(tag: "H$index", child: Image.asset(imagePath));
  }
}
