import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trivia_ui/model/bn_model.dart';

import '../widget/history_list.dart';

class BnScreen extends StatefulWidget {
  const BnScreen({Key? key}) : super(key: key);

  @override
  State<BnScreen> createState() => _BnScreenState();
}

class _BnScreenState extends State<BnScreen> {
  List<BnModel> bnModel = <BnModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        leading: Container(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/app_bar_image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10, right: 20, left: 20),
            child: Container(
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade200,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    '40',
                    style: TextStyle(color: Color(0xffFFCC01)),
                  ),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0xffFFCC01),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/user_1.png'),
                Image.asset('assets/images/user_2.png'),
                Image.asset('assets/images/user_3.png'),
                Image.asset('assets/images/user_4.png'),
                Image.asset('assets/images/user_5.png'),
              ],
            ),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/re.png'),
                Column(
                  children: [
                    Image.asset('assets/images/illustration.png'),
                    const SizedBox(height: 20),
                    const Text(
                      'Today\'s winning pool',
                      style: TextStyle(
                        color: Color(0xffFFCC01),
                      ),
                    ),
                    const Divider(
                      color: Colors.black45,
                      indent: 60,
                      endIndent: 60,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '15 Winners',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              height: 250,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 20,
                  color: const Color(0xff00FFCB),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 20,
                    color: const Color(0xffD8D8D8),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: const Color(0xff00FFCB),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        '1 Hr 10 Min',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Played',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'History',
                    style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'see all',
                    style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const HistoryListTile(
              title: 'World',
              image: 'assets/images/history_1.jpg',
              subTitle: 'Prize',
            ),
            const HistoryListTile(
              title: 'World',
              image: 'assets/images/history_2.jpg',
              subTitle: 'Nature',
            ),
            const HistoryListTile(
              title: 'Science',
              image: 'assets/images/history_3.jpg',
              subTitle: 'Prize',
            ),
          ],
        ),
      ),
    );
  }
}
