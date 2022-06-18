import 'dart:html';

import 'package:flutter/material.dart';

import 'incidents.dart';

class incidencias_catergo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Retornamos la columna
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Incident("assets/images/objperdidos.jpg", "Objetos perdidos",
            "Objetidos perdidos en facultadades", "Objetos perdidos que se encuentran en la universidad"
            ),
            Row
          (mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: 
            [
            ElevatedButton(
              onPressed: () {}, child: Text('Editar', style: TextStyle(color: Colors.white, fontSize: 20)), 
              style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
            ElevatedButton(
              onPressed: () {}, child: Text('Eliminar', style: TextStyle(color: Colors.white, fontSize: 20)), 
              style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
            ],
          ),
        Incident(
            "assets/images/incendio.jpg",
            "Incidencia de Incendios",
            "Anahí Salgado",
            "Lorem Ipsum is simply dummy text of the printing"),
          Row
          (mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: 
            [
            ElevatedButton(
              onPressed: () {}, child: Text('Editar', style: TextStyle(color: Colors.white, fontSize: 20)), 
              style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
            ElevatedButton(
              onPressed: () {}, child: Text('Eliminar', style: TextStyle(color: Colors.white, fontSize: 20)), 
              style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
            ],
          ),
            
          
        Incident(
            "assets/images/electricidad.jpg",
            "Incidencia de fallos electricos",
            "Gissele Thomas",
            "Lorem Ipsum is simply dummy text of the printing"),
          Row
          (mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: 
            [
            ElevatedButton(
              onPressed: () {}, child: Text('Editar', style: TextStyle(color: Colors.white, fontSize: 20)), 
              style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
            ElevatedButton(
              onPressed: () {}, child: Text('Eliminar', style: TextStyle(color: Colors.white, fontSize: 20)), 
              style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
            ],
          ),
        Incident("assets/images/robo.png", "Incidencia de robo",
            "Varuna Yasas", "Lorem Ipsum is simply dummy text of the printing"),
          Row
          (mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: 
            [
            ElevatedButton(
              onPressed: () {}, child: Text('Editar', style: TextStyle(color: Colors.white, fontSize: 20)), 
              style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
            ElevatedButton(
              onPressed: () {}, child: Text('Eliminar', style: TextStyle(color: Colors.white, fontSize: 20)), 
              style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
            ],
          ),
        Incident(
            "assets/images/electricidad.jpg",
            "Incidencia de fallas electricas",
            "Anahí Salgado",
            "Lorem Ipsum is simply dummy text of the printing"),
          Row
          (mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: 
            [
            ElevatedButton(
              onPressed: () {}, child: Text('Editar', style: TextStyle(color: Colors.white, fontSize: 20)), 
              style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
            ElevatedButton(
              onPressed: () {}, child: Text('Eliminar', style: TextStyle(color: Colors.white, fontSize: 20)), 
              style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
            ],
          ),
        // Incident(
        //     "assets/images/people_6.jpg",
        //     "Facultad sin Agua",
        //     "Gissele Thomas",
        //     "Lorem Ipsum is simply dummy text of the printing"),
      ],
    );
  }
}