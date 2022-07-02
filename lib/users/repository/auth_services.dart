import 'dart:convert';

import 'package:proyectomovil/users/repository/globals.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<http.Response> register(String name, String codstud,
      String facultad, String escuela, String email, String password) async {
    Map data = {
      "name": name,
      "codstud": codstud,
      "facultad": facultad,
      "escuela": escuela,
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String correo, String password) async {
    Map data = {
      "correo": correo,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> mostrar(String id, String name, String codstud,
      String facultad, String escuela) async {
    Map data = {
      "id": id,
      "name": name,
      "codstud": codstud,
      "facultad": facultad,
      "escuela": escuela,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/users');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}
