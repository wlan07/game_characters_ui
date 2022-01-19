import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton(
      {Key? key, required this.bgColor, required this.iconColor})
      : super(key: key);

  final Color bgColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      padding: const EdgeInsets.all(8.0),
      width: 45.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
      child: Icon(
        Icons.favorite_outline_rounded,
        color: iconColor,
      ),
    );
  }
}
