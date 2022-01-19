import 'package:flutter/material.dart';
import 'package:game_characters_ui/utils/app_styles.dart';
import 'package:game_characters_ui/utils/widget_extension.dart';

class CharacterCardLabels extends StatelessWidget {
  const CharacterCardLabels(
      {Key? key,
      required this.level,
      required this.index,
      required this.characterName,
      required this.levelTextColor})
      : super(key: key);

  final int level;
  final Color levelTextColor;
  final String characterName;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "T$index",
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "level $level",
              style: characterLevelStyle.copyWith(color: levelTextColor),
            ).scaleDown(alignment: Alignment.centerLeft),
            Text(
              characterName,
              style: characterNameStyle,
            ).scaleDown(alignment: Alignment.centerLeft)
          ],
        ).scaleDown(
          alignment: Alignment.centerLeft
        ),
      ),
    );
  }
}
