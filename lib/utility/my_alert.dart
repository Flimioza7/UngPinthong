import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ungpinthong/utility/my_style.dart';

Widget showtitle(String title) {
  return ListTile(
    leading: Icon(
      Icons.add_alert,
      color: MyStyle().textColor,
      size: 36.0,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: MyStyle().textColor,
        fontSize: MyStyle().h1,
      ),
    ),
  );
}

Widget okbutton(BuildContext context) {
  return FlatButton(
    child: Text('ok'),onPressed: (){
      Navigator.of(context).pop();
    },
  );
}

Future<void> numaldialog(
    BuildContext context, String title, String message) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: showtitle(title),
          content: Text(message),
          actions: <Widget>[okbutton(context)],
        );
      });
}
