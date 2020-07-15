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
          ListView(
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
              //TODO:这里动态添加题目Card
              Container(
                margin: EdgeInsets.fromLTRB(84, 5, 84, 5),
                child: RaisedButton.icon(
                  color: Colors.lightBlueAccent,
                  icon: Icon(Icons.add_circle),
                  label: Text('添加题目'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/question_type_page');
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
          Expanded(
            child: Align(
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
          ),
        ],
      ),
    );
  }
}
