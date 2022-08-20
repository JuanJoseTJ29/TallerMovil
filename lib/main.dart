import 'package:flutter/material.dart';

// Importar
import 'home.dart';

import 'incidents/ui/screens/detail_incidencia.dart';
import 'incidents/ui/screens/search_incidents.dart';
import 'users/ui/screens/profile_user.dart';
import 'users/ui/screens/register_user.dart';
import 'users/ui/screens/login_user.dart';
import 'incidents/ui/screens/list_incidents.dart';
import 'incidents/ui/screens/registerinci.dart';
import 'users/ui/screens/edit_user.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //WidgetsFlutterBinding.ensureInitialized();
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home',
        home: Scaffold(body: RegisterScreen()
            //body: RegisterScreen(),   registerinci(), ReviewList() , Detail_Incidencia() , SearchIncidents(), ReviewList()
            ));
  }
}
