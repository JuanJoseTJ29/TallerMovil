import 'package:flutter/material.dart';

class incidence extends StatefulWidget{
  @override
  State<incidence> createState() => _incidenceState();
}

class _incidenceState extends State<incidence>{
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
            decoration: InputDecoration(labelText: 'Foto (Opcional) : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese el status';
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
                      SnackBar(content: Text('Enviando la incidencia')));
                }
              },
              child: Text('Enviar'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 80, horizontal: 120),
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
        ],
      ),
    );
  }
}