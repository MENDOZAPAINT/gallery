import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text('Mi Perfil'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                onPressed: () {
                  // TODO: Implementar navegación a configuración
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Foto de perfil y nombre
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Hero(
                        tag: 'profile-picture',
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                colorScheme.primaryContainer,
                                colorScheme.primary.withOpacity(0.5),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: Border.all(
                              color: colorScheme.primary.withOpacity(0.2),
                              width: 4,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.shadow.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.person_rounded,
                            size: 65,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: colorScheme.primaryContainer,
                        child: IconButton(
                          icon: Icon(
                            Icons.edit_rounded,
                            size: 16,
                            color: colorScheme.primary,
                          ),
                          onPressed: () {
                            // TODO: Implementar edición de foto
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Usuario Demo',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'usuario@ejemplo.com',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Sección de estadísticas
                  Card(
                    elevation: 0,
                    color: colorScheme.surfaceVariant.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatItem(
                            context,
                            '250',
                            'Siguiendo',
                            Icons.people_outline_rounded,
                          ),
                          _buildDivider(context),
                          _buildStatItem(
                            context,
                            '1.2K',
                            'Seguidores',
                            Icons.favorite_outline_rounded,
                          ),
                          _buildDivider(context),
                          _buildStatItem(
                            context,
                            '35',
                            'Posts',
                            Icons.grid_view_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Lista de opciones
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: [
                        _buildOptionTile(
                          context,
                          'Editar Perfil',
                          Icons.edit_outlined,
                          onTap: () {},
                        ),
                        _buildOptionTile(
                          context,
                          'Mis Publicaciones',
                          Icons.grid_view_rounded,
                          onTap: () {},
                        ),
                        _buildOptionTile(
                          context,
                          'Guardados',
                          Icons.bookmark_border_rounded,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: [
                        _buildOptionTile(
                          context,
                          'Privacidad',
                          Icons.lock_outline_rounded,
                          onTap: () {},
                        ),
                        _buildOptionTile(
                          context,
                          'Ayuda y Soporte',
                          Icons.help_outline_rounded,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    color: colorScheme.errorContainer.withOpacity(0.1),
                    child: _buildOptionTile(
                      context,
                      'Cerrar Sesión',
                      Icons.logout_rounded,
                      isDestructive: true,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      height: 24,
      width: 1,
      color: Theme.of(context).colorScheme.outlineVariant,
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String value,
    String label,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: theme.colorScheme.primary,
          size: 22,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionTile(
    BuildContext context,
    String title,
    IconData icon, {
    VoidCallback? onTap,
    bool isDestructive = false,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: isDestructive ? colorScheme.error : colorScheme.primary,
        size: 22,
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: isDestructive ? colorScheme.error : colorScheme.onSurface,
          fontWeight: isDestructive ? FontWeight.w500 : null,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: isDestructive ? colorScheme.error : colorScheme.onSurfaceVariant,
        size: 20,
      ),
    );
  }
}
