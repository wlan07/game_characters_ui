import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:game_characters_ui/data/my_data.dart';
import 'package:game_characters_ui/ui/screens/charcters/widgets/character_card.dart';
import 'package:game_characters_ui/ui/shared/widgets/profile_circle_avatar.dart';
import 'package:game_characters_ui/ui/shared/widgets/search_button.dart';
import 'widgets/app_bar.dart';
import 'widgets/app_bar_title.dart';
import 'widgets/your_characters_text.dart';

class Characters extends StatefulWidget {
  const Characters({Key? key}) : super(key: key);

  @override
  _CharactersState createState() => _CharactersState();
}

class _CharactersState extends State<Characters>
    with SingleTickerProviderStateMixin {
  late ScrollController scrollController;
  late AnimationController animationController;
  late Animation<double> appbarTitleTranslateAnimation;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController(initialScrollOffset: 0.0);

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150),value: 1.0);

    appbarTitleTranslateAnimation =
        Tween<double>(begin: 0.0, end: -1.0).animate(animationController);

    _addScrollListener();
  }


  void _addScrollListener() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      scrollController.position.addListener(_onScrollChanged);
    });
  }

  void _onScrollChanged() {
    // WHEN YOUR CHARACTERS TEXT GET SHOWN APP BAR TITLE TRANSLATE & FADE

    if (scrollController.position.pixels <= 100.0) {
      if (animationController.isDismissed &&
          scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
        animationController.forward();
      }
    } else {
      if (animationController.isCompleted &&
          scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CharctersAppBar(
            widgetstoHold: [
              const ProfileCircleAvatar(),
              const Spacer(),
              AppBarTitle(
                animation: appbarTitleTranslateAnimation,
              ),
              const Spacer(),
              const SearchButton(),
            ],
          ),
          Expanded(
              child: CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: YourCharactersText(),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  for (int i = 0; i < MyData.characters.length; i++)
                    CharacterCard(
                      key: ValueKey(i),
                      index: i,
                      character: MyData.characters[i],
                      scrollController: scrollController,
                    )
                ], addRepaintBoundaries: true),
              )
            ],
          )),
        ],
      ),
    );
  }
}
