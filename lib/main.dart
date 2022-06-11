import 'package:flutter/material.dart';
import 'package:proyectomovil/login.dart';
import 'package:proyectomovil/registerinci.dart';
import 'package:proyectomovil/register.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(
        primaryColor: Colors.blue
        ),
        home: Scaffold(
          appBar: (
            AppBar(title: Text('Registrar Incidencia'))),
          body: registerinci(),
        ),
    );
  }
  
}