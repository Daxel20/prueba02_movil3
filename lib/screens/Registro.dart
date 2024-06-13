import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prueba_02/screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(Registro());
}

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Registro'),
        ),
        body: RegistroForm(),
      ),
    );
  }
}

class RegistroForm extends StatefulWidget {
  @override
  _RegistroFormState createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  
  void _registrarUsuario(BuildContext context) {
    String correo = _correoController.text;
    String nickname = _nicknameController.text;
    String contrasenia = _contraseniaController.text;

    DatabaseReference userRef = FirebaseDatabase.instance.ref().child('usuarios').child(nickname);
    userRef.set({
      'correo': correo,
      'nickname': nickname,
      'contrasenia': contrasenia,
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _correoController,
            decoration: const InputDecoration(
              hintText: 'Ingrese su Gmail',
              fillColor: Colors.grey,
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _nicknameController,
            decoration: const InputDecoration(
              hintText: 'Ingrese su Nickname',
              fillColor: Colors.grey,
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _contraseniaController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Ingrese Contraseña',
              fillColor: Colors.grey,
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {_registrarUsuario(context);
            registro(context);} ,
            child: const Text('Registrarse'),
          ),
        ],
      ),
    );
  }
}
final TextEditingController _correoController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();
 Future<void> registro(context) async {
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _correoController.text,
    password: _contraseniaController.text,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}

 