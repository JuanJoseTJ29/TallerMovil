import 'package:flutter/material.dart';

//Se rellena con el color verde
class Data_Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Data_Profile();
  }
}

class _Data_Profile extends State<Data_Profile> {
  @override
  Widget build(BuildContext context) {
    Widget CampoText1() {
      return TextField(
        decoration: InputDecoration(hintText: "Facultad"),
      );
    }

    Widget CampoText2() {
      return TextField(
        decoration: InputDecoration(hintText: "Escuela Profesional"),
      );
    }

    Widget CampoText3() {
      return TextField(
        obscureText: true,
        decoration: InputDecoration(hintText: "Contraseña"),
      );
    }

    Widget CampoText4() {
      return TextField(
        obscureText: true,
        decoration: InputDecoration(hintText: "Repetir Contraseña"),
      );
    }

    Widget Boton() {
      return FlatButton(
        child: Text(
          'Editar',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {},
      );
    }

    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 225.0, right: 45.0, left: 45.0),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CampoText1(),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          ),
          CampoText2(),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          ),
          CampoText3(),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          ),
          CampoText4(),
          Container(
            margin: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Boton(),
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    ));
  }
}
