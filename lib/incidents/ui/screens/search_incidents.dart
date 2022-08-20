import 'package:flutter/material.dart';

import '../../ui/widgets/incidents.dart';
import 'edit_incidents.dart';

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
                    "assets/images/objperdidos.jpg",
                    "Mochila perdida ayuda!!!",
                    "Fisi",
                    "Ayuda mi mochila desaparecio estaba en el 3er piso de la Fisi"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(13.0),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => incidence_edit()),
                            );
                          },
                          child: Text('Editar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue, padding: EdgeInsets.all(4)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showAlertDialog(context);
                          },
                          child: Text('Eliminar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red, padding: EdgeInsets.all(4)),
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
                    "assets/images/microscopio.jpg",
                    "Se rompió Microscopio",
                    "Ciencias Biológica",
                    "Lorem Ipsum is simply dummy text of the printing"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(13.0),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => incidence_edit()),
                            );
                          },
                          child: Text('Editar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue, padding: EdgeInsets.all(4)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showAlertDialog(context);
                          },
                          child: Text('Eliminar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red, padding: EdgeInsets.all(4)),
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
                    "assets/images/electricidad.jpg",
                    "No hay luz en el 2do piso",
                    "Letras",
                    "Lorem Ipsum is simply dummy text of the printing"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(13.0),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => incidence_edit()),
                            );
                          },
                          child: Text('Editar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue, padding: EdgeInsets.all(4)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showAlertDialog(context);
                          },
                          child: Text('Eliminar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red, padding: EdgeInsets.all(4)),
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
                    "assets/images/Carpetasss.jpg",
                    "Faltan carpetas-salon 2B",
                    "Fisi",
                    "Lorem Ipsum is simply dummy text of the printing"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(13.0),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => incidence_edit()),
                            );
                          },
                          child: Text('Editar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue, padding: EdgeInsets.all(4)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showAlertDialog(context);
                          },
                          child: Text('Eliminar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red, padding: EdgeInsets.all(4)),
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
                    "assets/images/profeBR.jpg",
                    "No hay docente para Tesis",
                    "Fisi",
                    "Lorem Ipsum is simply dummy text of the printing"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(13.0),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => incidence_edit()),
                            );
                          },
                          child: Text('Editar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue, padding: EdgeInsets.all(4)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showAlertDialog(context);
                          },
                          child: Text('Eliminar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red, padding: EdgeInsets.all(4)),
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

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Elimnar"),
    onPressed: () {
      //edit user();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Editar Usuario"),
    content: Row(children: [
      Image.asset('assets/images/advertencia.jpg', height: 80),
      Text("¿Estas seguro que quieres eliminar esta incidencia?"),
    ]),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
