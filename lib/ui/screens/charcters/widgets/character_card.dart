import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_characters_ui/data/models/character.dart';
import 'package:game_characters_ui/ui/screens/detailed_character/detailed_character_screen.dart';
import 'package:game_characters_ui/utils/app_consts.dart';
import '../../../shared/widgets/character_card_labels.dart';
import 'character_hero_image.dart';

class CharacterCard extends StatefulWidget {
  const CharacterCard(
      {Key? key,
      required this.character,
      required this.index,
      required this.scrollController})
      : super(key: key);

  final Character character;
  final int index;
  final ScrollController scrollController;

  @override
  _CharacterCardState createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard>
    with SingleTickerProviderStateMixin {
  //* A GETTER FOR THE CHARACTER MODEL PASSED IN THE CONSTRUCTOR ABOVE
  Character get character => widget.character;

  final GlobalKey key = GlobalKey();

  late AnimationController scaleAnimationController;
  late double cardHeight;

  double get scrollPosition => widget.scrollController.position.pixels;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      cardHeight = key.currentContext!.size!.height;
    });

    scaleAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        lowerBound: 0.7,
        upperBound: 1.0,
        value: 1.0);

    widget.scrollController.addListener(_onScrollChanged);
  }

  void _onScrollChanged() {


    //* Current scroll position
    final p = scrollPosition;


    //* how much current card is far from 0.0 offset 
    final f = (yourCharactersBoxHeight + cardHeight * widget.index);

    if (p > f) {

      //* some math calculation to determinate difference factor
      final factor = 1 - (p - f) / cardHeight * 0.5;

      final double? value = lerpDouble(0.0, 1.0, factor.clamp(0.0, 1.0).toDouble());

      _updateAnimationValue(value);
    }
  }

  void _updateAnimationValue(double? value) {
    if (value != null) {
      scaleAnimationController.value = value;
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScrollChanged);
    scaleAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
          opaque: false,
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) {
            return FadeTransition(
          
              opacity: __,
              child: DetailedCharacterScreen(
                transitionAnimation: __,
                character: character,
                index: widget.index,
              ),
            );
          },
        ));
      },
      child: ScaleTransition(
        scale: scaleAnimationController,
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: 1.2,
          child: Container(
              key: key,
              margin:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              decoration: BoxDecoration(
                  color: character.bgColor,
                  boxShadow: [
                    BoxShadow(
                        color: character.bgColor.withOpacity(0.8),
                        spreadRadius: 1.0,
                        blurRadius: 25.0,
                        offset: const Offset(0.0, 15.0))
                  ],
                  borderRadius: BorderRadius.circular(20.0)),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topRight,
                    widthFactor: 0.7,
                    heightFactor: 1.0,
                    child: Transform.translate(
                        offset: const Offset(0.0, -50.0),
                        child: CharacterHeroImage(
                          index: widget.index,
                          imagePath: character.imagePath,
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FractionallySizedBox(
                      heightFactor: 0.5,
                      widthFactor: 0.8,
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CharacterCardLabels(
                            characterName: character.name,
                            index: widget.index,
                            level: character.level,
                            levelTextColor: character.levelTextColor,
                          )),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
