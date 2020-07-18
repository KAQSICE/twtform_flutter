import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bean.dart';

class BlankEditorPage extends StatefulWidget {
  @override
  State createState() {
    return _BlankEditorState();
  }
}

class BlankEditorArgs {
  final Blank blank;

  BlankEditorArgs(this.blank);
}

class _BlankEditorState extends State {
  @override
  Widget build(BuildContext context) {
    final BlankEditorArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('编辑填空题'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
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
                            )),
                        TextSpan(
                          text: '题面',
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
                      args.blank.title = text;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: '请输入题面',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(27, 11, 27, 10),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '更多设置',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.fromLTRB(27, 0, 27, 10),
                  title: Text('是否必答'),
                  value: args.blank.necessary,
                  onChanged: (value) {
                    setState(() {
                      args.blank.necessary = value;
                    });
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(27, 0, 27, 10),
                  title: Text('设置答案'),
                  trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String answer;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Text('不设置答案'),
                                  onTap: () {
                                    setState(() {
                                      args.blank.correctAnswer = '';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: TextField(
                                    onChanged: (text) {
                                      answer = text;
                                    },
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.done),
                                    onPressed: () {
                                      setState(() {
                                        args.blank.correctAnswer = answer;
                                        Navigator.pop(context);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          args.blank.correctAnswer == null ? '未设置' : '已设置',
                        ),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(27, 0, 27, 10),
                  title: Text('设置分值'),
                  trailing: SizedBox.fromSize(
                    size: Size.fromWidth(50),
                    child: TextField(
                      controller: TextEditingController()
                        ..text = args.blank.score.toString(),
                      onChanged: (text) {
                        args.blank.score = text == '' ? 0 : int.parse(text);
                      },
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                width: double.infinity,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    if (args.blank.title == '') {
                      FlutterToast.showToast(
                        msg: '题干不能为空',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    } else {
                      Navigator.pop(context, args.blank);
                    }
                  },
                  child: Text('完成'),
                  color: Colors.lightBlueAccent,
                )),
          ),
        ],
      ),
    );
  }
}
