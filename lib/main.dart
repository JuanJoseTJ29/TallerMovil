import 'package:flutter/material.dart';
import 'package:proyectomovil/login.dart';
import 'package:proyectomovil/register.dart';
import 'package:proyectomovil/registerinci.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primaryColor: Colors.blue
        ),
        home: Scaffold(
          appBar: (
            AppBar(title: Text('Login'))),
          body: login(),
        ),
    );
  }
}