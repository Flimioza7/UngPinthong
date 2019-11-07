import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ungpinthong/utility/my_style.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

//field
final formkey = GlobalKey<FormState>();
String name, user, password, datestring;

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
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name in the Bank';
        } else {
          return null;
        }
      },onSaved: (value){
        name=value.trim();
      },
    ),
  );
}

Widget userText() {
  return Container(
    margin: EdgeInsets.only(left: 30.0, right: 30.0),
    child: TextFormField(
      keyboardType: TextInputType.emailAddress, //เพิ่ม @
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
        helperText: 'Email ถูกต้อง',
        helperStyle: TextStyle(
          color: Colors.blue,
        ),
        hintText: 'ss@email.com',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณากรอกEmail';
        } else if (!((value.contains('@')) && (value.contains('.')))) {
          return 'กรุณาตรวจสอบอีเมล์';
        } else {
          return null;
        }
      },onSaved: (value){
        user=value.trim();
      },
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
          hintText: 'more 6 charati'),
      validator: (value) {
        if (value.length < 6) {
          return 'pless input ';
        } else {
          return null;
        }
      },onSaved: (value){
        password=value.trim();
      },
    ),
  );
}

Widget showcerrendate() {
  DateTime dateTime = DateTime.now();
  print('DateTime = $dateTime');

  datestring = DateFormat('yyy-MM-dd').format(dateTime);
  print('DateString = $datestring');

  return Text(
    'Date=$datestring',
    style: MyStyle().myTextStyleH2,
  );
}

Widget regsiterBudton(BuildContext context) {
  return IconButton(
    tooltip: 'Uplode to server',
    icon: Icon(Icons.cloud_upload),
    onPressed: () {
      print('You click register');
      if (formkey.currentState.validate()) {
        formkey.currentState.save();
        print('name=$name, user=$user,pass=$password');
        registerthread(context);
      }
    },
  );
}

Future<void>registerthread(BuildContext context)async{
String url='https://www.androidthai.in.th/pint/adduserfilm.php?isAdd=true&name=$name&user=$user&password=$password&regisdate=$datestring';
Response response = await get(url);
print('response=$response');
//var รับค่าอะไรก็ได้
var result = json.encode(response.body);
print('resule=$result');

  if (result.toString()=='true') {
    Navigator.of(context).pop();
  } else {
    
  }

}


class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().textColor,
        title: Text('Register'),
        actions: <Widget>[regsiterBudton(context)],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white, MyStyle().mainColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter //ไล่สีบนลงล่าง
              ),
        ),
        child: Form(
          key: formkey,
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
      ),
    );
  }
}
