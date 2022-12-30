import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'list_incidents.dart';
import 'edit_incidents.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:proyectomovil/incidents/repository/incidents_repository.dart';
import 'package:proyectomovil/incidents/ui/widgets/mesagges.dart';
import 'package:proyectomovil/incidents/bloc/incidents_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
//import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class registerinci extends StatefulWidget {
  @override
  State<registerinci> createState() => _registerinciState();
}

class _registerinciState extends State<registerinci> {
  // File? imagen = null;
  String _titulo = '';
  String _lugar = '';
  //String _categoria = 'dfsdf';
  String _descripcion = '';
  String _idusuario = '';
  String? selectedValue; // la categoria
  String? token;
  dynamic _path;
  dynamic _imagen64;
  bool _isLoading = false;
  setLoading(bool state) => setState(() => _isLoading = state);
  File? imageFile;

  // final picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();
/*
  Future selImagen(op) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print('No seleccionaste ninguna foto');
      }
    });
    Navigator.of(context).pop();
  }
*/

  final List<String> items = [
    'Objetos perdidos',
    'Artefactos malogrados',
    'Servicios Basicos',
    'Administrativo',
    'Laboratorio',
  ];

  Future<dynamic> postAddPincident(
      titulo, lugar, categoria, descripcion, image, id_usuario) async {
    print(id_usuario);

    Map data = {
      "usuario_id": "34",
      "titulo": titulo,
      "lugar": lugar,
      "categoria": categoria,
      "descripcion": descripcion,
    };
    var body = json.encode(data);
    var postUri = Uri.parse("http://localhost:3002/incidencias");

    http.Response response = await http.post(
      postUri,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      print('holaholaaa');
      Navigator.push(
          context,
          MaterialPageRoute(
            // builder: (BuildContext context) => ReviewList(),
            builder: (BuildContext context) => ReviewList(),
            //  builder: (BuildContext context) => homeIncidents(),
          ));
    }
  }
/*
  Dio dio = new Dio();

  Future<void> subirimagen() async {
    try {
      String filename = imagen!.path;
      FormData formData = new FormData.fromMap({
        'titulo': '_titulo',
        'lugar': '_lugar',
        'categoria': 'selectedValue',
        'descripcion': '_descripcion',
        'id_usuario': '_idusuario',
        'file': await MultipartFile.fromFile(
          imagen!.path,
          filename: filename,
          contentType: new MediaType("image", "jpg"),
        ),
      });
      print('holaholaaa');
      await Dio().post('https://tallermovil-backend.herokuapp.com/incidencias',
          data: formData);
    } catch (e) {
      print(e.toString());
    }
  }
  */
/*
  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      selImagen(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Tomar una foto',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(Icons.camera_alt, color: Colors.blue)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selImagen(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Seleccionar una imagen',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(Icons.image, color: Colors.blue)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.red),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Cancelar',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                          //  Icon(Icons.image, color: Colors.blue)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
*/

  //String? selectedValue;

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
              onChanged: (value) {
                _titulo = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Lugar : '),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese el lugar';
                }
              },
              onChanged: (value) {
                _lugar = value;
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
              onChanged: (value) {
                _descripcion = value;
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            /*  ElevatedButton(
              onPressed: () {
                opciones(context);
              },
              child: Text('Selecciona una imagen'),
              // style: ElevatedButton.styleFrom(
              //   primary: Color.fromARGB(255, 52, 105, 203)),
            ),
            */
            /*
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
            ),
            imagen != null ? Image.file(imagen!, width: 200) : Center(),

            */
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              (_path == null)
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Image.file(File(_path), width: 200),
                    ),
              /*ElevatedButton(
                child: const Text("Seleccionar imagen"),
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  // final picker = ImagePicker();
                  PickedFile? _archivo = await _picker.getImage(
                      source: ImageSource.gallery); //actualizar porseacasoo
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
              ),*/
            ]),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // devolverá true si el formulario es válido, o falso si
                    // el formulario no es válido.
                    postAddPincident(_titulo, _lugar, selectedValue,
                        _descripcion, _path, _idusuario);
                  },
                  child: const Text('Registrar incidencia'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 12),
                    textStyle: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    'Atras',
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 52, 105, 203)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
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