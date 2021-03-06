import 'package:flutter/material.dart';
import 'package:proyectomovil/main.dart';

import '../widgets/incidents.dart';

import '../../../home.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  _ReviewList createState() => _ReviewList();
}

class _ReviewList extends State<ReviewList> {
  int indexTap = 0;

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Retornamos la columna
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'INCIDENCIAS PUBLICAS',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Incident(
                  "assets/images/carnet2.jpg",
                  "Perdida de Carnet",
                  "Varuna Yasas",
                  "Lorem Ipsum is simply dummy text of the printing"),
              Incident(
                  "assets/images/compumal.jpg",
                  "Computadora sin funcionamiento",
                  "Anahí Salgado",
                  "Lorem Ipsum is simply dummy text of the printing"),
              Incident(
                  "assets/images/carnet.jpg",
                  "Perdida de Carnet",
                  "Gissele Thomas",
                  "Lorem Ipsum is simply dummy text of the printing"),
              Incident(
                  "assets/images/carnet2.jpg",
                  "Perdida de Carnet",
                  "Varuna Yasas",
                  "Lorem Ipsum is simply dummy text of the printing"),
              Incident(
                  "assets/images/sluz.jpg",
                  "Facultad sin Luz",
                  "Anahí Salgado",
                  "Lorem Ipsum is simply dummy text of the printing"),
              Incident(
                  "assets/images/sagua.png",
                  "Facultad sin Agua",
                  "Gissele Thomas",
                  "Lorem Ipsum is simply dummy text of the printing"),
            ],
          )),
    );
  }
}
