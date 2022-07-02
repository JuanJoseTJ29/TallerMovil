import 'package:flutter/material.dart';

import '../../ui/widgets/incidents.dart';

class SearchIncidents extends StatelessWidget {
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
            'Incidencias propias',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Incident(
                    "images/objperdidos.jpg",
                    "Objetos perdidos",
                    "Objetidos perdidos en facultadades",
                    "Objetos perdidos que se encuentran en la universidad"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Editar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Eliminar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Incident(
                    "images/incendio.jpg",
                    "Incidencia de Incendios",
                    "Anahí Salgado",
                    "Lorem Ipsum is simply dummy text of the printing"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Editar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Eliminar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Incident(
                    "images/electricidad.jpg",
                    "Incidencia de fallos electricos",
                    "Gissele Thomas",
                    "Lorem Ipsum is simply dummy text of the printing"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Editar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Eliminar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Incident(
                    "images/robo.png",
                    "Incidencia de robo",
                    "Varuna Yasas",
                    "Lorem Ipsum is simply dummy text of the printing"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Editar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Eliminar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Incident(
                    "images/electricidad.jpg",
                    "Incidencia de fallas electricas",
                    "Anahí Salgado",
                    "Lorem Ipsum is simply dummy text of the printing"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Editar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Eliminar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        )));
  }
}
