import 'package:flutter/material.dart';
import 'package:preferences/src/shared_pref/preferencias_ususario.dart';
import 'package:preferences/src/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  final pref = PreferenciasUsuario();
  static final String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    pref.ultimaPag = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias Usuario"),
        backgroundColor: (pref.colorSecundario) ? Colors.teal : Colors.deepOrange,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color Secundario: ${pref.colorSecundario}"),
          Divider(),
          Text("Género: ${pref.genero}"),
          Divider(),
          Text("Nombre: ${pref.nombre}"),
          Divider(),
        ],
      ),
    );
  }
}
