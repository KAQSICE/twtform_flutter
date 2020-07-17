import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:twtform_flutter/bean.dart';

class MultiEditorPage extends StatefulWidget {
  @override
  State createState() {
    return _MultiEditorState();
  }
}

class MultiEditorArgs {
  final Multi multi;

  MultiEditorArgs(this.multi);
}

class _MultiEditorState extends State {
  @override
  Widget build(BuildContext context) {
    final MultiEditorArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('编辑多选题'),
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
                      args.multi.title = text;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: '请输入题面',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: args.multi.options.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.fromLTRB(27, 0, 27, 10),
                      title: Align(
                        child: TextField(
                          controller: TextEditingController()
                            ..text = args.multi.options.elementAt(index),
                          onChanged: (text) {
                            args.multi.options.removeAt(index);
                            args.multi.options.insert(index, text);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            hintText: '请输入选项',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            if (args.multi.options.length <= 1) {
                              FlutterToast.showToast(
                                msg: '至少要有一个选项哦',
                                textColor: Colors.white,
                                backgroundColor: Colors.red,
                              );
                            } else {
                              args.multi.options.removeAt(index);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(27, 0, 27, 0),
                      child: RaisedButton.icon(
                        color: Colors.lightBlueAccent,
                        padding: EdgeInsets.fromLTRB(27, 11, 27, 11),
                        onPressed: () {
                          setState(() {
                            args.multi.options.add('');
                          });
                        },
                        icon: Icon(Icons.add_circle),
                        label: Text('添加选项'),
                      ),
                    ),
                  ],
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
                  value: args.multi.necessary,
                  onChanged: (value) {
                    setState(() {
                      args.multi.necessary = value;
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
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Text('不设置答案'),
                                  onTap: () {
                                    setState(() {
                                      args.multi.correctAnswer = null;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: args.multi.options.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text('选项${index + 1}'),
                                        onTap: () {
                                          setState(() {
                                            args.multi.correctAnswer = [index];
                                          });
                                          Navigator.pop(context);
                                        },
                                      );
                                    })
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
                          args.multi.correctAnswer == null
                              ? '未设置'
                              : '选项${args.multi.correctAnswer}',
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
                        ..text = args.multi.score.toString(),
                      onChanged: (text) {
                        args.multi.score = text == '' ? 0 : int.parse(text);
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
                    if (args.multi.title == '') {
                      FlutterToast.showToast(
                        msg: '题干不能为空',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    } else {
                      bool submitState = true;
                      for (String option in args.multi.options) {
                        submitState = option != '';
                      }
                      if (submitState) {
                        Navigator.pop(context, args.multi);
                      } else {
                        FlutterToast.showToast(
                          msg: '选项不能为空',
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
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
