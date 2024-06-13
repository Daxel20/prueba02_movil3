import 'package:flutter/material.dart';
import 'package:prueba_02/screens/Historial.dart';

void main() {
  runApp(Cuenta());
}

class Cuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CuentaScreen(),
    );
  }
}

class CuentaScreen extends StatelessWidget {
  final String imageUrl =
      "https://th.bing.com/th/id/R.a69e7e8f62a7410d57a19b74c7a43644?rik=ZyvQN437cofFVg&pid=ImgRaw&r=0";
  final String accountNumber = "1234567890";
  final double accountValue = 1000.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuenta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              'Número de cuenta: $accountNumber',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Valor total de la cuenta: \$${accountValue.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Historial()),
                );
              },
              child: Text('Ir a Historial'),
            ),
          ],
        ),
      ),
    );
  }
}

