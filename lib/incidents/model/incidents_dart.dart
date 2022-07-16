import 'package:flutter/material.dart';

class Incident extends StatelessWidget {
  //Variable para el path de la imagen
  String pathImage = "assets/images/people_1.jpeg";
  //Variables
  String nameIncident = "Nombre Incidencia";
  String categoryIncident = "Perdida de carnet";
  String comment =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry";
  //Constructor
  Incident(
      this.pathImage, this.categoryIncident, this.nameIncident, this.comment);

  //Se debe de sobreescribir el metodo
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[Incident('', '', '', '')],
    );
  }
}
