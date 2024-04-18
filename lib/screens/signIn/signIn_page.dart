import 'package:chambeeta/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SizedBox(
            width: screenwidth,
            height: screenheight,
            //el SingleChildScrollView sirve para que cuando salga el teclado pueda verse donde estas escribiendo
            child: SingleChildScrollView(
              child: Column(children: [
                Stack(children: [
                  Container(
                    width: screenwidth,
                    height: screenheight * 0.25,
                    decoration: const BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: Align(
                        child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                      ),
                    )),
                  ),
                ]),
                Container(
                  width: screenwidth,
                  height: screenheight * 0.7,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text('Crea tu cuenta',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      TextField(
                          decoration: InputDecoration(
                              labelText: 'Nombre de Usuario',
                              labelStyle: const TextStyle(color: darkColor),
                              hintStyle: const TextStyle(color: darkColor),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: darkColor, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ))),
                      const SizedBox(height: 20),
                      TextField(
                          decoration: InputDecoration(
                              labelText: 'Correo Electrónico',
                              labelStyle: const TextStyle(color: darkColor),
                              hintStyle: const TextStyle(color: darkColor),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: darkColor, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ))),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          labelStyle: const TextStyle(color: darkColor),
                          hintStyle: const TextStyle(color: darkColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(color: darkColor, width: 2)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: darkColor, width: 2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const Text('Cancelar'),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              //Aqui vamos a verificar que si se haya realizado el registro en caso de que no, muestra un snackbar con un mensaje
                              //Vamos a verificar si se separa la logica en 2 con un apartado visual y otro widget de logica
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Cuenta creada exitosamente')));
                              Navigator.pushNamed(context, 'login');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const Text('Crear Cuenta'),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            )));
  }
}
