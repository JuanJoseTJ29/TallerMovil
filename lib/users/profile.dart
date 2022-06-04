import 'package:flutter/material.dart';

//Se rellena con el color verde
class ProfileIncidents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileIncidents();
  }
}

class _ProfileIncidents extends State<ProfileIncidents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 25.0,
                spreadRadius: 5.0,
                offset: Offset(5.0, 5.0))
          ],
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/people_1.jpeg',
                height: 110), //cambia el nombre de tu imagen
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
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            ),
            CampoText5(),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Boton(),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }

  Widget CampoText2() {
    return TextField(
      decoration: InputDecoration(hintText: "Facultad"),
    );
  }

  Widget CampoText3() {
    return TextField(
      decoration: InputDecoration(hintText: "Escuela Profesional"),
    );
  }

  Widget CampoText4() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: "Contraseña"),
    );
  }

  Widget CampoText5() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: "Repetir Contraseña"),
    );
  }

  Widget Boton() {
    return FlatButton(
      child: Text(
        'Editar',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      onPressed: () {},
    );
  }
}
