import 'package:flutter/material.dart';
//Para importar clases

import 'incidents/ui/screens/list_incidents.dart';
import 'incidents/ui/screens/search_incidents.dart';
import 'users/ui/screens/profile_user.dart';

import 'Encuesta.dart';
import 'incidents/ui/screens/registerinci.dart';

class homeIncidents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homeIncidents();
  }
}

class _homeIncidents extends State<homeIncidents> {
  //Indice para acceder a los elementos
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    //Para dar una lista de metodos
    ReviewList(),
    SearchIncidents(),
    ProfileUsers(),
    registerinci(),
    Encuesta()
  ];

  //Metodo para dar una evento
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //Segun el indice
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
        child: BottomNavigationBar(
            //Se activa la funcion
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.lightBlue),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.lightBlue),
                  label: "Buscar"),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.lightBlue),
                label: "Perfil",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book, color: Colors.lightBlue),
                  label: "Registrar incidencia"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.start, color: Colors.lightBlue),
                  label: "Formulario")
            ]),
      ),
    );
  }
}
