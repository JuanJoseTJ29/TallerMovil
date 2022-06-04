import 'package:flutter/material.dart';

class incidence extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
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
          TextFormField(
            decoration: InputDecoration(labelText: 'Descripcion : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese la descripcion';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Status : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese el status';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 120),
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
        ],
      ),
    );
  }
}
