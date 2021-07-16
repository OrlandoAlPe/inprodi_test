import 'package:flutter/cupertino.dart';

class TouchableTxt extends StatelessWidget {
  final String text;
  final void Function() onpress;
  const TouchableTxt({Key? key, required this.onpress, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: onpress,
    );
  }
}
