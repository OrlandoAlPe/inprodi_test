import 'package:flutter/material.dart';

class User with ChangeNotifier {
  bool logedin = false;
  String nombre = 'NoName';
  
   void loginChange(bool authState) {
    logedin = !logedin;
    notifyListeners();
  } 
  void nameChange(String nnombre) {
    nombre = nnombre;
    notifyListeners();
  } 
}