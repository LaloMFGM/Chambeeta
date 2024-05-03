
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
                                child: const Text('Button 1'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  
                                },
                                child: const Text('Button 2'),
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
                                child: const Text('Button 1'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  
                                },
                                child: const Text('Button 2'),
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
                                child: const Text('Button 1'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  
                                },
                                child: const Text('Button 2'),
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