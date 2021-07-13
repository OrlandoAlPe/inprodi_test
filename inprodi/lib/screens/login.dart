import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Bienvenido'),
            Text('Correo'),
            TextField(),
            Text('Contrasena'),
            TextField(),
            TextButton(
              onPressed: () => {},
              child: Text('Entrar'),
            ),
            Text('No tienes cuenta?'),
            GestureDetector(
              child: Text(
                'Registrate!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: ()=>{
                Navigator.of(context).pushNamed('/signUp')
              },
            ),
          ],
        ),
      ),
    );
  }
}
