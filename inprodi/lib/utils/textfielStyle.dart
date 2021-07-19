import 'package:flutter/material.dart';

//decoracion de text input
 class InputStyle {
  static var TextInputDecoration = InputDecoration(
    filled: true,
    fillColor: Color(0xFFd6c7cc),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color(0xFFd6c7cc), width: 0.5)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color(0xFFd6c7cc), width: 0.5)),
  );
}
