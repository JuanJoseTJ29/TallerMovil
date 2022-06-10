import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
// Importar
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Menu Principal"),
          ),
          body: homeIncidents(),
        ));
  }
}
