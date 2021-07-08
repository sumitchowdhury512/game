import 'package:flutter/material.dart';

class customdialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText;
  const customdialog({required this.title,required this.content, required this.callback, this.actionText="Reset"});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        new TextButton(onPressed: callback,
            child: Text(actionText),
        )
      ],
    );
  }
}
