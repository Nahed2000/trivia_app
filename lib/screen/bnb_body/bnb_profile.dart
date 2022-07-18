import 'package:flutter/material.dart';

class BnbProfile extends StatelessWidget {
  const BnbProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Stack(
          children: [
            Image.asset('assets/images/Image.png'),
            Positioned(
              left: 270,
              top: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: const Size(50, 38),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: const Center(
                  child: const Text(
                'Lee waters',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              )),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 80),
              child: const Center(
                  child: Text(
                'San Diego, CA',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              )),
            )
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Status',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(height: 30),
              Text(
                'LAST ACTIVE 1 MIN AGO ',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '1,000 CORRECT ANSWER',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '500 INCORRECT ANSWER',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '2,900 TOTAL QUESTIONS',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const ListTile(
          leading: Icon(Icons.person_outline_sharp),
          title: Text('My Account'),
          subtitle: Text('Edit your information '),
          trailing: Icon(
            Icons.arrow_right_alt,
            color: Color(0xff00FFCB),
            size: 38,
          ),
        )
      ],
    );
  }
}
