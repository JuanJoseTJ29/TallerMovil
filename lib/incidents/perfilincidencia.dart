import 'package:flutter/material.dart';

class perfilIncidencia extends StatefulWidget {
  const perfilIncidencia({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<perfilIncidencia> createState() => _perfilIncidenciaState();
}

class _perfilIncidenciaState extends State<perfilIncidencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Align(
                alignment: AlignmentDirectional(-0.98, 0.1),
                child: Text('Perdida de Carnet!',
                    style: TextStyle(
                        color: Color.fromARGB(255, 18, 183, 43),
                        fontWeight: FontWeight.w800)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Align(
                alignment: AlignmentDirectional(-0.94, 0),
                child: Text('Facultad de letras',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800)),
              ),
              Align(
                alignment: AlignmentDirectional(-0.05, -0.05),
                child: Image.asset(
                  'assets/carnet.jpg',
                  width: 200,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Descripción:',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                'Se me perdio el carnet en la facultad de letras\nPor favor ayudenme a encontrarlo\nsi alguien lo ve comunicarse por favor.',
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Align(
                alignment: AlignmentDirectional(-0.75, 0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text(
                      'Editar',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 31, 115, 241),
                    ),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: Text(
                      'Eliminar',
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 243, 12, 12)),
                    onPressed: () {},
                  ),
                ],
              ),
              ElevatedButton(
                child: Text(
                  'Corregido',
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 9, 229, 16)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
