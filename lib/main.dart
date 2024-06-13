import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:prueba_02/screens/Registro.dart';
import 'package:prueba_02/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp();
  runApp(Prueba02());
}

class Prueba02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final String studentName = "David Chicaiza";
  final String githubUsername = "Daxel20";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            "https://c4.wallpaperflare.com/wallpaper/760/459/710/aoi-ogata-anime-girls-wallpaper-preview.jpg",
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  studentName,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  githubUsername,
                  style: TextStyle(color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text("Ir a Login"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
