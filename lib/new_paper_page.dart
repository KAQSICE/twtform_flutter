import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:twtform_flutter/common.dart';
import 'package:twtform_flutter/paper_editor_page.dart';

import 'bean.dart';

class NewPaperPage extends StatefulWidget {
  @override
  State createState() {
    return _NewPaperState();
  }
}

class NewPaperArgs {
  final int paperType;

  //TODO:这里加一个Bean
  NewPaperArgs(this.paperType);
}

class _NewPaperState extends State {
  String title, description;
  dynamic startDate, endDate;

  var controller = TextEditingController()..addListener(() {});

  @override
  Widget build(BuildContext context) {
    final NewPaperArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('新建${paperTypeName.elementAt(args.paperType)}'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(27, 11, 27, 10),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: '${paperTypeName.elementAt(args.paperType)}名称',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(27, 0, 27, 10),
              title: TextField(
                onChanged: (text) {
                  title = text;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  hintText: '请输入${paperTypeName.elementAt(args.paperType)}名称',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(27, 11, 27, 10),
              child: RichText(
                text: TextSpan(
                  text: '${paperTypeName.elementAt(args.paperType)}说明',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(27, 0, 27, 10),
              title: TextField(
                onChanged: (text) {
                  description = text;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  hintText: '请输入${paperTypeName.elementAt(args.paperType)}说明',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(27, 11, 27, 10),
              child: RichText(
                text: TextSpan(
                  text: '开始时间',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(27, 0, 27, 10),
              title: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  hintText:
                      startDate == null ? '请输入开始时间' : startDate.toString(),
                  border: OutlineInputBorder(),
                ),
                enableInteractiveSelection: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _showStartPickers();
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(27, 11, 27, 10),
              child: RichText(
                text: TextSpan(
                  text: '结束时间',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(27, 0, 27, 10),
              title: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  hintText: endDate == null ? '请输入结束时间' : endDate.toString(),
                  border: OutlineInputBorder(),
                ),
                enableInteractiveSelection: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _showEndPickers();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(27, 20, 27, 0),
              child: RaisedButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  if (title == '' || title == null) {
                    FlutterToast.showToast(
                      msg: '${paperTypeName.elementAt(args.paperType)}名称不能为空',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      gravity: ToastGravity.BOTTOM,
                    );
                  } else {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      '/paper_editor_page',
                      arguments: PaperEditorArgs(
                        0,
                        Paper(
                          title: title,
                          description: description,
                          type: args.paperType,
                          startTime: startDate,
                          endTime: endDate,
                        ),
                      ),
                    );
                  }
                },
                child: Text('创建${paperTypeName.elementAt(args.paperType)}'),
              ),
            ),
          ],
        ));
  }

  _showStartPickers() async {
    var datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2200),
    ).then((value) async {
      if (value != null) {
        var tempStartDate = value;
        var timePicker =
            await showTimePicker(context: context, initialTime: TimeOfDay.now())
                .then((value) {
          if (value != null) {
            setState(() {
              startDate = DateTime(
                tempStartDate.year,
                tempStartDate.month,
                tempStartDate.day,
                value.hour,
                value.minute,
              );
            });
          }
        });
      }
    });
  }

  _showEndPickers() async {
    var datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2200),
    ).then((value) async {
      if (value != null) {
        var tempEndDate = value;
        var timePicker = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((value) {
          if (value != null) {
            setState(() {
              endDate = DateTime(tempEndDate.year, tempEndDate.month,
                  tempEndDate.day, value.hour, value.minute);
            });
          }
        });
      }
    });
  }
}
