import 'package:flutter/material.dart';
import 'package:inprodi/providers/user.dart';
import 'package:inprodi/screens/home.dart';
import 'package:inprodi/screens/login.dart';
import 'package:inprodi/screens/signIn.dart';
import 'package:inprodi/utils/userCredentials.dart';
import 'package:provider/provider.dart';

Future main() async {
  //inicializando Shared Preferences
  WidgetsFlutterBinding.ensureInitialized();
  await UserCredentials.init();
  runApp(
    ChangeNotifierProvider(
      create: (_) => User(), //inicializando provider en el widget raiz,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void authCheck() async {
    bool authStatus = await UserCredentials.getAuth();
    if (authStatus == false) {
      Provider.of<User>(context, listen: false).loginChange(false);
    } else {
      Provider.of<User>(context, listen: false).loginChange(true);
    }
  }

  @override
  void initState() {
    super.initState();
    authCheck();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: Provider.of<User>(context).logedin ? home() : login(),
    ); //
  }
}
