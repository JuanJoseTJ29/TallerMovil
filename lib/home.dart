import 'package:flutter/material.dart';
//Para importar clases

import 'incidents/incidents_list.dart';
import 'search_incidents.dart';
import 'users/profile.dart';
import 'users/loginn.dart';
import 'users/registerr.dart';

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
    ProfileUsers()
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
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Buscar"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil")
            ]),
      ),
    );
  }
}