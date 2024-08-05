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
        title: const Text('Material app bar'),
      ),
      body: const Formulario(),
    );
  }
}
