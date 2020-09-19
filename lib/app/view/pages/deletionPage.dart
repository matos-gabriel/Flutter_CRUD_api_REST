import 'package:flutter/material.dart';
import 'package:simple_flutter_crud/app/data/model/user.dart';
import 'package:simple_flutter_crud/app/data/provider/users.dart';

class DeletePage extends StatefulWidget {
  final Users users;
  DeletePage(this.users);
  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  @override
  Widget build(BuildContext context) {
    var readUsers = widget.users.getUsers;
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete User"),
      ),
      body: ListView.builder(
        itemCount: widget.users.leght,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Icon(Icons.person),
            title: Text("Name: ${widget.users.getUsers[index].name}"),
            subtitle:
                Text("Password: ${widget.users.getUsers[index].password}"),
            trailing: IconButton(
                icon: IconButton(
                    icon:
                        Icon(Icons.delete, color: Theme.of(context).errorColor),
                    onPressed: () {
                      setState(() {
                        widget.users.removeUser(widget.users.getUsers[index]);
                      });
                    }),
                onPressed: () {}),
          );
        },
      ),
    );
  }
}
