import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inprodi/utils/userCredentials.dart';

class singnUp extends StatefulWidget {
  const singnUp({Key ?key}) : super(key: key);

  @override
  _singnUpState createState() => _singnUpState();
}

class _singnUpState extends State<singnUp> {
  //Creando Text controllers
  final _pswdControl = TextEditingController();
  final _telControl = TextEditingController();
  final _nomControl = TextEditingController();
  final _emControl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Crear cuenta'),
              Text('Nombre '),
              TextFormField(
                controller: _nomControl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obligatorio.';
                  }
                },
              ),
              Text('Correo'),
              TextFormField(
                controller: _emControl,
                validator: (value) {
                  if (value == null ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return 'Inserta un email valido.';
                  }
                },
              ),
              Text('Telefono'),
              TextFormField(
                controller: _telControl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obligatorio.';
                  }
                },
              ),
              Text('Contrasena'),
              TextFormField(
                controller: _pswdControl,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'Inserte una contrasena de mas de 8 caracteres.';
                  }
                },
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: null),
                  Text('He leido y Acepto terminos y condiciones.'),
                ],
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: null),
                  Text('Deseo recibir noticias y promociones.'),
                ],
              ),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate())
                    {
                     await UserCredentials.setEmail(_emControl.text);
                     await UserCredentials.setPswd(_pswdControl.text);
                     await UserCredentials.setNombre(_nomControl.text);
                     await UserCredentials.setTel(_telControl.text);
                    }
                },
                child: Text('Registrar'),
              ),
              Text('Ya tienes cuenta?'),
              GestureDetector(
                child: Text(
                  'Ingresa!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.of(context).pop(),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
