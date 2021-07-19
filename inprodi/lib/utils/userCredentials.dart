import 'package:shared_preferences/shared_preferences.dart';

class UserCredentials {
  static SharedPreferences? _credentials;
  static const _usernameKey = 'usernameKey';
  static const _emailKey = 'emailKey';
  static const _passKey = 'passKey';
  static const _telKey = 'telKey';
  static const _authKey = 'authKey';
  static Future init() async =>
      _credentials = await SharedPreferences.getInstance(); //Inicializacion de Shared Preferences

  //Funciones para guardar Estados persistentes
  static Future setAuthStatus(bool logedin) async =>
      await _credentials?.setBool(_authKey, logedin);

  static Future setTel(String telefono) async =>
      await _credentials?.setString(_telKey, telefono);

  static Future setNombre(String nombre) async =>
      await _credentials?.setString(_usernameKey, nombre);

  static Future setEmail(String email) async =>
      await _credentials?.setString(_emailKey, email);

  static Future setPswd(String password) async =>
      await _credentials?.setString(_passKey, password);

  //Funciones para cargar Estados persistentes
  static Future getNombre() async => await _credentials?.getString(_usernameKey);

  static Future getEmail() async => await _credentials?.getString(_emailKey);

  static Future getPswd() async => await _credentials?.getString(_passKey);

  static Future getTel() async => await _credentials?.getString(_telKey);

  static Future getAuth() async => await _credentials?.getBool(_authKey);
}
