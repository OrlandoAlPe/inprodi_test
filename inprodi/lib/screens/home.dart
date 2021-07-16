import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inprodi/widgets/fetching.dart';
import 'package:provider/provider.dart';
import 'package:inprodi/providers/user.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text('Hola, ' + Provider.of<User>(context).nombre),
            ),
            SizedBox(
              height: 25,
            ),
            Flexible(
              child: DisplayData(),
            ),
          ],
        ),
      ),
    );
  }
}
