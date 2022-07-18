import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trivia_ui/model/bn_model.dart';
import 'package:trivia_ui/screen/bnb_body/Quizzes.dart';
import 'bnb_body/bnb_cart.dart';
import 'bnb_body/bnb_home.dart';
import 'bnb_body/bnb_profile.dart';

class BnScreen extends StatefulWidget {
  const BnScreen({Key? key}) : super(key: key);

  @override
  State<BnScreen> createState() => _BnScreenState();
}

class _BnScreenState extends State<BnScreen> {
  List<BnModel> bnModel = <BnModel>[
    BnModel(widgetModel: const BnbHome(), title: 'Home'),
    BnModel(widgetModel: const BnbProfile(), title: 'profile'),
    BnModel(widgetModel: const BnbQuizzes(), title: 'Quizzes'),
    BnModel(widgetModel: const BnbCart(), title: 'Cart'),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          bnModel[currentIndex].title,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        leading: Visibility(
          visible: currentIndex==0,
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/images/app_bar_image.png',
                fit: BoxFit.cover,
              ),
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
      body: bnModel[currentIndex].widgetModel,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
            print(currentIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff00FFCB),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.home_filled,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Home',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  )),
              icon: const Icon(Icons.home_outlined),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff00FFCB),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.person,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  )),
              icon: const Icon(Icons.person_outline_sharp),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff00FFCB),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.quiz,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 7),
                        Expanded(
                            child: Text(
                          'Quizzes',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        )),
                      ],
                    ),
                  )),
              icon: const Icon(Icons.quiz_outlined),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff00FFCB),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.card_travel,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Cart',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  )),
              icon: const Icon(Icons.card_travel_outlined),
              label: ''),
        ],
      ),
    );
  }
}
