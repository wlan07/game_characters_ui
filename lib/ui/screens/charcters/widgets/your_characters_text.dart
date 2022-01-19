import 'package:flutter/material.dart';
import 'package:game_characters_ui/utils/app_consts.dart';

class YourCharactersText extends StatelessWidget {
  const YourCharactersText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: yourCharactersBoxHeight,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: RichText(
          text:  TextSpan(
            text: "your\n",
            style: DefaultTextStyle.of(context).style.copyWith(
               color: Colors.black54,
              fontSize: 35.0,
              fontWeight: FontWeight.w200
            ),
            children: const [
              TextSpan(
                text: "characters",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.black
                )
              )
            ]
          ),
        ),
      ),
    );
  }
}