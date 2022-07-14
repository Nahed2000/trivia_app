import 'package:flutter/material.dart';
import 'package:trivia_ui/api/controller/api_user_controller.dart';

import '../model/user_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<List<User>> _future;

  @override
  void initState() {
    // TODO: implement initState
    _future = ApiIndexUser().indexUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "User Screen ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<User>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsetsDirectional.only(
                    start: 20, top: 20, end: 20),
                itemBuilder: (context, index) {
                  return ListTile(
              title: Text(snapshot.data![index].firstName),
            subtitle: Text(snapshot.data![index].email),
            leading: CircleAvatar(
            radius: 50,
            child: Image.network(snapshot.data![index].image),
            ));
                }
              );
            } else {
              return const Center(child: Text('Don\'t have any Data'));
            }
          },
        ),
      ),
    );
  }
}
