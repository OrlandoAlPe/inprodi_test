import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubtitleTxt extends StatelessWidget {
  final String message;
  const SubtitleTxt({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).accentColor, fontSize: 20),
      ),
    );
  }
}
