import 'package:flutter/material.dart';

class HomePrincipal extends StatefulWidget {
  const HomePrincipal({super.key});

  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("Datos Personales",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        backgroundColor: const Color.fromARGB(255, 7, 94, 255),
      ),
      body: Container(
        color: Color.fromARGB(255, 253, 207,
            0), // Color de fondo amarillo para el cuerpo completo
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/mascota.jpg', // Ruta de la imagen
              width: 700.0, // Ancho opcional de la imagen
              height: 250.0, // Alto opcional de la imagen
            ),
            SizedBox(height: 20.0), // Espacio entre la imagen y las tarjetas
            Card(
              child: Container(
                height: 50.0, // Altura de la tarjeta
                child: Center(
                  child: ListTile
                  
                  (
                    title: Text('Sandra'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0), // Espacio entre las tarjetas
            Card(
              child: Container(
                height: 50.0, // Altura de la tarjeta
                child: Center(
                  child: ListTile(
                    title: Text('Milena'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0), // Espacio entre las tarjetas y el avatar
            CircleAvatar(
              radius: 50.0, // Radio del avatar circular
              backgroundImage:
                  AssetImage('assets/images/mascota.jpg'), // Ruta de la imagen
            ),
            // Añade más widgets según sea necesario
          ],
        ),
      ),
    );
  }
}
