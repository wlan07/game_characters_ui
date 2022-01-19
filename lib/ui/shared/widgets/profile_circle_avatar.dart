import 'package:flutter/material.dart';

class ProfileCircleAvatar extends StatelessWidget {
  const ProfileCircleAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: 45.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.8),
        image: const DecorationImage(
            image: AssetImage("assets/images/my_cat.jpg"),
            alignment: Alignment.center,
            fit: BoxFit.cover),
        shape: BoxShape.circle,
      ),
    );
  }
}
