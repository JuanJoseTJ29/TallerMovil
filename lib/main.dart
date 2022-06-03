import 'package:flutter/material.dart';

import 'incidents_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Menu Principal"),
          ),
          body: ReviewList(),
        ));
  }
}
