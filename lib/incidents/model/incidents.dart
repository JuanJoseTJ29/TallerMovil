//Importamos el paquete de material
import 'package:flutter/material.dart';

import '../ui/screens/perfilincidencia.dart';

//Creamos la clase DescriptionPlace que hereda de la clase StatelessWidget
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
    // TODO: implement build

    final IncidentComment = Container(
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w900),
      ),
    );

    final IncidentName = Container(
      child: Text(
        nameIncident, //Variable
        textAlign: TextAlign.left, //Alineacion a la izquierda,
        style: TextStyle(fontSize: 13.0 //Tamaño de texto
            ),
      ),
    );

    final Incidentcategory = Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Text(
        categoryIncident,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 17.0, color: Color(0xFFa3a5a7)),
      ),
    );

    final IncidentDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[Incidentcategory, IncidentName, IncidentComment],
    );

    //Creamos la variable para las estrellas
    final photo = Container(
      //Con su contenedor
      margin: EdgeInsets.only(top: 30.0, right: 40.0, left: 40.0),
      width: 85.0,
      height: 85.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle, //Para que sea circulo
          image: DecorationImage(
              //Resive la imagen que va mostrar
              fit: BoxFit.cover, //posicion, para que encuentre al centro.
              image: AssetImage(pathImage))),
    );

    final botton_ver = ElevatedButton(
      child: Text('VER'),
      style:
          ElevatedButton.styleFrom(primary: Color.fromARGB(255, 31, 115, 241)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => perfilIncidencia()),
        );
      },
    );

    return Row(
      children: <Widget>[photo, IncidentDetails, botton_ver],
    );
  }
}
