import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectomovil/Services/auth_services.dart';
import 'package:proyectomovil/Services/globals.dart';
import '../../../incidents/ui/screens/list_incidents.dart';
import '../widgets/rounded_button.dart';

import '../../../home.dart';
import 'home_screen.dart';
import 'login_user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  /*TextEditingController nameController = TextEditingController();
  TextEditingController codstudController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController facuController = TextEditingController();
  TextEditingController escuelaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _text = TextEditingController();*/

  static final RegExp _nombreExp = RegExp(r"^[a-zA-Z]+$");
  static final RegExp _codigoExp = RegExp(r"^[0-9]{8}$");
  static final RegExp _emailExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final RegExp _facuExp = RegExp(r"^[a-zA-Z\s]*$");
  static final RegExp _escuelaExp = RegExp(r"^[a-zA-Z\s]*$");
  static final RegExp _passwordExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
  // Minimo 8 caracteres, debe contener letras y numeros
  bool _esNombre(String str) {return _nombreExp.hasMatch(str.toLowerCase());}
  bool _esCodigo(String str) {return _codigoExp.hasMatch(str.toLowerCase());}
  bool _esEmail(String str) {return _emailExp.hasMatch(str.toLowerCase());}
  bool _esFacu(String str) {return _facuExp.hasMatch(str.toLowerCase());}
  bool _esEscuela(String str) {return _escuelaExp.hasMatch(str.toLowerCase());}
  bool _esPassword(String str) {return _passwordExp.hasMatch(str.toLowerCase());}

  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _name = '';
  String _codstud = '';
  String _facultad = '';
  String _escuela = '';

  //bool _validate = true;

  createAccountPressed() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (emailValid) {
      http.Response response = await AuthServices.register(
          _name, _codstud, _facultad, _escuela, _email, _password);
      Map responseMap = jsonDecode(response.body);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const ReviewList(),
          ));
      if (response.statusCode == 200) {
        /*Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));*/

      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'Datos invalidos');
    }
  }

  validator(valor, date) {
    if (valor == null || valor.isEmpty) {return 1;}
    else { if (!date) {return 2;}
    else return 0;}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Registro',
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
                      switch(validator(value, _esNombre(value.toString()))) {
                        case 1: return "Ingrese algun caracter";
                        case 2: return "Ingrese un nombre correcto";
                        case 0: return null;
                      }
                    },
                    onChanged: (value) {
                      _name = value;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    //controller: codstudController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Codigo de estudiante',
                      //errorText: _validate ? 'Codigo incorrecto' : null,
                    ),
                    validator: (value) {
                      switch(validator(value, _esCodigo(value.toString()))) {
                        case 1: return "Ingrese algun caracter";
                        case 2: return "Ingrese un codigo correcto, con solo numeros (8 caracteres)";
                        case 0: return null;
                      }
                    },
                    onChanged: (value) {
                      _codstud = value;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    //controller: facuController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Facultad',
                      //errorText: _validate ? 'Ingresa tu facultad' : null,
                    ),
                    validator: (value) {
                      switch(validator(value, _esFacu(value.toString()))) {
                        case 1: return "Ingrese algun caracter";
                        case 2: return "Ingrese una facultad correcta";
                        case 0: return null;
                      }
                    },
                    onChanged: (value) {
                      _facultad = value;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    //controller: escuelaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Escuela',
                      //errorText: _validate ? 'Ingresa tu escuela' : null,
                    ),
                    validator: (value) {
                      switch(validator(value, _esEscuela(value.toString()))) {
                        case 1: return "Ingrese algun caracter";
                        case 2: return "Ingrese una escuela correcta";
                        case 0: return null;
                      }
                    },
                    onChanged: (value) {
                      _escuela = value;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    //controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      //errorText: _validate ? 'Ingresa tu email' : null,
                    ),
                    validator: (value) {
                      switch(validator(value, _esEmail(value.toString()))) {
                        case 1: return "Ingrese algun caracter";
                        case 2: return "Ingrese un email correcto";
                        case 0: return null;
                      }
                    },
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    //controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                      //errorText: _validate ? 'Ingresa tu contraseña' : null,
                    ),
                    validator: (value) {
                      switch(validator(value, _esPassword(value.toString()))) {
                        case 1: return "Ingrese algun caracter";
                        case 2: return "Ingrese una contraseña correcta, minimo una letra y un numero (8 caracteres)";
                        case 0: return null;
                      }
                    },
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: const Text('Crea tu cuenta'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      createAccountPressed();
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const LoginScreen(),
                        ));
                  },
                  child: const Text(
                    'Ya tengo una cuenta',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
          ),
        ),
      ),
    );
  }
}
