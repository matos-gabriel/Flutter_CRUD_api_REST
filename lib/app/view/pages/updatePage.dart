import 'package:flutter/material.dart';
import 'package:simple_flutter_crud/app/data/model/user.dart';
import 'package:simple_flutter_crud/app/data/provider/users.dart';
import 'package:simple_flutter_crud/app/routes/AppRoutes.dart';
import 'package:simple_flutter_crud/app/view/components/customRaisedButton.dart';

class UpdatePage extends StatefulWidget {
  final int index;
  final Users users;
  UpdatePage(this.index, this.users);
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _name =
        TextEditingController(text: widget.users.getUsers[widget.index].name);
    TextEditingController _password = TextEditingController(
        text: widget.users.getUsers[widget.index].password);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit User"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Input name is empty!";
                  }
                },
                onChanged: (value) {},
              ),
              TextFormField(
                controller: _password,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Input password is empty!";
                  }
                },
                obscureText: true,
                onChanged: (value) {},
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomRaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          User newUser = User(
                              id: widget.users.getUsers[widget.index].id,
                              name: _name.text,
                              password: _password.text);
                          widget.users.updateUser(newUser).then((_) =>
                              Navigator.of(context).pushNamed(AppRoutes.home));
                        }
                      },
                      text: "Create",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
