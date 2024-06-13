import 'package:flutter/material.dart';

void main() {
  runApp(Historial());
}

class Historial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HistorialScreen(),
    );
  }
}

class HistorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: ListView(
        children: [
          Transaccion(
            monto: 30,
            tipo: 'Retiro',
            saldo: 450,
          ),
          Divider(),
          Transaccion(
            monto: 20,
            tipo: 'Compra',
            saldo: 430,
          ),
          Divider(),
          Transaccion(
            monto: 50,
            tipo: 'Depósito',
            saldo: 480,
          ),
        ],
      ),
    );
  }
}

class Transaccion extends StatelessWidget {
  double monto;
  String tipo;
  double saldo;

  Transaccion({
    required this.monto,
    required this.tipo,
    required this.saldo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(tipo[0]),
      ),
      title: Text('Monto: \$${monto.toString()}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tipo: $tipo'),
          Text('Saldo: \$${saldo.toString()}'),
        ],
      ),
    );
  }
}
