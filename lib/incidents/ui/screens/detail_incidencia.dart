import 'package:flutter/material.dart';
import 'edit_incidents.dart';
import 'list_incidents.dart';
import 'search_incidents.dart';
import '../../../users/ui/screens/profile_user.dart';

class Detail_Incidencia extends StatefulWidget {
  const Detail_Incidencia({Key? key}) : super(key: key);
  @override
  _Detail_Incidencia createState() => _Detail_Incidencia();
}

class _Detail_Incidencia extends State<Detail_Incidencia> {
  int indexTap = 0;

  static var _pages = <Widget>[ReviewList(), SearchIncidents(), ProfileUsers()];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'INCIDENCIA',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                          fontWeight: FontWeight.w800,
                          fontSize: 50)),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.94, 0),
                  child: Text('Facultad de letras',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 30)),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.05, -0.05),
                  child: Image.asset(
                    'assets/images/carnet.jpg',
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => incidence_edit()),
                        );
                      },
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
        // widgetsChildren[indexTap],

        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
          child: BottomNavigationBar(
              //Se activa la funcion
              currentIndex: indexTap,
              onTap: (int index) => setState(() => indexTap = index),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Buscar"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Perfil",
                ),
              ]),
        ));
  }
}
