import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.calendar_today_rounded,
          color: Colors.white,
          size: 30,
        ),
        elevation: 0,
        onPressed: () => {},
      );
  }
}