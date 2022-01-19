import 'package:flutter/material.dart';
import 'package:game_characters_ui/utils/app_consts.dart';
import 'package:game_characters_ui/utils/app_styles.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key, required this.animation}) : super(key: key);

  final Animation<double> animation;

  double get dy => animation.value;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: const Text(
        charcterScreenTitle,
        style: appBarTextStyle,
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0.0, 20*dy),
          child: Opacity(
            child: child,
            opacity: 1.0 + dy ,
          ),
        );
      },
    );
  }
}
