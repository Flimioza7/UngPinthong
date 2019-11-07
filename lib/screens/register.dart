import 'package:flutter/material.dart';
import 'package:ungpinthong/utility/my_style.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

//field

//method

Widget nameText() {
  return Container(
    margin: EdgeInsets.only(left: 30.0, right: 30.0),
    child: TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.face,
            size: 36.0,
            color: Colors.red,
          ),
          labelText: 'Display Name',
          labelStyle: TextStyle(
            color: Colors.red,
          ),
          helperText: 'imput data',
          helperStyle: TextStyle(
            color: Colors.red,
          )),
    ),
  );
}

Widget userText() {
  return Container(
    margin: EdgeInsets.only(left: 30.0, right: 30.0),
    child: TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.account_box,
            size: 36.0,
            color: Colors.blue,
          ),
          labelText: 'User Name',
          labelStyle: TextStyle(
            color: Colors.blue,
          ),
          helperText: 'imput Name',
          helperStyle: TextStyle(
            color: Colors.blue,
          )),
    ),
  );
}

Widget passwordText() {
  return Container(
    margin: EdgeInsets.only(left: 30.0, right: 30.0),
    child: TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: Colors.green,
          ),
          labelText: 'Display Password',
          labelStyle: TextStyle(
            color: Colors.green,
          ),
          helperText: 'imput Password',
          helperStyle: TextStyle(
            color: Colors.green,
          ),
          hintText: 'more 6 charatir'),
    ),
  );
}

Widget showcerrendate() {
  DateTime dateTime = DateTime.now();
  print('DateTime = $dateTime');

  String datestring = DateFormat('yyy-MM-dd').format(dateTime);
  print('DateString = $datestring');

  return Text(
    'Date=$datestring',
    style: MyStyle().myTextStyleH2,
  );
}

Widget regsiterBudton() {
  return IconButton(
    tooltip: 'Uplode to server',
    icon: Icon(Icons.cloud_upload),
    onPressed: () {},
  );
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().textColor,
        title: Text('Register'),
        actions: <Widget>[regsiterBudton()],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white,Colors.white, MyStyle().mainColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter //ไล่สีบนลงล่าง
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            showcerrendate(),
            SizedBox(
              height: 20.0,
            ),
            nameText(),
            userText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
