import 'package:flutter/material.dart';

//Se rellena con el color verde
class Encuesta extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Encuesta();
  }
}

class _Encuesta extends State<Encuesta> {
  static final RegExp _comentarioExp = RegExp(
      r"^[a-zA-Z\s]*$"
  );

  final _formkey = GlobalKey<FormState>();

  bool _esComentario(String str) {
    return _comentarioExp.hasMatch(str.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ENCUESTA", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(), labelText: 'Encuesta : '),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Ingrese algun caracter";
                              }
                              //else {
                              //  Aqui irian los de la encuesta
                              //}
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(), labelText: 'Comentario : '),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Ingrese algun caracter";
                              } else {
                                if (!_esComentario(value.toString())) {
                                  return 'Ingrese solo letras y espacios';
                                }
                              }
                            }),
                        SizedBox(height: 20),
                        Center(
                            child: (Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(content: Text("Procesando datos...")));
                                      }
                                    },
                                    child: Text('Enviar', style: TextStyle(fontSize: 20)),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Cancelar',
                                        style: TextStyle(color: Colors.white, fontSize: 20)),
                                    style: ElevatedButton.styleFrom(primary: Colors.red),
                                  )
                                ])))
                      ],
                    )),
              ),
            ),
          ),
        ),
    );

  }
}