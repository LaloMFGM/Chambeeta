import 'dart:developer';

import 'package:chambeeta/models/constants.dart';
import 'package:chambeeta/services/createOffer_service.dart';
import 'package:chambeeta/models/interfaces/createOffer.dart';
import 'package:flutter/material.dart';

class CreateOffer extends StatefulWidget {
  const CreateOffer({super.key});

  @override
  State<CreateOffer> createState() => _CreateOfferState();
}

class _CreateOfferState extends State<CreateOffer> {
  final TextEditingController _nameOffer = TextEditingController();
  final TextEditingController _descriptionOffer = TextEditingController();
  final TextEditingController _salaryOffer = TextEditingController();
  final TextEditingController _requirementsOffer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agregar Oferta Laboral'),
          backgroundColor: accentColor,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextField(
                controller: _nameOffer,
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
                controller: _descriptionOffer,
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
                controller: _salaryOffer,
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
                controller: _requirementsOffer,
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
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: ElevatedButton(
                onPressed: () async {
                  bool status = await createOffer();
                  if (status) {
                    Navigator.pop(context);
                    showAboutDialog(context: context, children: const [
                      Text('Oferta creada con éxito')
                    ]);
                  }else{
                    showAboutDialog(context: context, children: const [
                      Text('Error al crear la oferta')
                    ]);
                  }
                },
                child: const Text('Agregar Oferta'),
              ),
            )
          ],
        )));
  }

  Future<bool> createOffer() async {
    bool result = false;

    final String nameOffer = _nameOffer.text;
    final String descriptionOffer = _descriptionOffer.text;
    final String salaryOffer = _salaryOffer.text;
    final String requirementsOffer = _requirementsOffer.text;

    if (nameOffer.isEmpty ||
        descriptionOffer.isEmpty ||
        salaryOffer.isEmpty ||
        requirementsOffer.isEmpty) {
      log('Todos los campos son requeridos');
      return false;
    } else {
      result = await CreateOfferService().createOffer(CreateOffers(
          title: nameOffer,
          description: descriptionOffer,
          salary: int.parse(salaryOffer),
          requirements: requirementsOffer,
          location: 'Lima'));

      return result;
    }
  }
}
