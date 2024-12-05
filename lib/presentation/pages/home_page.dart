import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart';
import '../widgets/search_app_bar.dart';

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
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleSearch(String query) {
    // Implementar la lógica de búsqueda aquí
    debugPrint('Buscando: $query');
  }

  void _handleProfileTap() {
    // Implementar la navegación al perfil aquí
    debugPrint('Perfil tapped');
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
        destinations: const [
          NavigationDestinationData(
            icon: Icons.dashboard_outlined,
            selectedIcon: Icons.dashboard_rounded,
            label: 'Dashboard',
            tooltip: 'Ver dashboard',
          ),
          NavigationDestinationData(
            icon: Icons.explore_outlined,
            selectedIcon: Icons.explore_rounded,
            label: 'Explorar',
            tooltip: 'Explorar contenido',
          ),
          NavigationDestinationData(
            icon: Icons.notifications_outlined,
            selectedIcon: Icons.notifications_rounded,
            label: 'Notificaciones',
            tooltip: 'Ver notificaciones',
          ),
          NavigationDestinationData(
            icon: Icons.person_outline_rounded,
            selectedIcon: Icons.person_rounded,
            label: 'Perfil',
            tooltip: 'Tu perfil',
          ),
        ],
      ),
    );
  }
}
