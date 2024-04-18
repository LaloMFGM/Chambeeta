import 'package:chambeeta/constants.dart';
import 'package:flutter/material.dart';
import 'package:chambeeta/screens/screens.dart'
    show HomePage, Jobs, UserSettings;

class DashboardMenu extends StatefulWidget {
  const DashboardMenu({super.key});

  @override
  State<DashboardMenu> createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<DashboardMenu> {
  int selectedIndex = 0;
  List<String> namepage = [
    'Inicio',
    'Trabajos',
    'Configuración',
  ];

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      //Verificar que si se utilizan cambios como actualizaciones de estado, no se utilice const
      const HomePage(),
      const Jobs(),
      const UserSettings()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: pages.elementAt(_getSelectIndex()),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(iconHome),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(iconJobs),
                label: 'Trabajos',
              ),
              BottomNavigationBarItem(
                icon: Icon(iconProfile),
                label: 'Perfil',
              )
              
            ],
            currentIndex: selectedIndex,
            onTap: changeTab));
  }

  void changeTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int _getSelectIndex() {
    return selectedIndex <= 3 && selectedIndex >= 0 ? selectedIndex : 0;
  }
}
