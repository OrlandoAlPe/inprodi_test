import 'package:flutter/material.dart';
import 'package:inprodi/providers/user.dart';
import 'package:inprodi/screens/home.dart';
import 'package:inprodi/screens/login.dart';
import 'package:inprodi/screens/signIn.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => User(), //Inicializando provider
      child: MaterialApp(
        title: 'inprodi',
        theme: ThemeData(
          //creando paleta de colores segun el diseno
          primaryColor: Color(0xFFb74f5d),
          accentColor: Color(0xFFCDBABC),
        ),
        routes: {
          // Creando rutas, 3 pantallas: Home, Login & SignUp
          '/home': (_) => home(),
          '/login': (_) => login(),
          '/signUp': (_) => singnUp()
        },
        home: login(),
      ),
    );
  }
}
