
import 'package:flutter/material.dart';
import 'package:firebase_ui/l10n/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gobble/pages/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gobble Gobble',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.white,
        backgroundColor: Colors.black
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FFULocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fr', 'FR'),
        const Locale('en', 'US'),
        const Locale('de', 'DE'),
        const Locale('pt', 'BR'),
        const Locale('es', 'MX'),
      ],
      home: new LoginPage(title: 'Gobble Home Page'),
    );
  }
}
