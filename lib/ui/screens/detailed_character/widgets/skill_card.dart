import 'package:flutter/material.dart';
import 'package:game_characters_ui/utils/app_styles.dart';
import 'package:game_characters_ui/utils/widget_extension.dart';

class SkillCard extends StatelessWidget {
  const SkillCard(
      {Key? key,
      required this.color,
      required this.label,
      required this.value,
      required this.iconPath})
      : super(key: key);

  final Color color;
  final String label;
  final String value;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              iconPath,
              height: 35,
              width: 35,
              color: Colors.white,
            ),
            Text(
              label,
              style: charactermoreDetailsStyle.copyWith(fontSize: 20),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child:
                  Text(value, style: characterNameStyle.copyWith(fontSize: 30)),
            ))
          ],
        ));
  }
}
