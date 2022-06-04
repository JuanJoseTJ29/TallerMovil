import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 25.0,
                spreadRadius: 5.0,
                offset: Offset(5.0, 5.0))
          ],
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/sanmarcos.jpg', height: 110), //cambia el nombre de tu imagen
            CampoText1(),
            SizedBox(
              height: 20,
            ),
            CampoText2(),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),       
            ),
            SizedBox(
              height: 20,
            ),
            Text("¿No tienes una cuenta aún? Registrate !")
          ]),
        ),
      ),
    );
  }

  Widget CampoText1() {
     return TextField(
      controller: email,
      decoration: InputDecoration(hintText: "Codigo de estudiante"),
    );
  }

  Widget CampoText2(){
    return TextField(
    controller: password,
    obscureText: true,
    decoration: InputDecoration(hintText: "Contraseña"),
    );
  }


  Widget Boton(){
    return FlatButton(
                child: Text(
                  'Iniciar Sesion',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onPressed: () {},
              );
  }
}
