import 'package:flutter/material.dart';
import 'package:game_characters_ui/utils/app_styles.dart';

class MoreDetailsText extends StatefulWidget {
  const MoreDetailsText(
      {Key? key, required this.text, required this.popNotifier})
      : super(key: key);

  final String text;
  final ValueNotifier popNotifier;

  @override
  State<MoreDetailsText> createState() => _MoreDetailsTextState();
}

class _MoreDetailsTextState extends State<MoreDetailsText> {
  late Tween<double> tween;
  late int speedInMilli;
  @override
  void initState() {
    _initialseValues();
    _addListenerToOnPopNotifier();
    super.initState();
  }

  void onPopTapped() {
    setState(() {
      speedInMilli = 400;
      tween = Tween<double>(begin: 1.0, end: 0.0);
    });
  }

  void _initialseValues() {
    tween = Tween<double>(begin: 0.0, end: 1.0);
    speedInMilli = 800;
  }

  void _addListenerToOnPopNotifier() {
    widget.popNotifier.addListener(onPopTapped);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: speedInMilli),
      curve: Curves.decelerate,
      tween: tween,
      child: Text(
        widget.text,
        style: charactermoreDetailsStyle,
      ),
      builder: (BuildContext context, double value, Widget? child) {
        return FractionallySizedBox(
          heightFactor: value,
          alignment: Alignment.topCenter,
          child: Opacity(
            child: child,
            opacity: value,
          ),
        );
      },
    );
  }
}
