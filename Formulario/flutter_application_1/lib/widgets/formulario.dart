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
    return Container(
      child: Form(
          key: _formularioEstado,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: TextFormField(
                    validator: (value) {
                      if (!value!.contains("@miempresa.com")) {
                        return "El correo no es valido";
                      }
                      return null; // todo salio bien
                    },
                    decoration: const InputDecoration(
                        hintText: "correo electronio",
                        border: InputBorder.none),
                  )),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.length < 6) {
                        return "La contraseña debe tener almenos 6 caracteres";
                      }
                      return null; // todo salio bien
                    },
                    decoration: const InputDecoration(
                        hintText: "Ingrese la contraseña",
                        border: InputBorder.none),
                  )),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formularioEstado.currentState!.validate()) {
                        // realizamos el resto del proceso
                        print("CORRECTO");
                      } else {
                        print("Hay un error");
                      }
                    },
                    child: Text("Enviar")),
              )
            ],
          )),
    );
  }
}
