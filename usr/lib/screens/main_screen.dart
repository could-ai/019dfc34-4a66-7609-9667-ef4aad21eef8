import 'package:flutter/material.dart';
import '../l10n/app_translations.dart';
import '../providers.dart';
import 'dashboard_content.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final lang = appState.langCode;
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    final List<Map<String, dynamic>> menuItems = [
      {'title': 'home', 'icon': Icons.dashboard, 'route': '/'},
      {'title': 'items', 'icon': Icons.inventory_2, 'route': '/items'},
      {'title': 'receipts', 'icon': Icons.download_rounded, 'route': '/receipts'},
      {'title': 'issues', 'icon': Icons.upload_rounded, 'route': '/issues'},
      {'title': 'customers_suppliers', 'icon': Icons.people, 'route': '/parties'},
      {'title': 'reports', 'icon': Icons.bar_chart, 'route': '/reports'},
    ];

    Widget buildMenu() {
      return ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.storefront, size: 48),
                const SizedBox(height: 8),
                Text(
                  AppTranslations.get('app_title', lang),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          ...menuItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return ListTile(
              leading: Icon(item['icon']),
              title: Text(AppTranslations.get(item['title'], lang)),
              selected: _selectedIndex == index,
              onTap: () {
                if (!isDesktop) {
                  Navigator.pop(context); // Close drawer
                }
                if (index == 0) {
                  setState(() {
                    _selectedIndex = index;
                  });
                } else {
                  Navigator.pushNamed(context, item['route']);
                }
              },
            );
          }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(AppTranslations.get('change_language', lang)),
            onTap: () {
              appState.toggleLanguage();
            },
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: Text(AppTranslations.get('change_theme', lang)),
            onTap: () {
              appState.toggleTheme();
            },
          ),
        ],
      );
    }

    return Scaffold(
      appBar: isDesktop
          ? null
          : AppBar(
              title: Text(AppTranslations.get('app_title', lang)),
            ),
      drawer: isDesktop ? null : Drawer(child: buildMenu()),
      body: Row(
        children: [
          if (isDesktop)
            SizedBox(
              width: 250,
              child: Drawer(
                elevation: 0,
                child: buildMenu(),
              ),
            ),
          if (isDesktop) const VerticalDivider(width: 1, thickness: 1),
          const Expanded(
            child: DashboardContent(),
          ),
        ],
      ),
    );
  }
}
