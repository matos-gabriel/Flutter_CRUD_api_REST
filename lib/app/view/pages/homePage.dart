import 'package:flutter/material.dart';
import 'package:simple_flutter_crud/app/routes/AppRoutes.dart';
import 'package:simple_flutter_crud/app/view/components/customRaisedButton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD in Flutter"),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomRaisedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.createPage),
                  text: "CREATE"),
              CustomRaisedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.readPage),
                  text: "READ"),
              CustomRaisedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.updatePage),
                  text: "UPDATE"),
              CustomRaisedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.deletePage),
                  text: "Delete"),
              SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Simple CRUD create by: gabriel-matos"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
