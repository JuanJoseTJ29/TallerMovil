import 'package:flutter/material.dart';

class incidence extends StatefulWidget{
  @override
  _incidenceState createState() => _incidenceState();
}

class _incidenceState extends State<incidence>{
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0,
                spreadRadius: 5.0,
                offset: Offset(5.0, 5.0)
            )
          ],
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Registrar incidencia'),
              // Image.asset('assets/sanmarcos.png', height: 110),
              SizedBox(height: 50),
              CampoText1(),
              SizedBox(height: 20),
              CampoText2(),
              SizedBox(height: 20),
              CampoText3(),
              SizedBox(height: 20),
              CampoText4(),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: boton()
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: boton2()
              ),
              SizedBox(height: 50,),
              // Text('Crea una cuenta')
            ],
          ),
        ),
      ),
    );
  }
  Widget CampoText1(){
    return TextField(
      controller: email,
      decoration: InputDecoration(
          hintText: 'Titulo'
      ),
    );
  }
  Widget CampoText2(){
    return TextField(
      obscureText: true,
      controller: pass,
      decoration: InputDecoration(
          hintText: 'Lugar'
      ),
    );
  }
  Widget CampoText3(){
    return TextField(
      obscureText: true,
      controller: pass,
      decoration: InputDecoration(
          hintText: 'Descripcion'
      ),
    );
  }
  Widget CampoText4(){
    return TextField(
      obscureText: true,
      controller: pass,
      decoration: InputDecoration(
          hintText: 'Foto'
      ),
    );
  }
  Widget boton() {
    return FlatButton(
      child: Text('Enviar', style: TextStyle(color: Colors.white, fontSize: 20)),
      onPressed: (){

      },
  );
}
  Widget boton2() {
    return FlatButton(
      child: Text('Cancelar', style: TextStyle(color: Colors.white, fontSize: 20)),
      onPressed: (){

      },
    );
  }
} 