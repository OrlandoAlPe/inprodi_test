import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String nombre;
  const HomeTitle({Key? key, required this.nombre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Hola, ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 25),
            children: <TextSpan>[
          TextSpan(
              text: nombre + '!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
        ]));
  }
}
