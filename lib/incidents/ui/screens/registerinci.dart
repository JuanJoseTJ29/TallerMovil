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

class registerinci extends StatefulWidget {
  @override
  State<registerinci> createState() => _registerinciState();
}

class _registerinciState extends State<registerinci> {
  final _formKey = GlobalKey<FormState>();

  dynamic _path;
  dynamic _imagen64;
  File? imageFile;

  final List<String> items = [
    'Objetos perdidos',
    'Artefactos malogrados',
    'Servicios Basicos',
    'Administrativo',
    'Laboratorio',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Registrar Incidencia',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      key: _formKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/registro1.jpg', height: 300),
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
              decoration: InputDecoration(labelText: 'Descripcion : '),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese la descripcion';
                }
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              (_path == null)
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Image.file(File(_path), width: 200),
                    ),
              ElevatedButton(
                child: const Text("Seleccionar imagen"),
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  PickedFile? _archivo =
                      await _picker.getImage(source: ImageSource.gallery);
                  if (_archivo != null) {
                    imageFile = File(_archivo.path);
                  }
                  setState(() {
                    _path = _archivo!.path;
                  });
                  //encoding 64
                  List<int> bytes = await new File(_path).readAsBytesSync();
                  _imagen64 = _path;
                },
              ),
            ]),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text(
                    'Registrar',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 59, 241, 31),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => incidence_edit()),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text(
                    'Atras',
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 52, 105, 203)),
                  onPressed: () {},
                ),
              ],
            ),
            /* Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Enviando la incidencia')));
                }
              },
              child: Text('Enviar'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Cancelando la incidencia')));
                }
              },
              child: Text('Cancelar'),
              color: Colors.red,
              textColor: Colors.white,
            ),
          ),
          */
          ],
        ),
      ),
    );
  }
}


/*
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

//static const String _title = 'Flutter Code Sample';

class registerinci extends StatefulWidget {
  @override
  State<registerinci> createState() => _registerinciState();
  
}

class _registerinciState extends State<registerinci> {
  final _formKey = GlobalKey<FormState>();
  static const String _title = 'Flutter Code Sample';

  dynamic _path;
  dynamic _imagen64;
  File? imageFile;

  final List<String> items = [
    'Objetos perdidos',
    'Artefactos malogrados',
    'Servicios Basicos',
    'Administrativo',
    'Laboratorio',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Registrar Incidencia',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView.builder(
        itemCount: 1,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Image.asset('assets/images/registro1.jpg', height: 300),
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
                decoration: InputDecoration(labelText: 'Descripcion : '),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese la descripcion';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Foto (Opcional) : '),
                validator: (value) {
                  // if (value!.isEmpty) {
                  //   return 'Ingrese el status';
                  // }
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
                      'Registrar',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 59, 241, 31),
                    ),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: Text(
                      'Atras',
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 52, 105, 203)),
                    onPressed: () {},
                  ),
                ],
              ),
              /* Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Enviando la incidencia')));
                }
              },
              child: Text('Enviar'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Cancelando la incidencia')));
                }
              },
              child: Text('Cancelar'),
              color: Colors.red,
              textColor: Colors.white,
            ),
          ),
          */
            ],

            // child: Text('item $index'),
          );
        },
      ),
    );
  }
}
*/