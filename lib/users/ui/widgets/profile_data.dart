import 'package:flutter/material.dart';
import '../screens/edit_user.dart';

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
    Widget CampoText0() {
      return Text(
        'Juan Jose ',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue),
      );
    }

    Widget CampoText1() {
      return Text(
        'Facultad: Ingeniería de Sistemas e Informática ',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      );
    }

    Widget CampoText2() {
      return Text(
        'Escuela: Ingeniería de Software',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      );
    }

    Widget CampoText3() {
      return Text(
        'Código de Estudiante: 18200117',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      );
    }

    Widget CampoText4() {
      return Text(
        'Correo: juan490@gmail.com',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      );
    }

    Widget Boton() {
      return FlatButton(
        child: Text(
          'Editar',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditUserScreen()),
          );
        },
      );
    }

    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 250.0, right: 45.0, left: 45.0),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CampoText0(),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          ),
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
