
import 'package:flutter/material.dart';
import 'package:firebase_ui/l10n/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gobble/pages/login.dart';

Map<int, Color> accentColour =
{
  50:Color.fromRGBO(81, 229, 255, .1),
  100:Color.fromRGBO(81, 229, 255, .2),
  200:Color.fromRGBO(81, 229, 255, .3),
  300:Color.fromRGBO(81, 229, 255, .4),
  400:Color.fromRGBO(81, 229, 255, .5),
  500:Color.fromRGBO(81, 229, 255, .6),
  600:Color.fromRGBO(81, 229, 255, .7),
  700:Color.fromRGBO(81, 229, 255, .8),
  800:Color.fromRGBO(81, 229, 255, .9),
  900:Color.fromRGBO(81, 229, 255, 1),
};
MaterialColor accentColorCustom = MaterialColor(0xff51e5ff, accentColour);

void main() => runApp(GobbleApp());

class GobbleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gobble Gobble',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: accentColorCustom,
        backgroundColor: Colors.blue
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
