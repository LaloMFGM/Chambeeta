import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
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
                              Icon(Icons.person, size: 50),
                              SizedBox(width: 10),
                              Text('Maria', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Pasear un perro (Golden Retriever)', style: TextStyle(fontSize: 20)),
                          const SizedBox(height: 10),
                          const Text(
                            'texto texto texto texto',
                          ),
                          ElevatedButton(
                            onPressed: () {
                              
                            },
                            child: const Text('Postularme'),
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
                              Icon(Icons.person, size: 50),
                              SizedBox(width: 10),
                              Text('Jose', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Pintar una pared', style: TextStyle(fontSize: 20)),
                          const Text(
                            'texto texto texto texto.',
                          ),
                          ElevatedButton(
                            onPressed: () {
                              
                            },
                            child: const Text('Postularme'),
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
                              Icon(Icons.person, size: 50),
                              SizedBox(width: 10),
                              Text('Gabriel', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Limpiar un jardín', style: TextStyle(fontSize: 20)),
                          const Text(
                            'texto texto texto texto',
                          ),
                          ElevatedButton(
                            onPressed: () {
                              
                            },
                            child: const Text('Postularme'),
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