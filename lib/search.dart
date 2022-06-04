import 'package:flutter/material.dart';

class search extends StatefulWidget {
  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Buscar : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese el texto a buscar';
              }
            },
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 80, horizontal: 120),
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
