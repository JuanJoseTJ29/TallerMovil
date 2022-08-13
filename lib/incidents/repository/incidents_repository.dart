import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseeURL =
    "https://tallermovil-backend.herokuapp.com"; //emulator localhost
const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBarrr(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text('Usuario o Contraseña equivocada'),
    duration: const Duration(seconds: 1),
  ));
}
