import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    Key? key,
    required this.onPress,
    required this.iconData,
    required this.title,
    required this.color,
  }) : super(key: key);
  final void Function() onPress;
  final IconData iconData;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(iconData),
      onPressed: onPress,
      label: Text(
        title,
        style: const TextStyle(
          // backgroundColor: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        shadowColor: Colors.blueGrey.shade900,
        primary: color,
      ),
    );
  }
}
