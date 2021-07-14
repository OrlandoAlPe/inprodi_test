import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inprodi/utils/userCredentials.dart';
import 'package:provider/provider.dart';
import 'package:inprodi/providers/user.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _emailCtrl = TextEditingController();
  final _pswdCtrl = TextEditingController();

  Future logIn(String email, String password) async {
    String ogEmail = await UserCredentials.getEmail();
    String ogPass = await UserCredentials.getPswd();
    String ogName = await UserCredentials.getNombre();
    if (email == ogEmail && password == ogPass) {
      Provider.of<User>(context, listen: false).nameChange(ogName);
      Provider.of<User>(context, listen: false).loginChange(true);
      await UserCredentials.setAuthStatus(true);
    }
  }

  void authCheck() async {
    bool authStatus;
    String nom;
    await UserCredentials.getAuth() == null
        ? authStatus = false
        : authStatus = await UserCredentials.getAuth();
    await UserCredentials.getNombre() == null
        ? nom = 'null'
        : nom = (await UserCredentials.getNombre());
    if (authStatus == true) {
      Provider.of<User>(context, listen: false).loginChange(true);
      Provider.of<User>(context, listen: false).nameChange(nom);
    }

    log(authStatus.toString());
  }

  @override
  void initState() {
    super.initState();
    authCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Bienvenido'),
            Text('Correo'),
            TextField(
              controller: _emailCtrl,
            ),
            Text('Contrasena'),
            TextField(
              controller: _pswdCtrl,
            ),
            TextButton(
              onPressed: () => {
                logIn(_emailCtrl.text, _pswdCtrl.text),
              },
              child: Text('Entrar'),
            ),
            Text('No tienes cuenta?'),
            GestureDetector(
              child: Text(
                'Registrate!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () => {
                Navigator.of(context).pushNamed('/signUp'),
              },
            ),
          ],
        ),
      ),
    );
  }
}
