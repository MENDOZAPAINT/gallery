import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart';
import '../widgets/search_app_bar.dart';
import '../../routes/app_routes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    this.title = 'Galeria de imagenes',
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 3) {
      // Índice del ítem Usuario
      Navigator.pushNamed(context, AppRoutes.user);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _handleSearch(String query) {
    debugPrint('Buscando: $query');
  }

  void _handleProfileTap() {
    Navigator.pushNamed(context, AppRoutes.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        hintText: 'Buscar contenido...',
        onSearch: _handleSearch,
        onProfileTap: _handleProfileTap,
      ),
      body: Center(
        child: Text('Contenido de la página $_selectedIndex'),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        height: 70,
        indicatorColor: Theme.of(context).colorScheme.primaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
    );
  }
}
