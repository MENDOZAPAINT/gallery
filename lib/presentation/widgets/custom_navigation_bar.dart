import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.destinations = defaultDestinations,
    this.height = 65,
    this.backgroundColor,
    this.indicatorColor,
    this.indicatorShape,
    this.elevation,
    this.labelBehavior = NavigationDestinationLabelBehavior.alwaysShow,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<NavigationDestinationData> destinations;
  final double height;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final ShapeBorder? indicatorShape;
  final double? elevation;
  final NavigationDestinationLabelBehavior labelBehavior;

  static const List<NavigationDestinationData> defaultDestinations = [
    NavigationDestinationData(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
      label: 'Inicio',
      tooltip: 'Ir a inicio',
    ),
    NavigationDestinationData(
      icon: Icons.explore_outlined,
      selectedIcon: Icons.explore_rounded,
      label: 'Explorar',
      tooltip: 'Explorar contenido',
    ),
    NavigationDestinationData(
      icon: Icons.favorite_outline_rounded,
      selectedIcon: Icons.favorite_rounded,
      label: 'Favoritos',
      tooltip: 'Tus favoritos',
    ),
    NavigationDestinationData(
      icon: Icons.account_circle_outlined,
      selectedIcon: Icons.account_circle_rounded,
      label: 'Usuario',
      tooltip: 'Tu cuenta',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return NavigationBar(
      height: height,
      backgroundColor: backgroundColor ?? theme.colorScheme.surface,
      indicatorColor: indicatorColor ?? theme.colorScheme.secondaryContainer,
      indicatorShape: indicatorShape ?? const StadiumBorder(),
      elevation: elevation,
      labelBehavior: labelBehavior,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: destinations.map((d) {
        return NavigationDestination(
          icon: Icon(
            d.icon,
            size: 24,
          ),
          selectedIcon: Icon(
            d.selectedIcon,
            size: 24,
          ),
          label: d.label,
          tooltip: d.tooltip,
        );
      }).toList(),
    );
  }
}

class NavigationDestinationData {
  const NavigationDestinationData({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.tooltip,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final String? tooltip;
}
