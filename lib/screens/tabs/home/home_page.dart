import 'package:chambeeta/constants.dart';
import 'package:chambeeta/database/db_config.dart';
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
      body: Column(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ), // Bordes redondeados de 40
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(userImg),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Cargar información de usuario logeado
                      Text(
                        'Eduardo Mahonri Fabian Guerrero',
                        style: TextStyle(fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Senior Developer in Flutter',
                        style: TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return ['Opción 1', 'Cerrar Sesión'].map((String choice) {
                      return PopupMenuItem(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                  onSelected: (String choice) {
                    if (choice == 'Opción 1') {
                      // Ejecutar una acción para la opción 1
                    } else if (choice == 'Cerrar Sesión') {
                      Navigator.pushNamed(context, 'login');
                      // Ejecutar una acción para cerrar sesión
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.all(10), // Padding interno del TextField
                  suffixIcon: Icon(Icons.search),
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
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person, size: 50),
                              SizedBox(width: 10),
                              Text('Maria', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Cocinar una cena',
                                    style: TextStyle(fontSize: 20)),
                                Text('texto texto texto texto'),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Postularme',
                                  style: TextStyle(color: darkColor)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person, size: 50),
                              SizedBox(width: 10),
                              Text('Maria', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Limpiar un jardín',
                                    style: TextStyle(fontSize: 20)),
                                Text('texto texto texto texto'),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Postularme',
                                  style: TextStyle(color: darkColor)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person, size: 50),
                              SizedBox(width: 10),
                              Text('Maria', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Pintar una pared',
                                    style: TextStyle(fontSize: 20)),
                                Text('texto texto texto texto'),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Postularme',
                                  style: TextStyle(color: darkColor)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
