import 'package:flutter/material.dart';

class incidence extends StatefulWidget {
  @override
  State<incidence> createState() => _incidenceState();
}

class _incidenceState extends State<incidence> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Titulo : '),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese el titulo';
                    }
                  },
                ),
              ),
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Lugar : '),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese el lugar';
                    }
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Descripcion : '),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese la descripcion';
                    }
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Status : '),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese el status';
                    }
                  },
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 80, horizontal: 120),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Accesando al sistema')));
                          }
                        },
                        child: Text('Cancelar'),
                        color: Colors.blue,
                        textColor: Colors.white,
                      ))),
              Flexible(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 120),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Accesando al sistema')));
                    }
                  },
                  child: Text('Enviar'),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
