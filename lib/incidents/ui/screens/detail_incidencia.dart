import 'package:flutter/material.dart';
import 'edit_incidents.dart';
import 'list_incidents.dart';
import 'search_incidents.dart';
import '../../../users/ui/screens/profile_user.dart';
import '../screens/registerinci.dart';
import '../../../Encuesta.dart';

class Detail_Incidencia extends StatefulWidget {
  const Detail_Incidencia({Key? key}) : super(key: key);
  @override
  _Detail_Incidencia createState() => _Detail_Incidencia();
}

class _Detail_Incidencia extends State<Detail_Incidencia> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    //Para dar una lista de metodos
    ReviewList(),
    SearchIncidents(),
    Homepage(),
    registerinci(),
    Encuesta()
  ];

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
                  child: Text('Perdida de Carnet univeristario!',
                      style: TextStyle(
                          color: Color.fromARGB(255, 8, 137, 236),
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
                    'assets/images/carnetpp.JPG',
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
                  'Se me perdio mi carnet universitario en la facultad de letras\npor favor ayudenme a encontrarlo ',
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
                      onPressed: () {
                        showAlertDialog(context);
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  child: Text(
                    'Corregido',
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 9, 229, 16)),
                  onPressed: () {
                    showAlertDialogg(context);
                  },
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
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.lightBlue),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard, color: Colors.lightBlue),
                    label: "Mis Registros"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book, color: Colors.lightBlue),
                    label: "Registrar incidencia"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.face, color: Colors.lightBlue),
                    label: "chatAyuda")
              ]),
        ));
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Elimnar"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchIncidents()),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Elminar Incidencia"),
    content: Row(children: [
      Image.asset('assets/images/advertencia.jpg', height: 80),
      Text("¿Estas seguro que quieres eliminar esta incidencia?"),
    ]),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogg(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Corregir"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchIncidents()),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Marcar como corregido"),
    content: Row(children: [
      Image.asset('assets/images/corregidoo.jpg', height: 80),
      Text("¿Estas seguro que quieres marcar como corregida la incidencia?"),
    ]),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
