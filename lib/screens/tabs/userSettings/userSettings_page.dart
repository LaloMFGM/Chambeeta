import 'dart:developer';

import 'package:chambeeta/models/constants.dart';
import 'package:chambeeta/models/interfaces/login.dart';
import 'package:chambeeta/models/interfaces/personalInfo.dart';
import 'package:chambeeta/models/shared_preference.dart';

import 'package:chambeeta/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  final TextEditingController _userAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();

  PersonalInfo? profile;
  // Login? user;

  bool isEditing = false;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.25;
    double avatarRadius = MediaQuery.of(context).size.width * 0.25;
    double horizontalpadding = MediaQuery.of(context).size.width * 0.05;

    return FutureBuilder(
        future: Future.wait([getUserdata(), getProfile()]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            Login? user = snapshot.data[0]!;

            if ((profile == null)) {
              profile = snapshot.data[1];
              // Login? user = snapshot.data[0]!;
              _userAddressController.text = profile!.userAddress;
              _phoneNumberController.text = profile!.phoneNumber;
              _firstNameController.text = profile!.firstName;
              _lastNameController.text = profile!.lasttName;
              _selectedDate = profile!.dateOfBirth;
              _dateOfBirthController.text =
                  DateFormat('dd-MM-yyyy').format(profile!.dateOfBirth);
              _skillsController.text = profile!.skills;
            }

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
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  isEditing
                                      ? ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              isEditing = false;
                                              updateProfile();
                                            });
                                          },
                                          child: const Text('Guardar'),
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
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${user?.username}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black45,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Calificación : 4.9',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 5), // Espacio entre el icono y el texto
                          Icon(Icons.star, color: Colors.yellow, size: 20),
                        ],
                      ),
                      const SizedBox(
                          height:
                              10), // Espacio entre la información del usuario y los botones

                      const SizedBox(height: 10), // Espacio entre los botones
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                horizontalpadding, 0, horizontalpadding, 10),
                            child: TextField(
                              enabled: isEditing,
                              controller: _userAddressController,
                              decoration: InputDecoration(
                                labelText: 'Dirección',
                                labelStyle: const TextStyle(color: darkColor),
                                hintStyle: const TextStyle(color: darkColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal:
                                        20), // Ajustar el tamaño del TextField
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: TextField(
                              enabled: isEditing,
                              controller: _phoneNumberController,
                              decoration: InputDecoration(
                                labelText: '# de Teléfono',
                                labelStyle: const TextStyle(color: darkColor),
                                hintStyle: const TextStyle(color: darkColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal:
                                        20), // Ajustar el tamaño del TextField
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: TextField(
                              enabled: isEditing,
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                labelText: 'Nombre',
                                labelStyle: const TextStyle(color: darkColor),
                                hintStyle: const TextStyle(color: darkColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal:
                                        20), // Ajustar el tamaño del TextField
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: TextField(
                              enabled: isEditing,
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                labelText: 'Apellido',
                                labelStyle: const TextStyle(color: darkColor),
                                hintStyle: const TextStyle(color: darkColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
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
                                  _dateOfBirthController.text =
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickedDate);
                                  log('Fecha de nacimiento: ${_dateOfBirthController.text}');
                                });
                              }
                            },
                            child: AbsorbPointer(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                child: TextField(
                                    enabled: isEditing,
                                    controller: _dateOfBirthController,
                                    decoration: InputDecoration(
                                      labelText: 'Fecha de Nacimiento',
                                      labelStyle:
                                          const TextStyle(color: darkColor),
                                      hintStyle:
                                          const TextStyle(color: darkColor),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: darkColor, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: darkColor, width: 2),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 10,
                                          horizontal:
                                              20), // Ajustar el tamaño del TextField
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: TextField(
                              enabled: isEditing,
                              controller: _skillsController,
                              maxLines: 7,
                              decoration: InputDecoration(
                                labelText: 'Habilidades y Experiencia',
                                labelStyle: const TextStyle(color: darkColor),
                                hintStyle: const TextStyle(color: darkColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: darkColor, width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 40,
                                    horizontal:
                                        20), // Ajustar el tamaño del TextField
                              ),
                            ),
                          ),
                        ],
                      )
                      // : Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(

                      //         'Nombre: ${profile.firstName} ${profile.lasttName}',
                      //         style: const TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       Text(
                      //         '# de Teléfono: ${profile.phoneNumber}',
                      //         style: const TextStyle(
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //       Text(
                      //         'Dirección: ${profile.userAddress}',
                      //         style: const TextStyle(
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //       Text(
                      //         'Fecha de Nacimiento: ${_selectedDate != null ? '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}' : ''}',
                      //         style: const TextStyle(
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //       Text(
                      //         'Habilidades y Experiencia: ${profile.skills}',
                      //         style: const TextStyle(
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //       // Otros widgets de texto no editables
                      //     ],
                      //   ),
                    ],
                  ),
                ],
              ),
            ));
          } else {
            return const Center(child: Text('No se encontró información'));
          }
        });
  }

  Future<Login?> getUserdata() async {
    var user = await UserSharedPreferences().loadUserInfo();
    return user;
  }

  Future<PersonalInfo> getProfile() async {
    var profile = await ProfileService().getPersonalInfo();
    return profile!;
  }

  Future<bool> updateProfile() async {
    PersonalInfo profile = PersonalInfo(
        userAddress: _userAddressController.text,
        phoneNumber: _phoneNumberController.text,
        firstName: _firstNameController.text,
        lasttName: _lastNameController.text,
        dateOfBirth: _selectedDate!,
        skills: _skillsController.text);

    bool updated = await ProfileService().updateProfile(profile);

    return updated;
  }
}
