import 'package:flutter/material.dart';
import 'package:proyectomovil/incidents/perfilincidencia.dart';
import 'package:proyectomovil/main.dart';

import 'incidents.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Retornamos la columna
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Incident("assets/images/people_1.jpeg", "Perdida de Carnet",
            "Varuna Yasas", "Lorem Ipsum is simply dummy text"),
        ElevatedButton(
          child: Text(
            'Editar',
          ),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 31, 115, 241),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => perfilIncidencia()),
            );
          },
        ),
        Incident(
            "assets/images/people_2.jpg",
            "Computadora sin funcionamiento",
            "Anahí Salgado",
            "Lorem Ipsum is simply dummy text of the printing"),
        Incident(
            "assets/images/people_3.jpg",
            "Perdida de Carnet",
            "Gissele Thomas",
            "Lorem Ipsum is simply dummy text of the printing"),
        Incident("assets/images/people_4.jpg", "Perdida de Carnet",
            "Varuna Yasas", "Lorem Ipsum is simply dummy text of the printing"),
        Incident(
            "assets/images/people_5.jpg",
            "Facultad sin Luz",
            "Anahí Salgado",
            "Lorem Ipsum is simply dummy text of the printing"),
        Incident(
            "assets/images/people_6.jpg",
            "Facultad sin Agua",
            "Gissele Thomas",
            "Lorem Ipsum is simply dummy text of the printing"),
      ],
    );
  }
}
