import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formularioEstado = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding:
            const EdgeInsets.all(16.0), // Añade padding al contenedor principal
        child: Form(
          key: _formularioEstado,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centrar verticalmente
            children: [
              SizedBox(
                width: 400, // Ajustar el ancho del Card
                child: Card(
                  color: Colors.blue[50],
                  elevation: 5, // Añadir elevación a la tarjeta
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (!value!.contains("@miempresa.com")) {
                          return "El correo no es válido";
                        }
                        return null; // Todo salió bien
                      },
                      decoration: const InputDecoration(
                        hintText: "Correo electrónico",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16), // Espacio entre las tarjetas
              SizedBox(
                width: 400, // Ajustar el ancho del Card
                child: Card(
                  color: Colors.blue[50],
                  elevation: 5, // Añadir elevación a la tarjeta
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value!.length < 6) {
                          return "La contraseña debe tener al menos 6 caracteres";
                        }
                        return null; // Todo salió bien
                      },
                      decoration: const InputDecoration(
                        hintText: "Ingrese la contraseña",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height: 16), // Espacio entre las tarjetas y el botón
              SizedBox(
                width: 100, // Ajustar el ancho del botón
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5, // Añadir elevación al botón
                  ),
                  onPressed: () {
                    if (_formularioEstado.currentState!.validate()) {
                      // Realizamos el resto del proceso
                      print("CORRECTO");
                    } else {
                      print("Hay un error");
                    }
                  },
                  child: const Text("Enviar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
