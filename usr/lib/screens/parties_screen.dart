import 'package:flutter/material.dart';
import '../l10n/app_translations.dart';
import '../providers.dart';

class PartiesScreen extends StatelessWidget {
  const PartiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = appState.langCode;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.get('customers_suppliers', lang)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: AppTranslations.get('search', lang),
                      prefixIcon: const Icon(Icons.search),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: Text(AppTranslations.get('add_new', lang)),
                )
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Text(AppTranslations.get('empty_data', lang)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
