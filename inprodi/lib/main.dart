import 'package:flutter/material.dart';
import 'package:inprodi/screens/home.dart';
import 'package:inprodi/screens/login.dart';
import 'package:inprodi/screens/signIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'inprodi',
      theme: ThemeData(
        primaryColor: Color(0xFFb74f5d  ), // #79464C,
        accentColor: Color(0xFFCDBABC)//#CDBABC
      ),
      home: login(),
    );
  }
}

