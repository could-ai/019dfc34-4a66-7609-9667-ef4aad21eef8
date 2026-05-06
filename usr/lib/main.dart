import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'providers.dart';
import 'l10n/app_translations.dart';
import 'screens/main_screen.dart';
import 'screens/items_screen.dart';
import 'screens/receipts_screen.dart';
import 'screens/issues_screen.dart';
import 'screens/parties_screen.dart';
import 'screens/reports_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    appState.addListener(_onStateChanged);
  }

  @override
  void dispose() {
    appState.removeListener(_onStateChanged);
    super.dispose();
  }

  void _onStateChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTranslations.get('app_title', appState.langCode),
      debugShowCheckedModeBanner: false,
      locale: appState.locale,
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: appState.themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        fontFamily: appState.langCode == 'ar' ? 'Tahoma' : null,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal, 
          brightness: Brightness.dark
        ),
        useMaterial3: true,
        fontFamily: appState.langCode == 'ar' ? 'Tahoma' : null,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/items': (context) => const ItemsScreen(),
        '/receipts': (context) => const ReceiptsScreen(),
        '/issues': (context) => const IssuesScreen(),
        '/parties': (context) => const PartiesScreen(),
        '/reports': (context) => const ReportsScreen(),
      },
    );
  }
}
