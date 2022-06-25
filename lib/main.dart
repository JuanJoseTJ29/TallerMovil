import 'package:flutter/material.dart';
import 'incidencias_catergo.dart';


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
            AppBar(title: Text('Mis Reportes'))),
          body: incidencias_catergo(),
        ),
    );
  }
  
}