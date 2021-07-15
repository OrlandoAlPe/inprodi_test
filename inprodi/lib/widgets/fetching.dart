import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inprodi/utils/data.dart';

Future<List<Data>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Error');
  }
}

class DisplayData extends StatefulWidget {
  const DisplayData({Key? key}) : super(key: key);
  @override
  _DisplayDataState createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  Future<List<Data>>? futureData;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    futureData = fetchData();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        
          
      }
    });
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Data>>(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Data> data = snapshot.data!;
          return ListView.builder(
              controller: _scrollController,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 150,
                  child: Text(data[index].name + ' ' + data[index].email),
                );
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
    );
  }
}
