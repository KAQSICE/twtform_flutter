import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:twtform_flutter/bean.dart';
import 'package:twtform_flutter/common.dart';

class PaperEditorPage extends StatefulWidget {
  @override
  State createState() {
    return _PaperEditorState();
  }
}

/// 这里的[parent]是上级页面传来的一个标志，如果为0就代表新建，如果为1就代表是编辑。
class PaperEditorArgs {
  final parent;
  final Paper paper;

  PaperEditorArgs(this.parent, this.paper);
}

class _PaperEditorState extends State {
  List<int> singleGroupValue = [];
  var multiValue = List();

  @override
  Widget build(BuildContext context) {
    final PaperEditorArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('编辑${paperTypeName.elementAt(args.paper.type)}'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.fromLTRB(24, 10, 24, 10),
                  child: ListTile(
                    title: Text(args.paper.title),
                    subtitle: Text(args.paper.description == null
                        ? '这个${paperTypeName.elementAt(args.paper.type)}还没有说明哟'
                        : args.paper.description),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: args.paper.questions.single.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.fromLTRB(24, 10, 24, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                                '${index + 1}.${args.paper.questions.single
                                    .elementAt(index)
                                    .title}'),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: args.paper.questions.single
                                .elementAt(index)
                                .options
                                .length,
                            itemBuilder: (context, optionIndex) {
                              return RadioListTile(
                                activeColor: Colors.lightBlueAccent,
                                value: optionIndex,
                                groupValue: singleGroupValue.elementAt(index),
                                onChanged: (value) {
                                  setState(() {
                                    singleGroupValue.removeAt(index);
                                    singleGroupValue.insert(index, value);
                                  });
                                },
                                title: Text(args.paper.questions.single
                                    .elementAt(index)
                                    .options
                                    .elementAt(optionIndex)),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: args.paper.questions.multi.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.fromLTRB(24, 10, 24, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                                '${args.paper.questions.single.length + index +
                                    1}.${args.paper.questions.multi
                                    .elementAt(index)
                                    .title}'),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: args.paper.questions.multi
                                .elementAt(index)
                                .options
                                .length,
                            itemBuilder: (context, optionIndex) {
                              List temp = multiValue.elementAt(index);
                              return CheckboxListTile(
                                controlAffinity: ListTileControlAffinity
                                    .leading,
                                value: temp.elementAt(optionIndex),
                                onChanged: (value) {
                                  setState(() {
                                    temp.removeAt(optionIndex);
                                    temp.insert(optionIndex, value);
                                    multiValue.removeAt(index);
                                    multiValue.insert(index, temp);
                                  });
                                },
                              );
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
                //TODO:这里动态添加题目Card
                Container(
                  margin: EdgeInsets.fromLTRB(84, 5, 84, 5),
                  child: RaisedButton.icon(
                    color: Colors.lightBlueAccent,
                    icon: Icon(Icons.add_circle),
                    label: Text('添加题目'),
                    onPressed: () async {
                      final result = await Navigator.pushNamed(
                          context, '/question_type_page');
                      if (result != null) {
                        setState(() {
                          if (result is Single) {
                            args.paper.questions.single.add(result);
                            singleGroupValue.add(0);
                          } else if (result is Multi) {
                            args.paper.questions.multi.add(result);
                            var temp = List();
                            for (int i = 0; i < result.options.length; i++) {
                              temp.add(false);
                            }
                            multiValue.add(temp);
                          }
                        });
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(84, 5, 84, 5),
                  child: RaisedButton(
                    color: Colors.lightBlueAccent,
                    child: Text('预览'),
                    onPressed: () {
                      FlutterToast.showToast(
                        msg: '这里还没做',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: double.infinity,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    //TODO:提交问卷
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
