import 'package:flutter/material.dart';
import 'calculator_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Esto quita la etiqueta de "debug"
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ingreso exitoso'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CalculatorPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, ingresa usuario y contraseña'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('lib/img/ciudad2.jpg'), // Ruta de la imagen
            fit: BoxFit.cover, // Ajusta la imagen para que cubra todo el fondo
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors
                      .white), // Cambié el color del texto para mayor visibilidad
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Usuario',
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.8), // Fondo semitransparente
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true, // Encripta el texto
              decoration: InputDecoration(
                labelText: 'Contraseña',
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.8), // Fondo semitransparente
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _login,
              child: Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
