import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba_02/screens/Cuenta.dart';
import 'package:prueba_02/screens/Historial.dart';
import 'package:prueba_02/screens/Registro.dart';


void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({Key ? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key ? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Body(context),
    );
  }
}

Widget Body(context) {
  return Container(
    child: Column(
      children: <Widget>[
        Gmail(),
        Contrasenia(),
        BotonLogin(context),
        SizedBox(height: 20), 
        BotonRegistro(context),
      ],
    ),
  );
}

final TextEditingController _gmail = TextEditingController();
Widget Gmail() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(20),
        child: TextField(
          controller: _gmail,
          decoration: InputDecoration(
            hintText: 'Ingrese su Gmail',
            fillColor: Colors.grey,
            filled: true,
          ),
        ),
      )
    ],
  );
}

final TextEditingController _contrasenia = TextEditingController();
Widget Contrasenia() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(20),
        child: TextField(
          controller: _contrasenia,
          decoration: InputDecoration(
            hintText: 'Ingrese Contraseña',
            fillColor: Colors.grey,
            filled: true,
          ),
        ),
      )
    ],
  );
}

Widget BotonLogin(context) {
  return FilledButton(
    onPressed: () {
      login(context);
    },
    child: Text("Login"),
  );
}

Widget BotonRegistro(context) {
  return TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Registro()),
      );
    },
    child: Text("Registro"),
  );
}

Future<void> login(context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _gmail.text,
      password: _contrasenia.text,
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Cuenta()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
