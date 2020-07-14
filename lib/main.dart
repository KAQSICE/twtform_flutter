import 'package:flutter/material.dart';
import 'package:twtform_flutter/new_paper_page.dart';
import 'package:twtform_flutter/paper_editor_page.dart';

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
      routes: <String, WidgetBuilder>{
        '/home_page': (context) => HomePage(),
        '/new_paper_page': (context) => NewPaperPage(),
        '/paper_editor_page': (context) => PaperEditorPage(),
      },
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
