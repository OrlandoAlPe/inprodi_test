import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {
  final String nombre;
  final String correo;

  const ListElement({Key? key, required this.correo, required this.nombre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 80,
                width: 75,
                child: Image.network(
                    'https://scontent.fagu3-1.fna.fbcdn.net/v/t1.6435-9/91226189_3200189753326885_1248078339000762368_n.png?_nc_cat=104&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeF48FRvSumtTyRjKX1vjSYy8Dg7aQhHhDbwODtpCEeENoBfTHsargfSxVp5QBaq89l5Olt0IFnosb0saiexhkLi&_nc_ohc=qNHW92xP_2kAX9CEh1G&_nc_ht=scontent.fagu3-1.fna&oh=5c7d52173546733e488d377d42c8e7d8&oe=60F736D1',fit: BoxFit.cover,),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 20),
              ),
              Text(
                correo,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 15),
              ),
            ],
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.more_vert),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}