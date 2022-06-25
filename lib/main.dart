import 'package:flutter/material.dart';

// Importar
import 'home.dart';

import 'users/ui/screens/register_user.dart';
import 'users/ui/screens/login_user.dart';
import 'incidents/ui/screens/list_incidents.dart';
import 'incidents/ui/screens/registerinci.dart';

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
<<<<<<< HEAD
        home: Scaffold(body: RegisterScreen()
=======
        home: Scaffold(body: homeIncidents()
>>>>>>> 653a8cdd3e45cae78e44b1567d98c52c6b9774af
            //body: RegisterScreen(),   registerinci(), ReviewList()
            ));
  }
}
