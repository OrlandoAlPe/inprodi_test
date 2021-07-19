import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inprodi/utils/data.dart';
import 'package:inprodi/widgets/listItem.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({Key? key}) : super(key: key);
  @override
  _DisplayDataState createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  bool? _error;
  bool? _loading;
  List<Data>? _usuarios;
  final int _nextPageThreshold = 5;

  Future<void> fetchUsers() async { //Consigue los datos de la url y los añade a la lista.
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      List<Data> fetchedUsers = Data.parseList(json.decode(response.body));
      setState(() {
        _loading = false;
        _usuarios!.addAll(fetchedUsers);
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _error = false;
    _loading = true;
    _usuarios = [];
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    if (_usuarios!.isEmpty) {
      if (_loading == true) {
        return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
      } else if (_error == true) {
        return Center(
            child: InkWell(
          onTap: () {
            setState(() {
              _loading = true;
              _error = false;
              fetchUsers();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Error, toca para cargar de nuevo.'),
          ),
        ));
      }
    } else {
      return ListView.builder(
          itemCount: _usuarios!.length,
          itemBuilder: (context, index) {
            if (index == _usuarios!.length - _nextPageThreshold) {
              fetchUsers();
            }
            if (index == _usuarios!.length) {
              if (_error == true) {
                return Center(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      _loading = true;
                      _error = false;
                      fetchUsers();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('Error al cargar datos, toca para cargar.'),
                  ),
                ));
              } else {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ));
              }
            }
            final Data user = _usuarios![index];
            return (ListElement(correo: user.email, nombre: user.name));
          });
    }
    return Container();
  }
}
