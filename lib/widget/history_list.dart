import 'package:flutter/material.dart';

class HistoryListTile extends StatelessWidget {
  const HistoryListTile({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
 final String image;

 final String title;

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        )),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          image,
          height: 150,
        ),
      ),
      title:  Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Row(
        children:  [
          Text(
            subTitle,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w200, fontSize: 14),
          ),
          const SizedBox(width: 20),
          const Text(
            '40',
            style: const TextStyle(color: const Color(0xffFFCC01)),
          ),
          const SizedBox(width: 5),
          const CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xffFFCC01),
          ),
        ],
      ),
      trailing: const Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}
