import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    this.onSearch,
    this.onProfileTap,
    this.hintText = 'Buscar...',
  });

  final Function(String)? onSearch;
  final VoidCallback? onProfileTap;
  final String hintText;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  late SearchController controller;

  @override
  void initState() {
    super.initState();
    controller = SearchController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          if (theme.brightness == Brightness.light)
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: SafeArea(
        child: SearchAnchor(
          builder: (context, controller) {
            return SearchBar(
              controller: controller,
              padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 8.0),
              ),
              onTap: () {
                controller.openView();
              },
              onChanged: (value) {
                widget.onSearch?.call(value);
                controller.openView();
              },
              leading: Icon(
                Icons.search_rounded,
                color: colorScheme.onSurfaceVariant,
                size: 22,
              ),
              trailing: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: widget.onProfileTap,
                      customBorder: const CircleBorder(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color:
                              colorScheme.secondaryContainer.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person_rounded,
                          size: 20,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              hintText: widget.hintText,
              hintStyle: WidgetStatePropertyAll(
                theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              textStyle: WidgetStatePropertyAll(
                theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              backgroundColor: WidgetStatePropertyAll(
                colorScheme.surfaceVariant.withOpacity(0.5),
              ),
              elevation: const WidgetStatePropertyAll(0),
              constraints: const BoxConstraints(
                minHeight: 52,
                maxHeight: 52,
              ),
            );
          },
          suggestionsBuilder: (context, controller) {
            return List<ListTile>.generate(5, (index) {
              final item = 'Sugerencia $index';
              return ListTile(
                leading: const Icon(Icons.search),
                title: Text(item),
                onTap: () {
                  widget.onSearch?.call(item);
                  controller.closeView(item);
                },
              );
            });
          },
        ),
      ),
    );
  }
}
