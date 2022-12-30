import 'package:flutter/material.dart';

import 'list_incidents.dart';
import 'search_incidents.dart';
import '../../../users/ui/screens/profile_user.dart';

import '../../../Encuesta.dart';
import 'registerinci.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'list_incidents.dart';
import 'edit_incidents.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class incidence_edit extends StatefulWidget {
  const incidence_edit({Key? key}) : super(key: key);
  @override
  _incidenceState createState() => _incidenceState();
}

class _incidenceState extends State<incidence_edit> {
  final _formKey = GlobalKey<FormState>();
  //Indice para acceder a los elementos
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    //Para dar una lista de metodos
    ReviewList(),
    //SearchIncidents(),
    Homepage(),
    registerinci(),
    Encuesta()
  ];
  final List<String> items = [
    'Objetos perdidos',
    'Artefactos malogrados',
    'Servicios Basicos',
    'Administrativo',
    'Laboratorio',
  ];
  String? selectedValue;

  //Metodo para dar una evento
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //key: _formKey,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Editar Incidencia',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            key: _formKey,
            children: <Widget>[
              Image.asset('assets/images/editar.jpg', height: 300),
              TextFormField(
                decoration: InputDecoration(labelText: 'Titulo : '),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese el titulo';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Lugar : '),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese el lugar';
                  }
                },
              ),
              Container(
                alignment: Alignment.topLeft,
                child: DropdownButton2(
                  hint: Text(
                    'Categoria',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },

                  //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                  //buttonPadding: const EdgeInsets.only(left: 5, right: 10),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción : '),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese la descripción';
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text(
                      'Editar',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 59, 241, 31),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => incidence_edit()),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Atras',
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 52, 105, 203)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
          // bottomNavigationBar: Theme(
          //   data: Theme.of(context).copyWith(
          //       canvasColor: Colors.white, primaryColor: Colors.purple),
          //   child: BottomNavigationBar(
          //       //Se activa la funcion
          //       onTap: onTapTapped,
          //       currentIndex: indexTap,
          //       items: [
          //         BottomNavigationBarItem(
          //             icon: Icon(Icons.home, color: Colors.lightBlue),
          //             label: "Home"),
          //         BottomNavigationBarItem(
          //             icon: Icon(Icons.search, color: Colors.lightBlue),
          //             label: "Buscar"),
          //         BottomNavigationBarItem(
          //           icon: Icon(Icons.person, color: Colors.lightBlue),
          //           label: "Perfil",
          //         ),
          //         BottomNavigationBarItem(
          //             icon: Icon(Icons.book, color: Colors.lightBlue),
          //             label: "Registrar incidencia"),
          //         BottomNavigationBarItem(
          //             icon: Icon(Icons.start, color: Colors.lightBlue),
          //             label: "Formulario")
          //       ]),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
          child: BottomNavigationBar(
              //Se activa la funcion
              currentIndex: indexTap,
              onTap: (int index) => setState(() => indexTap = index),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.lightBlue),
                    label: "Home"),
                /*BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard, color: Colors.lightBlue),
                    label: "Mis Registros"),*/
                BottomNavigationBarItem(
                    icon: Icon(Icons.book, color: Colors.lightBlue),
                    label: "Registrar incidencia"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.face, color: Colors.lightBlue),
                    label: "chatAyuda")
              ]),
        ));
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
    child: Text("Editar"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchIncidents()),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Editar Incidencia"),
    content: Row(children: [
      Image.asset('assets/images/advertencia.jpg', height: 80),
      Text("¿Estas seguro que quieres editar esta incidencia?"),
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
