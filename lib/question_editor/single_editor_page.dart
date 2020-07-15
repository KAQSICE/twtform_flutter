import 'package:flutter/material.dart';

class SingleEditorPage extends StatefulWidget {
  @override
  State createState() {
    return _SingleEditorState();
  }
}

class SingleEditorArgs {}

class _SingleEditorState extends State {
  final List<String> options = <String>['', '', ''];

  @override
  Widget build(BuildContext context) {
    final SingleEditorArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('编辑单选题'),
        centerTitle: true,
      ),
      body: ListView(
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
                print(text);
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
            itemCount: options.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.fromLTRB(27, 0, 27, 10),
                title: Align(
                  child: TextFormField(
                    initialValue: options.elementAt(index),
                    onChanged: (text) {
                      setState(() {
                        options.removeAt(index);
                        options.insert(index, text);
                      });
                      print(options.elementAt(index));
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: '请输入题面',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      for (String s in options) {
                        print('移除$s');
                      }
                      options.removeAt(index);
                    });
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
