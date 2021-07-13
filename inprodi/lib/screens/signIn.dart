import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class singnUp extends StatefulWidget {
  const singnUp({Key? key}) : super(key: key);

  @override
  _singnUpState createState() => _singnUpState();
}

class _singnUpState extends State<singnUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Crear cuenta'),
            Text('Nombre Compleo'),
            TextField(),
            Text('Correo'),
            TextField(),
            Text('Telefono'),
            TextField(),
            Text('Contrasena'),
            TextField(),
            Row(
              children: [
                Checkbox(value: true, onChanged: null),
                Text('Acepto bla bla'),
              ],
            ),
            Row(
              children: [
                Checkbox(value: true, onChanged: null),
                Text('Notificarme cuando glu glu'),
              ],
            ),
            TextButton(
              onPressed: () => {},
              child: Text('Registrar'),
            ),
            Text('Ya tienes cuenta?'),
            GestureDetector(
              child: Text(
                'Ingresa!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: ()=>{
                Navigator.of(context).pop()
              },
            ),
          ],
        ),
      ),
    );
  }
}
