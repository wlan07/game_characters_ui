import 'package:flutter/material.dart';
import 'package:game_characters_ui/utils/app_consts.dart';

class CharctersAppBar extends StatelessWidget {
  const CharctersAppBar({Key? key,required this.widgetstoHold}) : super(key: key);


final List<Widget> widgetstoHold;
  //* MY CHARACTERS SCREEN APP BAR
  @override
  Widget build(BuildContext context) {
    //* A ROW for HOLDING all of AppBar Widgets
    return SizedBox(
      height: appBarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
        child: Row(
          children: widgetstoHold
        ),
      ),
    );
  }
}
