import 'package:flutter/material.dart';
import 'package:preferences/src/pages/home_page.dart';
import 'package:preferences/src/shared_pref/preferencias_ususario.dart';
import 'package:preferences/src/widgets/drawer_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = "/settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textEditingController;
  final pref = PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: pref.nombre);
    _genero = pref.genero;
    _nombre = pref.nombre;
    _colorSecundario = pref.colorSecundario;
    pref.ultimaPag = SettingsPage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
        backgroundColor: (pref.colorSecundario) ? Colors.teal : Colors.deepOrange,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text("Settings", style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            onChanged: _setSecundaryColor,
            value: _colorSecundario,
            title: Text("Color Secundario"),
          ),
          RadioListTile(
            groupValue: _genero,
            value: 0,
            onChanged: _setSelectedRadio,
            title: Text("Masculino"),
          ),
          RadioListTile(
            groupValue: _genero,
            value: 1,
            onChanged: _setSelectedRadio,
            title: Text("Femenino"),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: "Nombre",
                helperText: "Nombre de la persona"
              ),
              onChanged: (value){
                _setChangedName(value);
              },
            ),
          )
        ],
      ),
    );
  }

  void _setSelectedRadio(int value) async{
    setState(() {
      _genero = value;
    });
    pref.genero = value;
  }

  void _setChangedName(String value) {
    pref.nombre = value;
  }

  void _setSecundaryColor(bool value) {
    setState(() {
      _colorSecundario = value;
    });
    pref.colorSecundario = value;
  }
}
