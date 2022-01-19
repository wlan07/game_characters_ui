import 'package:flutter/material.dart';

class AnimatedSkillCardWrapper extends StatefulWidget {
  const AnimatedSkillCardWrapper(
      {Key? key,
      required this.skillCard,
      required this.forwarddelayInmilliSec,
      required this.reversedelayInmilliSec,
      required this.popNotifier})
      : super(key: key);

  final Widget skillCard;
  final int forwarddelayInmilliSec;
  final int reversedelayInmilliSec;
  final ValueNotifier popNotifier;

  @override
  State<AnimatedSkillCardWrapper> createState() =>
      _AnimatedSkillCardWrapperState();
}

class _AnimatedSkillCardWrapperState extends State<AnimatedSkillCardWrapper> {
  late Tween<Offset> tweenOffset;
  late int speedinMilli;

  void onPopTapped() {
    setState(() {
      speedinMilli = widget.reversedelayInmilliSec;
      tweenOffset = Tween<Offset>(
          begin: const Offset(0.0, 0.0), end: const Offset(0.0, 100.0));
    });
  }

  void _initialseValues() {
    speedinMilli = widget.forwarddelayInmilliSec;
    tweenOffset = Tween<Offset>(
        begin: const Offset(0.0, 100.0), end: const Offset(0.0, 0.0));
  }

  void _addListenerToOnPopNotifier() {
    widget.popNotifier.addListener(onPopTapped);
  }

  @override
  void initState() {
    _initialseValues();
    _addListenerToOnPopNotifier();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        child: widget.skillCard,
        tween: tweenOffset,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: speedinMilli),
        builder: (cntx, Offset _, __) {
          return Transform.translate(
            offset: _,
            child: __,
          );
        });
  }
}
