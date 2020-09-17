import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_crud/app/data/model/user.dart';
import 'package:simple_flutter_crud/app/data/provider/users.dart';
import 'package:simple_flutter_crud/app/view/components/customRaisedButton.dart';

class CreatePage extends StatefulWidget {
  final Users users;
  CreatePage(this.users);
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create User",
          style: GoogleFonts.raleway(),
        ),
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
                decoration: InputDecoration(
                    hintText: "Username or email",
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
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
                decoration: InputDecoration(
                    hintText: "password",
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
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
                          widget.users.addUser(User(
                            name: _name.text,
                            password: _password.text,
                          ));

                          Navigator.of(context).pop();
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
