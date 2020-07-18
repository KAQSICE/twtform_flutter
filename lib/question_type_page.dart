import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:twtform_flutter/bean.dart';
import 'package:twtform_flutter/question_editor/blank_editor_page.dart';
import 'package:twtform_flutter/question_editor/multi_editor_page.dart';
import 'package:twtform_flutter/question_editor/single_editor_page.dart';

class QuestionTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('添加题目'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.fromLTRB(24, 20, 24, 5),
            child: InkWell(
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/single_editor_page',
                  arguments: SingleEditorArgs(
                    Single(
                      title: '',
                      options: <String>['', '', ''],
                      necessary: false,
                      score: 0,
                    ),
                  ),
                );
                Navigator.pop(context, result);
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
                alignment: Alignment.center,
                child: Text('单选题'),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(24, 5, 24, 5),
            child: InkWell(
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/multi_editor_page',
                  arguments: MultiEditorArgs(
                    Multi(
                      title: '',
                      options: <String>['', '', ''],
                      necessary: false,
                      score: 0,
                    ),
                  ),
                );
                Navigator.pop(context, result);
                //TODO:这里还没做完
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
                alignment: Alignment.center,
                child: Text('多选题'),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(24, 5, 24, 5),
            child: InkWell(
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/blank_editor_page',
                  arguments: BlankEditorArgs(
                    Blank(
                      title: '',
                      necessary: false,
                      score: 0,
                      correctAnswer: '',
                    ),
                  ),
                );
                Navigator.pop(context, result);
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
                alignment: Alignment.center,
                child: Text('填空题'),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(24, 5, 24, 5),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
                alignment: Alignment.center,
                child: Text('量表题'),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(24, 5, 24, 5),
            child: InkWell(
              onTap: () {
                FlutterToast.showToast(
                  msg: '这里排序题还没有做',
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                );
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
                alignment: Alignment.center,
                child: Text('排序题'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
