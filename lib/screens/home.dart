import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ungpinthong/screens/register.dart';
import 'package:ungpinthong/utility/my_alert.dart';
import 'package:ungpinthong/utility/my_style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Field
  final formkey = GlobalKey<FormState>();
  String user = password;

  // Method

  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        shape: MyStyle().curveButton,
        color: MyStyle().textColor,
        child: Text(
          'Sign In',
          style: MyStyle().myWhiteTextStyle,
        ),
        onPressed: () {
          formkey.currentState.save(); //get data formkey 
          print('user=$user,password = $password');
          checkauthan();
        },
      ),
    );
  }

  Future<void> checkauthan()async{   //ตรวจสอบช่องว่าง
   
        if ((user.isEmpty)||(password.isEmpty)) {
          // Have space
          numaldialog(context, 'ข้อมูลถุกต้อง', 'กรุณากรอกข้อมูล');
          
          // numaldialog
        } else {
          // no space
        }

  }


  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        shape: MyStyle().curveButton,
        borderSide: BorderSide(color: MyStyle().textColor),
        child: Text(
          'Sign Up',
          style: TextStyle(color: MyStyle().textColor),
        ),
        onPressed: () {
          print('You Click SignUp');

          // Create Route Arrow Back
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) {
            return Register();
          });
          Navigator.of(context).push(materialPageRoute);
        },
      ),
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          signInButton(),
          SizedBox(
            width: 4.0,
          ),
          signUpButton(),
        ],
      ),
    );
  }

  Widget userText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyStyle().textColor,
            ),
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          labelText: 'User :',
          labelStyle: TextStyle(color: Colors.white),
        ),
        onSaved: (value) {
          user = value.trim();
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        obscureText: true,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MyStyle().textColor)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.white),
        ),onSaved: (value){
        password = value.trim();
        },
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 100.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Film LAF',
      style: TextStyle(
        fontSize: MyStyle().h1,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: MyStyle().textColor,
        fontFamily: MyStyle().nameFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/wallpaper.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: MyStyle().myPadding,
              color: Color.fromARGB(100, 0, 0, 0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    showLogo(),
                    showAppName(),
                    userText(),
                    passwordText(),
                    SizedBox(
                      height: 8.0,
                    ),
                    showButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
