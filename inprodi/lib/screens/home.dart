import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inprodi/providers/user.dart';
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text('Hola, ' + Provider.of<User>(context).nombre),
            ),
            Text('LISTA '),
          ],
        ),
      ),
    );
  }
}
