import 'package:flutter/material.dart';

class BnScreen extends StatefulWidget {
  const BnScreen({Key? key}) : super(key: key);

  @override
  State<BnScreen> createState() => _BnScreenState();
}

class _BnScreenState extends State<BnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 15,
          ),
        ),
        centerTitle: true,
        actions: const [
          Text('40',style: TextStyle(color: Color(0XFFFCBD11)),),
          CircularProgressIndicator(
            backgroundColor:Color(0XFFFCBD11),
          )
        ],
      ),
    );
  }
}
