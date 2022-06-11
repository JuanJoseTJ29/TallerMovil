import 'package:flutter/material.dart';

class Header_Profile extends StatelessWidget {
  //variable con datos por defecto

  String pathImage = "assets/images/people_1.jpeg";

  String name = "Juana Jose";

  Header_Profile(this.pathImage, this.name);
  @override
  Widget build(BuildContext context) {
    final photo_user = Container(
      //Con su contenedor
      margin: EdgeInsets.only(top: 30.0, right: 40.0, left: 40.0),
      width: 250.0,
      height: 250.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(

              //Resive la imagen que va mostrar
              fit: BoxFit.cover, //posicion, para que encuentre al centro.
              image: AssetImage(pathImage))),
    );

    final name_user = Container(
      margin: EdgeInsets.only(top: 30.0, right: 40.0, left: 40.0, bottom: 30.0),
      alignment: Alignment.center,
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 36.0, color: Color(0xFFa3a5a7)),
      ),
    );

    return Column(
      children: <Widget>[photo_user, name_user],
    );
  }
}
