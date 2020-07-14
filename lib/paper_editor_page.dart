import 'package:flutter/material.dart';

class PaperEditorPage extends StatefulWidget {
  @override
  State createState() {
    return _PaperEditorState();
  }
}

/// 这里的[parent]是上级页面传来的一个标志，如果为0就代表新建，如果为1就代表是编辑。
class PaperEditorArgs {
  final parent, paper;

  PaperEditorArgs(this.parent, this.paper);
}

class _PaperEditorState extends State {
  @override
  Widget build(BuildContext context) {
    final PaperEditorArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold();
  }
}
