import 'package:flutter/material.dart';
import 'package:preferences/src/pages/home_page.dart';
import 'package:preferences/src/pages/settings_page.dart';
import 'package:preferences/src/shared_pref/preferencias_ususario.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final pref = PreferenciasUsuario();
  await pref.initPref();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pref = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: pref.ultimaPag,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}