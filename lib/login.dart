import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  // TextEditingController email = new TextEditingController();
  // TextEditingController password = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Image.asset('assets/sanmarcos.jpg', height: 110),
          TextFormField(
            decoration: InputDecoration(labelText: 'Codigo de Estudiante : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese Su codigo de Estudiante';
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
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Accesando al sistema')));
                }
              },
              child: Text('Entrar'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ),
           Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Cancelando el Inicio de Sesion')));
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
            Text("¿No tienes una cuenta aún? Registrate !"),
        ],
      ),
    );
  }
}