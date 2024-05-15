import 'package:chambeeta/constants.dart';
import 'package:flutter/material.dart';

class CreateOffer extends StatefulWidget {
  const CreateOffer({super.key});

  @override
  State<CreateOffer> createState() => _CreateOfferState();
}

class _CreateOfferState extends State<CreateOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agregar Oferta Laboral'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre de la Oferta',
                  labelStyle: TextStyle(color: darkColor),
                  hintStyle: TextStyle(color: darkColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: darkColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: darkColor, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20), // Ajustar el tamaño del TextField
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Descripción de la Oferta',
                  labelStyle: TextStyle(color: darkColor),
                  hintStyle: TextStyle(color: darkColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: darkColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: darkColor, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20), // Ajustar el tamaño del TextField
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Salario',
                  labelStyle: TextStyle(color: darkColor),
                  hintStyle: TextStyle(color: darkColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: darkColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: darkColor, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20), // Ajustar el tamaño del TextField
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Requisitos de la Oferta',
                  labelStyle: TextStyle(color: darkColor),
                  hintStyle: TextStyle(color: darkColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: darkColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: darkColor, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20), // Ajustar el tamaño del TextField
                ),
              ),
            ),
          ],
        )));
  }
}
