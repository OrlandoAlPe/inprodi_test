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
                    'https://uploads.turbologo.com/uploads/design/hq_preview_image/1903103/draw_svg20210507-22909-1p9cmk6.svg.png',fit: BoxFit.cover,),
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