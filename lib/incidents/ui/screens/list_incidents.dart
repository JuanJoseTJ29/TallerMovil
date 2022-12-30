import 'package:flutter/material.dart';
import 'package:proyectomovil/main.dart';
import 'package:http/http.dart' as http;
import 'package:proyectomovil/users/ui/screens/profile_user.dart';
import 'dart:convert';

import '../widgets/incidents.dart';

import '../../../home.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  _ReviewList createState() => _ReviewList();
}

class _ReviewList extends State<ReviewList> {
  Future apicall() async {
    http.Response response;
    response = await http.get(
        Uri.parse("http://localhost:3002/incidencias"));
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        mapResponse = json.decode(response.body);
        print(mapResponse);
        listResponse = mapResponse['incidencias'];
        print("------");
        print(listResponse[0]['titulo'].toString());
      });
    }
  }

  int indexTap = 0;

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  void initState() {
    apicall();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    //Retornamos la columna
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'INCIDENCIAS PUBLICAS',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
          //padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
        children: <Widget>[
          for(int x = 1; x <= listResponse.length; x++)...[
            Incident(
              //"assets/images/carnetpp.JPG",
              listResponse[x-1]['id_incidencias'].toString(),
              listResponse[x-1]['categoria'].toString(),
              listResponse[x-1]['titulo'].toString(),
              listResponse[x-1]['descripcion'].toString()),
          ],
          /*Incident(
              //"assets/images/carnetpp.JPG",
              "Perdida de Carnet universitario",
              "Varuna Yasas",
              "ayuda se perdio carnet"),
          Incident(//"assets/images/compumal.jpg", 
          "pcs no funcionan",
              "Anahí Salgado", 
              "computadora no funciona"),
          Incident(
              //"assets/images/celperdido.jpg",
              "Perdida de Celular Samsung",
              "Gissele Thomas",
              "Lorem Ipsum is simply dummy text of the printing"),
          Incident(//"assets/images/carnet.jpg", 
          "Perdida-Carnet Biblioteca",
              "Varuna Yasas", 
              "se me perdio mi carnet"),
          Incident(
              //"assets/images/sluz.jpg",
              "No hay luz en la facultad",
              "Anahí Salgado",
              "Lorem Ipsum is simply dummy text of the printing"),
          Incident(
              //"assets/images/sagua.png",
              "No hay agua en la facultad",
              "Gissele Thomas",
              "Lorem Ipsum is simply dummy text of the printing"),*/
        ],
      )),
    );
  }
}
