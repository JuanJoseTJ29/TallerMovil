import 'package:flutter/material.dart';
import '../home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // TextEditingController email = new TextEditingController();
  // TextEditingController password = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: Column(
        children: <Widget>[
          Image.asset('assets/images/sanmarcos.jpg', height: 300),
          TextFormField(
            decoration: InputDecoration(labelText: 'Codigo de Estudiante : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese Su codigo de Estudiante';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Facultad de Estudio : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Escribe su facultad';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Escuela profesional : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Escriba su Escuela profesional';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Contraseña : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese su contraseña';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'RepetirContraseña : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Vuelva a escribir su contraseña';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Accesando al sistema'),
                  ));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homeIncidents()),
                  );
                }
              },
              child: Text('Registrar'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Cancelando el Registro')));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
              },
              child: Text('Cancelar'),
              color: Colors.red,
              textColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("¿Ya tienes una cuenta? Iniciar Sesion !"),
        ],
      ),
    );
  }
}
