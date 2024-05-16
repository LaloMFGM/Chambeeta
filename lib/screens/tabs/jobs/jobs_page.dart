import 'package:chambeeta/models/constants.dart';
import 'package:flutter/material.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ), // Bordes redondeados de 40
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Cargar información de usuario logeado
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Ofertas Laborales',
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.work, size: 50),
                              SizedBox(width: 10),
                              Text('Pasear Perro',
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Column(children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  'Pasear a un pastor alemán de 2 años de edad'),
                            ),
                          ]),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  const Text('Status: Ok'),
                                  const Text('Fecha: 12/12/2021'),
                                ],
                              )),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, 'offer_info');
                                          },
                                          child: const Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text('Ver Detalles'),
                                          ),
                                        )),
                                    const SizedBox(height: 10),
                                    Container(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text('Finalizar Trabajo'),
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
