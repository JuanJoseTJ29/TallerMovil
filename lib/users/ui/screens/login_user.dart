import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyectomovil/users/repository/users_repository.dart';
import 'package:proyectomovil/users/bloc/users_bloc.dart';
import 'package:proyectomovil/users/ui/widgets/rounded_button.dart';
import 'package:http/http.dart' as http;
import '../../../incidents/ui/screens/list_incidents.dart';
import '../../../home.dart';

import 'profile_user.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController codstudController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _id = '';
  String _email = '';
  String _password = '';
  bool _validate = false;
//  String _id = '${widget.id}";
  //int indexTap = 0;
  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Homepage(id: _id),
              //builder: (BuildContext context) => homeIncidents(email: _email  , password:_password),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'Datos incorrectos');
    }
  }

  //void onTapTapped(int index) {
  //setState(() {
  //indexTap = index;
  //});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Iniciar Sesion',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.asset('assets/images/sanmarcos.jpg', height: 300),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Avisa San Marcos',
                  style: TextStyle(
                      color: Color.fromARGB(255, 243, 89, 33),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: codstudController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Codigo de Estudiante',
                  errorText: _validate ? 'Codigo incorrecto' : null,
                ),
                onChanged: (value) {
                  _id = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  errorText: _validate ? 'Email incorrecto' : null,
                ),
                onChanged: (value) {
                  _email = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                  errorText: _validate ? 'contraseña incorrecta' : null,
                ),
                onChanged: (value) {
                  _password = value;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedButton(
              btnText: 'Iniciar Sesion',
              onBtnPressed: () => loginPressed(),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: Theme(
      //data: Theme.of(context)
      //  .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
      //child: BottomNavigationBar(
      //Se activa la funcion
      //  onTap: onTapTapped,
      //currentIndex: indexTap,
      // items: [
      // BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //BottomNavigationBarItem(
      //  icon: Icon(Icons.search), label: "Buscar"),
      //BottomNavigationBarItem(
      //  icon: Icon(Icons.person), label: "Perfil"),
      //])
      //,
      //  )
    );
  }
}
