import 'package:flutter/material.dart';

import '../widgets/profile_header.dart';
import '../widgets/profile_data.dart';

class ProfileUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Mi perfil',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(children: <Widget>[
        Data_Profile(),
        Header_Profile("assets/images/people_1.jpeg", "Juan Jose"),
      ]),
    );
  }
}
