import 'package:flutter/material.dart';
import 'package:simple_flutter_crud/app/routes/AppRoutes.dart';
import 'package:simple_flutter_crud/app/view/pages/createPage.dart';
import 'package:simple_flutter_crud/app/view/pages/deletionPage.dart';
import 'package:simple_flutter_crud/app/view/pages/homePage.dart';
import 'package:simple_flutter_crud/app/view/pages/readPage.dart';
import 'package:simple_flutter_crud/app/view/pages/updatePage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/provider/users.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Users users = Users();
  bool isLoading = true;
  void initState() {
    super.initState();

    users.readUsers().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter simple crud",
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          textTheme: TextTheme(title: GoogleFonts.fredokaOne())),
      routes: {
        AppRoutes.home: (context) => HomePage(users),
        AppRoutes.createPage: (context) => CreatePage(users),
        AppRoutes.readPage: (context) => ReadPage(users, isLoading),
        AppRoutes.deletePage: (context) => DeletePage(users),
      },
    );
  }
}
