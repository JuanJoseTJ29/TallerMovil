import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseURL = "http://localhost:3002"; //emulator localhost
const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text('Usuario o Contraseña equivocada'),
    duration: const Duration(seconds: 1),
  ));
}
