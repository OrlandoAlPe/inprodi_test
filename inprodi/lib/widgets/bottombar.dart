import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 55,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    'Inicio',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            ),
            Icon(Icons.watch_later_outlined,
                color: Theme.of(context).primaryColor),
            Icon(Icons.favorite_border_rounded,
                color: Theme.of(context).primaryColor),
            Icon(Icons.comment_outlined, color: Theme.of(context).primaryColor)
          ],
        ),
      ),
    );
  }
}
