// Pantalla realizada por Rodriguez Mirano Sebastian
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text("Encuesta", style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white
          ),
          body: Form(
            child: (
                Column(
                  children: <Widget> [
                    SizedBox(height: 20),
                    TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Encuesta : ')
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(border: OutlineInputBorder(),
                          labelText: 'Comentario : '),
                    ),
                    SizedBox(height: 20),
                    Center(
                        child: (
                            Row (
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget> [
                                  ElevatedButton(
                                    onPressed: (){ },
                                    child: Text('Enviar', style: TextStyle(fontSize: 20)),
                                  ),
                                  SizedBox(width: 80),
                                  ElevatedButton(
                                    onPressed: (){ },
                                    child: Text('Cancelar', style: TextStyle(color: Colors.white, fontSize: 20)),
                                    style: ElevatedButton.styleFrom(primary: Colors.red),
                                  )
                                ]
                            )
                        )
                    )
                  ],
                )
            ),
          ),
        )
    );
  }
}