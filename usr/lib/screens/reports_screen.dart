import 'package:flutter/material.dart';
import '../l10n/app_translations.dart';
import '../providers.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = appState.langCode;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.get('reports', lang)),
      ),
      body: Center(
        child: Text(AppTranslations.get('empty_data', lang)),
      ),
    );
  }
}
