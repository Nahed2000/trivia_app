
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final void Function()onTap;
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade300,
                Colors.green.shade200,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Row(
          children:  [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xff171717),
              ),
            ),
            const Spacer(),
            Icon(iconData)
          ],
        ),
      ),
    );
  }
}
