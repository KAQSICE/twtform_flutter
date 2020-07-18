import 'package:flutter/material.dart';
import 'package:twtform_flutter/new_paper_page.dart';
import 'package:twtform_flutter/paper_editor_page.dart';
import 'package:twtform_flutter/question_editor/blank_editor_page.dart';
import 'package:twtform_flutter/question_editor/multi_editor_page.dart';
import 'package:twtform_flutter/question_editor/single_editor_page.dart';
import 'package:twtform_flutter/question_type_page.dart';

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
        '/question_type_page': (context) => QuestionTypePage(),
        '/single_editor_page': (context) => SingleEditorPage(),
        '/multi_editor_page': (context) => MultiEditorPage(),
        '/blank_editor_page': (context) => BlankEditorPage(),
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
