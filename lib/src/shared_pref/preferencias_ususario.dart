import 'package:preferences/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{
  static final _instance = PreferenciasUsuario._internal();

  SharedPreferences _sharedPreferences;

  PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instance;
  }

  initPref() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //--------------------GETTER Y SETTER-----------------------------------\\

  get genero {
    return _sharedPreferences.getInt("genero") ?? 1;
  }

  set genero (int value){
    _sharedPreferences.setInt("genero", value);
  }

  get nombre {
    return _sharedPreferences.getString("nombre") ?? "";
  }

  set nombre (String value){
    _sharedPreferences.setString("nombre", value);
  }

  get colorSecundario {
    return _sharedPreferences.getBool("color") ?? false;
  }

  set colorSecundario (bool value){
    _sharedPreferences.setBool("color", value);
  }

  get ultimaPag {
    return _sharedPreferences.getString("ultimaPag") ?? HomePage.routeName;
  }

  set ultimaPag (String value){
    _sharedPreferences.setString("ultimaPag", value);
  }
}