import 'package:flutter/material.dart';
import 'package:game_characters_ui/data/models/character.dart';
import 'package:game_characters_ui/ui/screens/detailed_character/widgets/detailed_character_app_bar.dart';
import 'package:game_characters_ui/ui/screens/detailed_character/widgets/skills_list.dart';
import '../../shared/widgets/character_card_labels.dart';
import '../charcters/widgets/character_hero_image.dart';
import 'widgets/more_details_text.dart';

class DetailedCharacterScreen extends StatefulWidget {
  const DetailedCharacterScreen(
      {Key? key,
      required this.character,
      required this.index,
      required this.transitionAnimation})
      : super(key: key);

  final Character character;
  final Animation<double> transitionAnimation;
  final int index;

  @override
  _DetailedCharacterScreenState createState() =>
      _DetailedCharacterScreenState();
}

class _DetailedCharacterScreenState extends State<DetailedCharacterScreen> {
  //* A GETTER FOR THE CHARACTER MODEL PASSED IN THE CONSTRUCTOR ABOVE
  Character get character => widget.character;

  late ValueNotifier<bool> onPopNotifier;

  void _onCloseButtonTaped() {
    onPopNotifier.value = false;
  }

  @override
  void initState() {
    onPopNotifier = ValueNotifier(true);
    super.initState();
  }

  @override
  void dispose() {
    onPopNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: character.bgColor,
          ),
          DetailedCharacterAppBar(
            onCloseTapped: _onCloseButtonTaped,
            favoriteIconColor: character.levelTextColor,
          ),
          Positioned.fill(
            top: 40.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: CharacterHeroImage(
                    imagePath: character.imagePath,
                    index: widget.index,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CharacterCardLabels(
                      characterName: character.name,
                      index: widget.index,
                      level: character.level,
                      levelTextColor: character.levelTextColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: MoreDetailsText(
                            popNotifier: onPopNotifier,
                            text: character.moreDetails,
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: SkillsList(
                              onPopNotifier: onPopNotifier,
                              heathCardOffsetAnimation: Tween<Offset>(
                                      begin: const Offset(0.0, 50.0),
                                      end: Offset.zero)
                                  .animate(widget.transitionAnimation),
                              speedCardOffsetAnimation:
                                  const AlwaysStoppedAnimation(Offset.zero),
                              health: character.health,
                              speed: character.speed,
                            ))
                      ],
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          )
        ],
      ),
    );
  }
}
