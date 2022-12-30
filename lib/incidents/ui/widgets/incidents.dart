//Importamos el paquete de material
//import 'dart:ffi';

import 'package:flutter/material.dart';

import '../screens/detail_incidencia.dart';

//Creamos la clase DescriptionPlace que hereda de la clase StatelessWidget
class Incident extends StatelessWidget {
  //Variable para el path de la imagen
  String _id;
  String pathImage = "assets/images/people_1.jpeg";
  //Variables
  String nameIncident = "Nombre Incidencia";
  String categoryIncident = "Perdida de carnet";
  String comment =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry";
  //Constructor
  Incident(
      //this.pathImage, 
      this._id,
      this.categoryIncident, 
      this.nameIncident, 
      this.comment);

  //Se debe de sobreescribir el metodo
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final IncidentComment = Container(
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 13.0, fontWeight: FontWeight.w900, color: Colors.black),
      ),
    );

    final IncidentName = Container(
      child: Text(nameIncident, //Variable
          textAlign: TextAlign.left, //Alineacion a la izquierda,
          style: TextStyle(fontSize: 13.0, color: Colors.black)),
    );

    final Incidentcategory = Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Text(
        categoryIncident,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 17.0, color: Colors.black),
      ),
    );

    final enlace_ver = GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Detail_Incidencia(id: _id),
            ));
      },
      child: const Text(
        'ver',
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );

    final IncidentDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[Incidentcategory, IncidentName, enlace_ver],
    );

    //Creamos la variable para las estrellas
    final photo = Container(
      //Con su contenedor
      margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20),
      width: 85.0,
      height: 85.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle, //Para que sea circulo
          image: DecorationImage(
              //Resive la imagen que va mostrar
              fit: BoxFit.cover, //posicion, para que encuentre al centro.
              image: AssetImage(pathImage))),
    );

    return Row(
      children: <Widget>[photo, IncidentDetails],
    );
  }
}
