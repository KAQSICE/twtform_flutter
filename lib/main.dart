import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(TWTFormApp());
}

class TWTFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TWTForm",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlueAccent,
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.pinkAccent),
      home: HomePage(),
    );
  }
}
