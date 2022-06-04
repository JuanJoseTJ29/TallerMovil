import 'package:flutter/material.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  // TextEditingController email = new TextEditingController();
  // TextEditingController password = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Image.asset('assets/sanmarcos.jpg', height: 110),
          TextFormField(
            decoration: InputDecoration(labelText: 'Codigo de Estudiante : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese Su codigo de Estudiante';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Facultad de Estudio : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Escribe su facultad';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Escuela profesional : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Escriba su Escuela profesional';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Contraseña : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese su contraseña';
              }
            },
          ),

            TextFormField(
            decoration: InputDecoration(labelText: 'RepetirContraseña : '),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Vuelva a escribir su contraseña';
              }
            },
            
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Accesando al sistema')));
                }
              },
              child: Text('Registrar'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Cancelando el Registro')));
                }
              },
              child: Text('Cancelar'),
              color: Colors.red,
              textColor: Colors.white,
            ),
          ),
            SizedBox(
              height: 20,
            ),
            Text("¿Ya tienes una cuenta? Iniciar Sesion !"),
        ],
      ),
    );
  }
}
//       backgroundColor: Colors.white,
//       body: Container(
//         // decoration: BoxDecoration(
//         //   boxShadow: [
//         //     BoxShadow(
//         //         color: Colors.black38,
//         //         blurRadius: 25.0,
//         //         spreadRadius: 5.0,
//         //         offset: Offset(5.0, 5.0))
//         //   ],
//         //   color: Colors.white,
//         // ),
//         margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
//         child: Center(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Image.asset('assets/sanmarcos.jpg', height: 110), //cambia el nombre de tu imagen
//             CampoText1(),
//             SizedBox(
//               height: 20,
//             ),
//             CampoText2(),
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              
//             ),
//             CampoText3(),
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            
//             ),
//             CampoText4(),
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          
//             ),
//             CampoText5(),
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(10)),
//               child: Boton(),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text("¿Ya tienes una cuenta? Iniciar Sesion !")
//           ]),
//         ),
//       ),
//     );
//   }

//   Widget CampoText1() {
//      return TextField(
//       controller: email,
//       decoration: InputDecoration(hintText: "Codigo de estudiante"),
//     );
//   }

//     Widget CampoText2() {
//      return TextField(
//       controller: email,
//       decoration: InputDecoration(hintText: "Facultad"),
//     );
//   }

//       Widget CampoText3() {
//      return TextField(
//       controller: email,
//       decoration: InputDecoration(hintText: "Escuela Profesional"),
//     );
//   }

//   Widget CampoText4(){
//     return TextField(
//     controller: password,
//     obscureText: true,
//     decoration: InputDecoration(hintText: "Contraseña"),
//     );
//   }

//     Widget CampoText5(){
//     return TextField(
//     controller: password,
//     obscureText: true,
//     decoration: InputDecoration(hintText: "Repetir Contraseña"),
//     );
//   }


//   Widget Boton(){
//     return FlatButton(
//                 child: Text(
//                   'Registrar',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//                 onPressed: () {},
//               );
//   }
// }
