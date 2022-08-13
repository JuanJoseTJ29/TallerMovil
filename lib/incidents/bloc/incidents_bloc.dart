import 'dart:convert';

//import 'package:proyectomovil/users/repository/users_repository.dart';
import 'package:proyectomovil/incidents/repository/incidents_repository.dart';
import 'package:http/http.dart' as http;

class AuthServicess {
  static Future<http.Response> registerInc(
      String titulo,
      String lugar,
      String categoria,
      String descripcion,
      String image,
      String id_usuario) async {
    Map data = {
      "titulo": titulo,
      "lugar": lugar,
      "categoria": categoria,
      "descripcion": descripcion,
      "image": image,
      "id_usuario": id_usuario,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseeURL + '/incidencias');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}
