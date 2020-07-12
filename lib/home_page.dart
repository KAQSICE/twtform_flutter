import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            FlutterToast.showToast(
              msg: '这里应该跳转到登陆界面啊',
              gravity: ToastGravity.BOTTOM,
            );
          },
        ),
        title: Text('TWT编辑后台'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 5,
            margin: EdgeInsets.fromLTRB(24, 10, 24, 5),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(22, 27, 22, 27),
              leading: Image.asset('images/new.png'),
              title: Text('新建'),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.fromLTRB(24, 5, 24, 5),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(22, 27, 22, 27),
              leading: Image.asset('images/part.png'),
              title: Text('我参与的'),
              trailing: Image.asset('images/arrow.png'),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.fromLTRB(24, 5, 24, 5),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(22, 27, 22, 27),
              leading: Image.asset('images/create.png'),
              title: Text('我创建的'),
              trailing: Image.asset('images/arrow.png'),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.fromLTRB(24, 5, 24, 5),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(22, 27, 22, 27),
              leading: Image.asset('images/star.png'),
              title: Text('我收藏的'),
              trailing: Image.asset('images/arrow.png'),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.fromLTRB(24, 5, 24, 5),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(22, 27, 22, 27),
              leading: Image.asset('images/trash.png'),
              title: Text('回收站'),
              trailing: Image.asset('images/arrow.png'),
            ),
          ),
        ],
      ),
    );
  }
}
