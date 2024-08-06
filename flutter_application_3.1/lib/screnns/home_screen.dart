import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/formulario.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'FORMULARIO DE VALIDACIÓN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 58, 63, 73),
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 124, 207, 255), // Color de fondo para la pantalla completa
        child: const Formulario(),
      ),
    );
  }
}
