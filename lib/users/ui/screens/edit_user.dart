import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectomovil/users/bloc/users_bloc.dart';
import 'package:proyectomovil/users/ui/screens/profile_user.dart';
//import 'package:proyectomovil/users/repository/auth_services.dart';
//import 'package:proyectomovil/users/repository/globals.dart';
import '../../../incidents/ui/screens/list_incidents.dart';
import '../widgets/rounded_button.dart';
import 'package:proyectomovil/users/repository/users_repository.dart';
import 'package:proyectomovil/users/ui/widgets/rounded_button.dart';

import '../../../home.dart';
import 'home_screen.dart';
import 'login_user.dart';

class EditUserScreen extends StatefulWidget {
  String? id;
  EditUserScreen({this.id});
  // const EditUserScreen({Key? key}) : super(key: key);

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  static final RegExp _nombreExp = RegExp(r"^[a-zA-Z]+$");
  static final RegExp _codigoExp = RegExp(r"^[0-9]{8}$");

  // Minimo 8 caracteres, debe contener letras y numeros
  bool _esNombre(String str) {
    return _nombreExp.hasMatch(str.toLowerCase());
  }

  bool _esCodigo(String str) {
    return _codigoExp.hasMatch(str.toLowerCase());
  }

  final _formKey = GlobalKey<FormState>();

  //String _id ='${widget.id}';
  String _name = '';
  // String _codstud = '';
  String _facultad = '';
  String _escuela = '';

  String _selectedFacultad = "Facultad de Ingenieria de Sistemas";
  var facultades = {
    "Facultad de Ingenieria de Sistemas": "FISI",
    "Facultad de Ciencias Físicas": "FCF"
  };

  List _facultades = [];

  FacultadesDependentDropDown() {
    facultades.forEach((key, value) {
      _facultades.add(key);
    });
  }

  String _selectedEscuela = "";
  var escuelas = {
    "Escuela Profesional de Ingenieria de Sistemas": "FISI",
    "Escuela Profesional de Ingenieria de Software": "FISI",
    "Escuela Profesional de Fisica": "FCF",
    "Escuela Profesional de Ingenieria de Mecanica de Fluidos": "FCF"
  };

  List _escuelas = [];

  EscuelasDependentDropDown(facultadSiglas) {
    escuelas.forEach((key, value) {
      if (facultadSiglas == value) {
        _escuelas.add(key);
      }
    });
    _selectedEscuela = _escuelas[0];
  }

  editAccountPressed() async {
    String _id = '${widget.id}';

    http.Response response =
        await AuthServices.editar(_id, _name, _facultad, _escuela);
    Map responseMap = jsonDecode(response.body);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Homepage(id: _id),
        ));
    if (response.statusCode == 200) {
    } else {
      errorSnackBar(context, responseMap.values.first[0]);
    }
  }

  validator(valor, date) {
    if (valor == null || valor.isEmpty) {
      return 1;
    } else {
      if (!date) {
        return 2;
      } else
        return 0;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FacultadesDependentDropDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Editar Usuario',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //homeIncidents(),
              Image.asset('assets/images/sanmarcos.jpg', height: 180),
              const SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Avisa San Marcos',
                    style: TextStyle(
                        color: Color.fromARGB(255, 243, 89, 33),
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    //errorText: _validate ? _errorText : null,
                  ),
                  validator: (value) {
                    switch (validator(value, _esNombre(value.toString()))) {
                      case 1:
                        return "Ingrese algun caracter";
                      case 2:
                        return "Ingrese un nombre correcto";
                      case 0:
                        return null;
                    }
                  },
                  onChanged: (value) {
                    _name = value;
                  },
                ),
              ),
              /*   Container(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  //controller: codstudController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Codigo de estudiante',
                    //errorText: _validate ? 'Codigo incorrecto' : null,
                  ),
                  validator: (value) {
                    switch (validator(value, _esCodigo(value.toString()))) {
                      case 1:
                        return "Ingrese algun caracter";
                      case 2:
                        return "Ingrese un codigo correcto, con solo numeros (8 caracteres)";
                      case 0:
                        return null;
                    }
                  },
                  onChanged: (value) {
                    _codstud = value;
                  },
                ),
              ),

              */
              Container(
                padding: EdgeInsets.all(5),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  )),
                  value: _selectedFacultad,
                  onChanged: (newValue) {
                    setState(() {
                      _facultades = [];
                      _escuelas = [];
                      EscuelasDependentDropDown(facultades[newValue]);
                      _selectedFacultad = "$newValue";
                      _facultad = "$newValue";
                      FacultadesDependentDropDown();
                    });
                  },
                  items: _facultades.map((facultades) {
                    return DropdownMenuItem(
                      child: new Text(facultades),
                      value: facultades,
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  )),
                  value: _selectedEscuela,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedEscuela = "$newValue";
                      _escuela = "$newValue";
                    });
                  },
                  items: _escuelas.map((escuelas) {
                    return DropdownMenuItem(
                      child: new Text(escuelas),
                      value: escuelas,
                    );
                  }).toList(),
                  validator: (value) {
                    print(value);
                    return value == "" ? "Ingrese una escuela" : null;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: const Text('Editar Usuario'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    editAccountPressed();
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
