// Pantalla realizada por Rodriguez Mirano Sebastian
import 'package:flutter/material.dart';

import '../widgets/encuesta_data.dart';

class EncuestaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Encuesta()
    ],);
        /*debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text(titulo, style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white),
          body: Encuesta(),*/
  }
}
