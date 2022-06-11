import 'package:flutter/material.dart';

class incidence_edit extends StatefulWidget {
  const incidence_edit({Key? key}) : super(key: key);
  @override
  _incidenceState createState() => _incidenceState();
}

class _incidenceState extends State<incidence_edit> {
  final _formKey = GlobalKey<FormState>();
  int indexTap = 0;
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //key: _formKey,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Editar Incidencia',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          key: _formKey,
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
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
          child: BottomNavigationBar(
              //Se activa la funcion
              onTap: onTapTapped,
              currentIndex: indexTap,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Buscar"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Perfil"),
              ]),
        ));
  }
}
