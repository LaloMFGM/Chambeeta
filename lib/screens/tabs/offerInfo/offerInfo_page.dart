import 'package:chambeeta/models/constants.dart';
import 'package:flutter/material.dart';

class OfferInfo extends StatefulWidget {
  const OfferInfo({super.key});

  @override
  State<OfferInfo> createState() => _OfferInfoState();
}

class _OfferInfoState extends State<OfferInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Información de Oferta'),
          backgroundColor: accentColor,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                    const Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Text(
                        'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          // Acción a realizar
                        },
                        child: const Text('Postularme a esta oferta'),
                      ),
                    )
                  ]
              ),
            )
          ]),
        ));
  }
}
