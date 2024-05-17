import 'package:chambeeta/models/constants.dart';
import 'package:chambeeta/models/interfaces/getOffers.dart';
import 'package:chambeeta/models/interfaces/login.dart';
import 'package:chambeeta/services/createOffer_service.dart';
import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<GetOffer?> offers = [];
  Login? data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([getOffers()]),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las ofertas'));
          } else if (snapshot.hasData) {
            offers = snapshot.data![0];
            if (offers.isEmpty) {
              return const Center(child: Text('No hay ofertas'));
            } else {
              return Scaffold(
                body: Column(
                  children: [
                    Container(
                      height: 120,
                      padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
                      decoration: const BoxDecoration(
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
                                    'Mis Ofertas Laborales',
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
                      child: ListView.builder(
                        itemCount: offers.length,
                        itemBuilder: (BuildContext context, int index) {
                          final offer = offers[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.work, size: 50),
                                        const SizedBox(width: 10),
                                        Text('${offer?.title}',
                                            style: TextStyle(fontSize: 20)),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Column(children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            '${offer?.description}'),
                                      ),
                                    ]),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                  width: 200,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: const Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child:
                                                          Text('Ver Detalles'),
                                                    ),
                                                  )),
                                              const SizedBox(height: 10),
                                              Container(
                                                  width: 200,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: const Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Text(
                                                          'Finalizar Trabajo'),
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
                          );
                        },
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accentColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              textStyle: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, 'create_offer');
                            },
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ))
                  ],
                ),
              );
            }
          } else {
            return const Center(child: Text('No hay ofertas'));
          }
        });
  }

  Future<List<GetOffer?>> getOffers() async {
    List<GetOffer?> offers = await CreateOfferService().getMyOffers();
    return offers;
  }
}
