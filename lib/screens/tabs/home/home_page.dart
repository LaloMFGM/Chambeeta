import 'dart:developer';

import 'package:chambeeta/models/constants.dart';
import 'package:chambeeta/database/db_config.dart';
import 'package:chambeeta/models/interfaces/createOffer.dart';
import 'package:chambeeta/models/interfaces/getOffers.dart';
import 'package:chambeeta/models/interfaces/login.dart';
import 'package:chambeeta/models/shared_preference.dart';
import 'package:chambeeta/services/createOffer_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<GetOffer?> offers = [];
  Login? data;

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.23;

    return FutureBuilder(
      future: Future.wait([getUserdata(), getOffers()]),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar las ofertas'));
        } else if (snapshot.hasData) {
          if (offers.isEmpty) {
            offers = snapshot.data![1];
          }

          data ??= snapshot.data![0];

          if (data == null || offers.isEmpty) {
            return Scaffold(
                body: Center(
                    child: Text(
                        'Error al cargar las ofertas : ${data?.username}')));
          } else {
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    height: containerHeight,
                    padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
                    decoration: const BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ), // Bordes redondeados de 40
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                logout();
                              },
                              child: const Text('Cerrar Sesión',
                                  style: TextStyle(
                                      color: darkColor, fontSize: 12)),
                            )
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(userImg),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //Cargar información de usuario logeado
                                      Text(
                                        '${data?.username}',
                                        style: TextStyle(fontSize: 18),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(
                              10), // Padding interno del TextField
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () async {
                              List<GetOffer?> data =
                                  await searchOffers(searchController.text);
                              setState(() {
                                offers = data;
                                log('Offers: $offers');
                              });
                            },
                          ),
                          prefixIcon: Icon(Icons.work),
                          hintText: 'Buscar...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Trabajos Recientes',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),

                  // Esto se cambiara por un for que recorra la lista de trabajos recientes y
                  // cree un card por cada uno, en caso de que se busque un trabajo en especifico
                  // se mostrara solo los trabajos que coincidan con la busqueda

                  Expanded(
                    child: ListView.builder(
                        itemCount: offers.length,
                        itemBuilder: (BuildContext context, int index) {
                          final offer = offers[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    4.0, 0.0, 4.0, 2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person, size: 50),
                                        SizedBox(width: 10),
                                        Text('${offer?.title}',
                                            style: TextStyle(fontSize: 20)),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${offer?.description}',
                                              style: TextStyle(fontSize: 20)),
                                          Text(
                                              'Requisitos: ${offer?.requirements}'),
                                          Text(
                                              'Salario: \$ ${offer?.salary.toStringAsFixed(2)}'),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          postulateOffer(offer!.id);
                                        },
                                        child: const Text('Postularme',
                                            style: TextStyle(color: darkColor)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          }
        } else {
          return const Center(child: Text('Error al cargar las ofertas'));
        }
      },
    );
  }

  Future<Login?> getUserdata() async {
    Login? user = await UserSharedPreferences().loadUserInfo();
    return user;
  }

  Future<List<GetOffer?>> getOffers() async {
    List<GetOffer?> offers = await CreateOfferService().getAllOffers();
    return offers;
  }

  Future<List<GetOffer?>> searchOffers(String job) async {
    List<GetOffer?> offers = await CreateOfferService().searchOffers(job);
    return offers;
  }

  Future<void> postulateOffer(int offerId) async {
    
    log('Postulando a la oferta $offerId');

  }


  void logout() async {
    await UserSharedPreferences().removeUserInfo();
    Navigator.pushNamed(context, 'login');
  }
}
