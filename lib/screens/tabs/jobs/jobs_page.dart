import 'package:chambeeta/models/constants.dart';
import 'package:chambeeta/models/interfaces/getJobs.dart';
import 'package:chambeeta/models/interfaces/getOffers.dart';
import 'package:chambeeta/services/createOffer_service.dart';
import 'package:flutter/material.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {

  List<GetJobs?> jobs = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([getJobs()]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar las ofertas'));
        } else if (snapshot.hasData) {
          jobs = snapshot.data![0];

          if (jobs.isEmpty) {
            return Scaffold(
                body: Column(children: [
              Container(
                height: 120,
                padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
                decoration: const BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
              const Expanded(
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                    SizedBox(height: 20),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            Icon(Icons.work, size: 50),
                            Text('No hay ofertas laborales')
                          ],
                        )),
                  ])))
            ]));

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
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                    child: ListView.builder(
                      itemCount: jobs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final job = jobs[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                      Text(
                                          '${job?.jobs.title}',
                                          style: const TextStyle(fontSize: 20)),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text('Descripción: ${job?.jobs.description}'),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Requisitos: ${job?.jobs.requirements}'),
                                            Text('Salario: ${job?.jobs.salary}'),
                                            Text(
                                                'Ubicación: ${job?.jobs.location}'),
                                            
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, 'offer_info', arguments: job?.jobs.id);

                                                },
                                                child: const Align(
                                                  alignment: Alignment.center,
                                                  child: Text('Ver Detalles'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            SizedBox(
                                              width: 200,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: const Align(
                                                  alignment: Alignment.center,
                                                  child:
                                                      Text('Finalizar Trabajo'),
                                                ),
                                              ),
                                            ),
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
               
                ],
              ),
            );
          }
        } else {
          return const Center(child: Text('No hay ofertas'));
        }
      },
    );
  }

  Future<List<GetJobs?>> getJobs() async {
    List<GetJobs?> jobs = await CreateOfferService().getJobs();
    return jobs;
  }

}
