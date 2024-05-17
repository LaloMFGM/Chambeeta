import 'package:chambeeta/models/constants.dart';
import 'package:chambeeta/models/interfaces/getJobs.dart';
import 'package:chambeeta/services/createOffer_service.dart';
import 'package:flutter/material.dart';

class OfferInfo extends StatefulWidget {
  const OfferInfo({super.key});

  @override
  State<OfferInfo> createState() => _OfferInfoState();
}

class _OfferInfoState extends State<OfferInfo> {
  GetJobs? jobs = GetJobs(
    id: -1,
    jobsId: 0,
    dateCompleted: DateTime.now(),
    statusJobId: 0,
    jobs: Jobs(
      id: 0,
      title: "",
      description: "",
      requirements: "",
      salary: 0.0,
      location: "",
      userId: 0,
      statusJobId: 0,
      user: User(id: 0, userName: "", qualification: 0.0),
      statusJob: "",
    ),
  );

  @override
  Widget build(BuildContext context) {
    final int jobId = ModalRoute.of(context)!.settings.arguments as int;

    return FutureBuilder(
      future: getJobs(jobId),
      builder: (BuildContext context, AsyncSnapshot<GetJobs?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar las ofertas'));
        } else if (snapshot.hasData) {
          jobs = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Información del trabajo'),
              backgroundColor: accentColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: jobs?.id == -1
                  ? const Center(
                      child: Text(
                        'No hay información disponible',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trabajo: ${jobs!.jobs.title}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Descripción: ${jobs!.jobs.description}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Requisitos: ${jobs!.jobs.requirements}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Salario: ${jobs!.jobs.salary}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Ubicación: ${jobs!.jobs.location}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Información del trabajo'),
              backgroundColor: accentColor,
            ),
            body: const Center(
              child: Text(
                'No hay información disponible',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      },
    );
  }

  Future<GetJobs?> getJobs(int jobId) async {
    List<GetJobs?> jobs = await CreateOfferService().getJobs();
    return jobs.firstWhere((element) => element!.jobsId == jobId);
  }
}
