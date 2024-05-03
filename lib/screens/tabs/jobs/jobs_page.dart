
import 'package:chambeeta/constants.dart';
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
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
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
                              Text('Trabajo', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          const Text(
                            'texto',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                
                                onPressed: () {
                                  
                                },
                                style: ElevatedButton.styleFrom(
                                backgroundColor: accentColor,
                                ),
                                child: const Text(
                                  'Editar',
                                  style: TextStyle(color: Colors.white),
                                  ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  
                                },
                                style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                ),
                                child: const Text(
                                  'Borrar',
                                  style: TextStyle(color: Colors.red),
                                  ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                              Text('Trabajo', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          const Text(
                            'texto',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  
                                },
                                style: ElevatedButton.styleFrom(
                                backgroundColor: accentColor,
                                ),
                                child: const Text(
                                  'Editar',
                                  style: TextStyle(color: Colors.white),
                                  ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  
                                },
                                style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                ),
                                child: const Text(
                                'Borrar',
                                style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                              Text('Trabajo', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          const Text(
                            'texto',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  
                                },
                                style: ElevatedButton.styleFrom(
                                backgroundColor: accentColor,
                                ),
                                child: const Text(
                                  'Editar',
                                  style: TextStyle(color: Colors.white),
                                  ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  
                                },
                                style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                ),
                                child: const Text(
                                  'Borrar',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}