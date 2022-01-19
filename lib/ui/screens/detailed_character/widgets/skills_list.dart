import 'package:flutter/material.dart';
import 'package:game_characters_ui/ui/screens/detailed_character/widgets/animated_skill_card_wrapper.dart';
import 'package:game_characters_ui/ui/screens/detailed_character/widgets/skill_card.dart';

class SkillsList extends StatelessWidget {
  const SkillsList(
      {Key? key,
      required this.health,
      required this.speed,
      required this.heathCardOffsetAnimation,
      required this.speedCardOffsetAnimation,
      required this.onPopNotifier})
      : super(key: key);

  final int health;
  final int speed;
  final Animation<Offset> heathCardOffsetAnimation;
  final Animation<Offset> speedCardOffsetAnimation;

  final ValueNotifier onPopNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
          child: AspectRatio(
            aspectRatio: 0.9,
            child: AnimatedSkillCardWrapper(
                popNotifier: onPopNotifier,
                reversedelayInmilliSec: 500,
                forwarddelayInmilliSec: 300,
                skillCard: SkillCard(
                  label: "Health",
                  value: "$health%",
                  color: const Color(0xfff58320),
                  iconPath: "assets/images/heart.png",
                )),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
          child: AspectRatio(
            aspectRatio: 0.9,
            child: AnimatedSkillCardWrapper(
                popNotifier: onPopNotifier,
                forwarddelayInmilliSec: 500,
                reversedelayInmilliSec: 300,
                skillCard:  SkillCard(
                  label: "Speed",
                  value: "${speed}KM",
                  color: const Color(0xff17a6e3),
                  iconPath: "assets/images/heart.png",
                )),
          ),
        ))
      ],
    );
  }
}
