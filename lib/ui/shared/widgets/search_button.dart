import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => "",
      splashRadius: 20.0,
      icon: const Icon(CupertinoIcons.search),
    );
  }
}
