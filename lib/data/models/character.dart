import 'dart:ui';

class Character {
  final String name;
  final int level;
  final String imagePath;
  final String moreDetails;
  final int speed;
  final int health;
  final Color bgColor;
  final Color levelTextColor;


  const Character(
      {required this.name,
      required this.levelTextColor,
      required this.bgColor,
      required this.level,
      required this.imagePath,
      required this.moreDetails,
      required this.speed,
      required this.health});
}
