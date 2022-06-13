import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectomovil/Services/auth_services.dart';
import 'package:proyectomovil/Services/globals.dart';

import '../rounded_button.dart';
import 'ui/screens/home_screen.dart';
import 'loginn.dart';
import 'package:http/http.dart' as http;
import '../home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codstudController = TextEditingController();
  TextEditingController facuController = TextEditingController();
  TextEditingController escuelaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _text = TextEditingController();
  String _email = '';
  String _password = '';
  String _name = '';
  String _codstud = '';
  String _facultad = '';
  String _escuela = '';
  bool _validate = false;

  createAccountPressed() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (emailValid) {
      http.Response response = await AuthServices.register(
          _name, _codstud, _facultad, _escuela, _email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'Datos invalidos');
    }
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                  errorText: _validate ? 'Ingresa tu nombre' : null,
                ),
                onChanged: (value) {
                  _name = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: codstudController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Codigo de estudiante',
                  errorText: _validate ? 'Codigo incorrecto' : null,
                ),
                onChanged: (value) {
                  _codstud = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: facuController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Facultad',
                  errorText: _validate ? 'Ingresa tu facultad' : null,
                ),
                onChanged: (value) {
                  _facultad = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: escuelaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Escuela',
                  errorText: _validate ? 'Ingresa tu escuela' : null,
                ),
                onChanged: (value) {
                  _escuela = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  errorText: _validate ? 'Ingresa tu email' : null,
                ),
                onChanged: (value) {
                  _email = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                  errorText: _validate ? 'Ingresa tu contraseña' : null,
                ),
                onChanged: (value) {
                  _password = value;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedButton(
              btnText: 'Crea tu cuenta',
              onBtnPressed: () => createAccountPressed(),
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
    );
  }
}
