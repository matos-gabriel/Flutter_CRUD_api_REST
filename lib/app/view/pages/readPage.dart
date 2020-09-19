import 'package:flutter/material.dart';
import 'package:simple_flutter_crud/app/data/provider/users.dart';

class ReadPage extends StatefulWidget {
  final Users users;
  final bool isLoading;
  ReadPage(this.users, this.isLoading);
  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Read Users"),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ));
  }
}
