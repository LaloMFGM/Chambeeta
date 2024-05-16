import 'package:chambeeta/models/constants.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  
  TextEditingController _userAddressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _skillsController = TextEditingController();
  
  
  bool isEditing = false;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.25;
    double avatarRadius = MediaQuery.of(context).size.width * 0.25;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: containerHeight,
                color: accentColor,
              ),
              Positioned(
                top: containerHeight - avatarRadius,
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: const AssetImage(userImg),
                ),
              ),
              Positioned(
                top: 25,
                right: 0,
                child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isEditing
                              ? ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isEditing = false;
                                    });
                                  },
                                  child: Text('Guardar'),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isEditing = true;
                                    });
                                  },
                                  child: const Text('Editar Perfil'),
                                ),
                        ])),
              ),
            ],
          ),
          SizedBox(height: avatarRadius * 7 / 6),
          Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Lalo MFGM',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Calificación : 4.5',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(width: 5), // Espacio entre el icono y el texto
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                ],
              ),
              const SizedBox(
                  height:
                      10), // Espacio entre la información del usuario y los botones

              const SizedBox(height: 10), // Espacio entre los botones
              isEditing
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: TextField(
                            controller: _userAddressController,
                            decoration: InputDecoration(
                              labelText: 'Dirección',
                              labelStyle: TextStyle(color: darkColor),
                              hintStyle: TextStyle(color: darkColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: darkColor, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: darkColor, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal:
                                      20), // Ajustar el tamaño del TextField
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: TextField(
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                              labelText: '# de Teléfono',
                              labelStyle: TextStyle(color: darkColor),
                              hintStyle: TextStyle(color: darkColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: darkColor, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: darkColor, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal:
                                      20), // Ajustar el tamaño del TextField
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: TextField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              labelText: 'Nombre',
                              labelStyle: TextStyle(color: darkColor),
                              hintStyle: TextStyle(color: darkColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: darkColor, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: darkColor, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal:
                                      20), // Ajustar el tamaño del TextField
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: TextField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              labelText: 'Apellido',
                              labelStyle: TextStyle(color: darkColor),
                              hintStyle: TextStyle(color: darkColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: darkColor, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: darkColor, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal:
                                      20), // Ajustar el tamaño del TextField
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                _selectedDate = pickedDate;
                              });
                            }
                          },
                          child: AbsorbPointer(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                              child: TextField(
                                  controller: TextEditingController(
                                      text: _selectedDate != null
                                          ? '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}'
                                          : ''),
                                  decoration: InputDecoration(
                                    labelText: 'Fecha de Nacimiento',
                                    labelStyle: TextStyle(color: darkColor),
                                    hintStyle: TextStyle(color: darkColor),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: darkColor, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: darkColor, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal:
                                            20), // Ajustar el tamaño del TextField
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: TextField(
                            controller: _skillsController,
                            maxLines: 7,
                            decoration: InputDecoration(
                              labelText: 'Habilidades y Experiencia',
                              labelStyle: TextStyle(color: darkColor),
                              hintStyle: TextStyle(color: darkColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: darkColor, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: darkColor, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 40,
                                  horizontal:
                                      20), // Ajustar el tamaño del TextField
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nombre: Lalo MFGM',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Correo electrónico: correo@example.com',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        // Otros widgets de texto no editables
                      ],
                    ),
            ],
          ),
        ],
      ),
    ));
  }
}
