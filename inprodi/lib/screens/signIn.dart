import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inprodi/utils/userCredentials.dart';
import 'package:inprodi/widgets/boldtxt.dart';
import 'package:inprodi/widgets/bottomText.dart';
import 'package:inprodi/widgets/Subtitle.dart';
import 'package:inprodi/widgets/mainButton.dart';
import 'package:inprodi/utils/textfielStyle.dart' as decoration;

class singnUp extends StatefulWidget {
  const singnUp({Key? key}) : super(key: key);

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
  bool _TermsStatus = true;
  bool _NewsStatus = true;

  Future<void> registro() async { //Crea cuenta guardando datos con shared Preferences
    await UserCredentials.setEmail(_emControl.text);
    await UserCredentials.setPswd(_pswdControl.text);
    await UserCredentials.setNombre(_nomControl.text);
    await UserCredentials.setTel(_telControl.text);
    _emControl.clear();
    _pswdControl.clear();
    _nomControl.clear();
    _telControl.clear();
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cuenta creada exitosamente!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Escribe tus datos en el login para ingresar'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok!'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> CBcheck() {//checador de checkboxes
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cuenta no creada!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Ingresa bien los datos y recuerda aceptar los terminos y condiciones.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Header
                  Center(child: BoldTxt(message: 'Crear cuenta')),
                  SubtitleTxt(
                      message:
                          'Descubre los cientos de servicios de belleza que tenemos para ti!'),
                  //Inicio de TextFields
                  //Nombre
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Nombre')),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _nomControl,
                    decoration: decoration.InputStyle.TextInputDecoration,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obligatorio.';
                      }
                    },
                  ),
                  //Email
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Correo electónico')),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emControl,
                    decoration: decoration.InputStyle.TextInputDecoration,
                    validator: (value) {
                      if (value == null ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'Inserta un email válido.';
                      }
                    },
                  ),
                  //Telefono
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Teléfono')),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _telControl,
                    decoration: decoration.InputStyle.TextInputDecoration,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obligatorio.';
                      }
                    },
                  ),
                  //Contrasena
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Contraseña')),
                  TextFormField(
                    controller: _pswdControl,
                    obscureText: true,
                    decoration: decoration.InputStyle.TextInputDecoration,
                    validator: (value) {
                      if (value == null || value.length < 8) {
                        return 'Inserte una contraseña de mas de 8 caracteres.';
                      }
                    },
                  ),
                  //CheckBoxes
                  Row(
                    children: [
                      Checkbox(
                          value: this._TermsStatus,
                          onChanged: (bool? value) {
                            setState(() {
                              this._TermsStatus = !_TermsStatus;
                            });
                          }),
                      Text(
                        'He leído y acepto los terminos y condiciones.',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Checkbox(
                          value: this._NewsStatus,
                          onChanged: (bool? value) {
                            setState(() {
                              this._NewsStatus = !_NewsStatus;
                            });
                          }),
                      Text(
                        'Deseo recibir noticias y promociones.',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                  //Bottom Page
                  MainButton(
                    message: 'Registro',
                    onpress: () async {
                      //Validacion de campos de texto y seteo de datos persistentes
                      if (_formKey.currentState!.validate() &&
                          this._TermsStatus == true) {
                        registro();
                      } else {
                        CBcheck();
                      }
                    },
                  ),
                  BottomText(
                      text: '¿Ya tienes cuenta?',
                      //Navegacion a login
                      onpress: () => {
                            Navigator.of(context).pop(),
                          },
                      boldTxt: '¡Ingresa!')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
