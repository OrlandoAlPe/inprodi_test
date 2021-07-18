import 'package:flutter/material.dart';
import 'package:inprodi/utils/userCredentials.dart';
import 'package:inprodi/widgets/boldtxt.dart';
import 'package:inprodi/widgets/bottomText.dart';
import 'package:inprodi/widgets/Subtitle.dart';
import 'package:inprodi/widgets/mainButton.dart';
import 'package:provider/provider.dart';
import 'package:inprodi/providers/user.dart';
import 'package:inprodi/utils/textfielStyle.dart' as decoration;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  //controladores de texto
  final _emailCtrl = TextEditingController();
  final _pswdCtrl = TextEditingController();

  //Funcion de login, comparando credenciales con input de usuario
  Future logIn(String email, String password) async {
    String ogEmail = await UserCredentials.getEmail() ?? 'NoMail';
    String ogPass = await UserCredentials.getPswd() ?? 'NoPass';
    String ogName = await UserCredentials.getNombre() ?? 'NoName';
    if (email == ogEmail && password == ogPass) {
      Provider.of<User>(context, listen: false).nameChange(ogName);
      Provider.of<User>(context, listen: false).loginChange(true);
      await UserCredentials.setAuthStatus(true);
    }
  }

  //Funcion de estado, checa continuamente si hay un usario logeado para el inicio de sesion.
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
  }

  @override
  void initState() {
    super.initState();
    authCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //titulos
              Center(child: BoldTxt(message: '¡Bienvenido de vuelta!')),
              Center(
                  child: SubtitleTxt(
                      message: 'Accede a cientos de servicios de Belleza')),
              // Campos de texto
              //Correo
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Correo')),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: decoration.InputStyle.TextInputDecoration,
                    controller: _emailCtrl,
                  )),
              //Contrasena
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Contraseña')),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    obscureText: true,
                    decoration: decoration.InputStyle.TextInputDecoration,
                    controller: _pswdCtrl,
                  )),
              //Bottom Page
              MainButton(
                message: 'Entrar',
                onpress: () => {
                  logIn(_emailCtrl.text, _pswdCtrl.text),
                },
              ),
              BottomText(
                  text: '¿No tienes cuenta?',
                  onpress: () => {
                        //Navegacion a SignUp
                        Navigator.of(context).pushNamed('/signUp'),
                      },
                  boldTxt: '¡Registrate!')
            ],
          ),
        ),
      ),
    );
  }
}
