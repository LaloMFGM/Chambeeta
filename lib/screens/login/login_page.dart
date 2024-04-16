import 'dart:developer';

import 'package:chambeeta/constants.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    bool portrait = screenheight > screenwidth;

    log('portrait: $portrait');

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              
              image: DecorationImage(
                image: AssetImage(portrait ? bgportrait : bglandscape ), // Cambia la ruta por la de tu imagen
                fit: BoxFit.cover,
              ),
            ),
            //el singlechild sirve para que cuando salga el teclado pueda verse donde estas escribiendo
            child: SingleChildScrollView(
              child: SizedBox(
                width: screenwidth,
                height: screenheight,
                child: Row(
                  children: [
                    Column(
                      children: [],
                    )
                  ]
                  ),
              ),
            )));
    // backgroundColor: backgroundColor,
    // body: Column(children: [
    //   Container(
    //     height: 210,
    //     alignment: Alignment.center,
    //     padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
    //     decoration: const BoxDecoration(
    //       color: accentColor,
    //       borderRadius: BorderRadius.only(
    //         bottomLeft: Radius.circular(90),
    //         bottomRight: Radius.circular(90),
    //       ),
    //     ),
    //     child: const Row(children: [
    //       Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(
    //             "Chambeeta",
    //             style: TextStyle(
    //               fontSize: 40,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.white
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],),
    //   ),
    //   Container(
    //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    //     child: TextField(
    //       decoration: InputDecoration(
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(90.0),
    //           ),
    //         labelText: 'Email',
    //       ),
    //     ),
    //   ),
    //   Container(
    //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    //     child: TextField(
    //       obscureText: true,
    //       decoration: InputDecoration(
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(90.0),
    //         ),
    //         labelText: 'Password',
    //       ),
    //     ),
    //   ),
    //   Container(
    //     height: 80,
    //     width: 300,
    //     padding: const EdgeInsets.all(20),
    //     child: ElevatedButton(
    //       style: ElevatedButton.styleFrom(
    //         backgroundColor: accentColor,
    //         foregroundColor: backgroundColor,
    //         minimumSize: const Size.fromHeight(50),
    //       ),
    //     child: const Text('Log In'),
    //       onPressed: () {},
    //   )),
    // ],)
    // );
  }
}
