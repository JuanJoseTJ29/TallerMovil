import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/profile_header.dart';
import '../widgets/profile_data.dart';
import 'home_screen.dart';
import '../screens/edit_user.dart';
import 'package:proyectomovil/users/ui/widgets/rounded_button.dart';
import '../../../home.dart';
import 'edit_user.dart';
// Importar
/*
import 'home.dart';
import 'users/ui/screens/register_user.dart';
import 'users/ui/screens/login_user.dart';
import 'incidents/ui/screens/list_incidents.dart';
import 'incidents/ui/screens/registerinci.dart';

*/
import 'dart:convert';

String stringResponse = '';
Map mapResponse = {};

Map dataResponse = {};

List listResponse = [];

class Homepage extends StatefulWidget {
  String? id;
  //late final VoidCallback? signOut;
  Homepage({this.id});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int indexTap = 0;

  /* void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }
*/
  //String? iddi;
  Future apicall() async {
    String idd = '${widget.id}';
    http.Response response;
    response = await http.get(
        Uri.parse("https://tallermovil-backend.herokuapp.com/users/${idd}"));
    print('Hola ${idd}');
    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['user'];
      });
    }
  }

  boton() async {
    String iddi = '${widget.id}';
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => EditUserScreen(id: iddi),
          //builder: (BuildContext context) => homeIncidents(email: _email  , password:_password),
        ));
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

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
        title: Text(
          "Perfil de Usuario",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: 600,
          width: 700,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.blue),
          child: Column(children: [
            Header_Profile("assets/images/perfilperfill.png", ""),
            //homeIncidents(),
            Text(
              listResponse[0]['name'].toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color.fromARGB(255, 207, 199, 199)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Text(
              'CODIGO DE ESTUDIANTE: ' + listResponse[0]['id'].toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 14, 7, 7)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Text(
              'FACULTAD: ' + listResponse[0]['facultad'].toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 14, 7, 7)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Text(
              'ESCUELA: ' + listResponse[0]['escuela'].toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 14, 7, 7)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Text(
              'EMAIL: ' + listResponse[0]['email'].toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 14, 7, 7)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              //child: Boton(),
            ),
            RoundedButton(
              btnText: 'EDITAR',
              onBtnPressed: () => boton(),
            ),
          ]),
        ),
      ),

      /*   bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
          child: BottomNavigationBar(
              onTap: onTapTapped,
              currentIndex: indexTap,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.lightBlue),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard, color: Colors.lightBlue),
                    label: "Mis Registros"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.lightBlue),
                  label: "Perfil",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book, color: Colors.lightBlue),
                    label: "Registrar incidencia"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.face, color: Colors.lightBlue),
                    label: "chatAyuda")
              ]),
        )
    */
    );
  }
}
/*
showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Editar"),
    onPressed: () {
      //edit user();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditUserScreen(id: _id)),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Editar Usuario"),
    content: Row(children: [
      Image.asset('assets/images/advertencia.jpg', height: 80),
      Text("¿Estas seguro que quieres editar tus datos?"),
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
*/