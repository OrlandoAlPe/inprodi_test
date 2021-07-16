import 'package:flutter/cupertino.dart';

class BoldTxt extends StatelessWidget {
  final String message;
  const BoldTxt({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Text(
        message,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }
}
