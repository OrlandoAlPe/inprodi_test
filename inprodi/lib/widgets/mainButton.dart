import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String message;
  final void Function() onpress;
  const MainButton({Key? key, required this.message, required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          minimumSize: Size(double.infinity, 50),
        ),
        onPressed: onpress,
        child: Text(
          message,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
