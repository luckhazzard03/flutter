import 'dart:math';
import 'package:flutter/material.dart';

class BatmanPage extends StatefulWidget {
  @override
  _BatmanPageState createState() => _BatmanPageState();
}

class _BatmanPageState extends State<BatmanPage> {
  final TextEditingController _controller = TextEditingController();
  final int _randomNumber = Random().nextInt(100) + 1;
  int _attempts = 0;
  String _message =
      'Hola, soy Batman. He pensado un número del 1 al 100 y te reto a que adivines en menos de 10 intentos.';

  void _checkGuess() {
    setState(() {
      _attempts++;
      int guess = int.parse(_controller.text);

      if (_attempts >= 10) {
        _message =
            '¡No has adivinado el número en 10 intentos! El número era $_randomNumber.';
      } else if (guess == _randomNumber) {
        _message =
            '¡Felicitaciones! Has adivinado el número $_randomNumber en $_attempts intentos.';
      } else if (guess < _randomNumber) {
        _message = 'El número es mayor que $guess. Intenta de nuevo.';
      } else {
        _message = 'El número es menor que $guess. Intenta de nuevo.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Batman Game',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 58, 63, 73),
      ),
      backgroundColor: Color.fromARGB(255, 255, 196, 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/batman.jpg'),
              radius: 100, // Ajusta el radio para cambiar el tamaño
            ),
            SizedBox(height: 20),
            Text(
              _message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Card(
              color: const Color.fromARGB(
                  255, 58, 62, 70), // Cambia el color del Card
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Intentos: $_attempts',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white), // Cambia el color
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Cual es el número?'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkGuess,
              child: Text('Adivina'),
            ),
          ],
        ),
      ),
    );
  }
}
