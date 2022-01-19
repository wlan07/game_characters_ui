import 'package:flutter/material.dart';
import 'package:game_characters_ui/ui/shared/widgets/close_button.dart';
import 'package:game_characters_ui/ui/shared/widgets/favorite_button.dart';

class DetailedCharacterAppBar extends StatelessWidget {
  const DetailedCharacterAppBar(
      {Key? key, required this.favoriteIconColor, required this.onCloseTapped})
      : super(key: key);

  final Color favoriteIconColor;
  final VoidCallback onCloseTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyCloseButton(
            onTap: onCloseTapped,
          ),
          FavoriteButton(bgColor: Colors.black38, iconColor: favoriteIconColor)
        ],
      ),
    );
  }
}
