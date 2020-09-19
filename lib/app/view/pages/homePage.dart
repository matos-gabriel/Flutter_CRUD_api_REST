import 'package:flutter/material.dart';
import 'package:simple_flutter_crud/app/data/provider/users.dart';
import 'package:simple_flutter_crud/app/routes/AppRoutes.dart';
import 'package:simple_flutter_crud/app/view/pages/updatePage.dart';

class HomePage extends StatefulWidget {
  final Users users;
  HomePage(this.users);

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
        minimum: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: widget.users.leght,
          itemBuilder: (ctx, index) {
            return ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return UpdatePage(index, widget.users);
                }));
              },
              title: Text("Name: ${widget.users.getUsers[index].name}"),
              subtitle:
                  Text("Password: ${widget.users.getUsers[index].password}"),
              trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () {
                    widget.users
                        .removeUser(widget.users.getUsers[index])
                        .then((_) {
                      setState(() {});
                    });
                  }),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.createPage);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
