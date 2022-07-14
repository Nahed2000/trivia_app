import 'package:flutter/material.dart';
import 'package:trivia_ui/api/controller/api_category_controller.dart';
import 'package:trivia_ui/api/controller/api_user_controller.dart';
import 'package:trivia_ui/model/category_model.dart';

import '../model/user_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Category>> _future;

  @override
  void initState() {
    // TODO: implement initState
    _future = ApiCategoryController().indexCategory();
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
          "Category Screen ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Category>>(
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
                        title: Text(snapshot.data![index].title),
                        subtitle: Text(snapshot.data![index].description),
                        leading: CircleAvatar(
                          radius: 50,
                          child: Image.network(snapshot.data![index].image),
                        ));
                  });
            } else {
              return const Center(child: Text('Don\'t have any Data'));
            }
          },
        ),
      ),
    );
  }
}
