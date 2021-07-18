import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inprodi/widgets/fetching.dart';
import 'package:inprodi/widgets/homeTitle.dart';
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
      
      appBar: AppBar(
        //Top bar
        actions: [
          Container(margin: EdgeInsets.all(10), child: Icon(Icons.search)),
          Container(
              margin: EdgeInsets.all(10), child: Icon(Icons.person_outlined))
        ],
        title: Text('Inicio'),
        leading: Center(child: Text('VezaBela')),
        leadingWidth: 100,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(color: Colors.white,child: Row(children: [Text('sd'),Icon(Icons.calendar_today_rounded)],),),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.calendar_today_outlined,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () => {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.all(15),
              child: HomeTitle(nombre: Provider.of<User>(context).nombre)),
          Flexible(
            child: DisplayData(),
          ),
        ],
      ),
    );
  }
}
