import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaz/homePrincipal.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "SENA:Ejemplo No 4",
        debugShowCheckedModeBanner: false,
        home: HomePrincipal());
  }
}
