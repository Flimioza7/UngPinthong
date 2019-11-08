import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ungpinthong/models/user_model.dart';
import 'package:ungpinthong/screens/my_service.dart';
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
  Usermodel usermodel;

  // Method
  @override
  void initState(){
      super.initState();
      checkinternet();
  }
  Future<void> checkinternet()async{
   try {
     
     var result = await InternetAddress.lookup('google.com');
     //isNotEmpty =ต้องไม่ว่าง
    if ((result.isNotEmpty)&&(result[0].rawAddress.isNotEmpty)) {
      print('internet Connect Success');
    }

   } catch (e) {
     normaldialog(context, 'internet Fail', 'Please Check Interneg');
   }

  }

  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        shape: MyStyle().curveButton,
        color: Colors.lightBlue,
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

  Future<void> checkauthan() async {
    //ตรวจสอบช่องว่าง

    if ((user.isEmpty) || (password.isEmpty)) {
      // Have space
      normaldialog(context, 'ข้อมูลถุกต้อง', 'กรุณากรอกข้อมูล');
    } else {
      // no space get data
      // print('work');
      String url =
          'https://www.androidthai.in.th/pint/getUserWhereUserfilm.php?isAdd=true&User=$user';
      Response response = await get(url);
      var result = json.decode(response.body);
      print('resulr=$result');
      if (result.toString() == 'null') {
        normaldialog(
            context, 'User fail', 'No $user in database'); //ดึงdaialog มาโชว์
      } else {
        for (var map in result) {
          print('map = $map');
          usermodel = Usermodel.fromAPI(map);

          // print('password= $password');
          // print('true password = ${usermodel.password}');

          // Check password
          if (password == usermodel.password) {
            
            // Move To Service
          MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context){return Myservice();});
          Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route){return false;});

          } else {
          normaldialog(context, 'Password Fail', 'plesse try agen ');
          }
        }
      }
    } //if
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        shape: MyStyle().curveButton,
        borderSide: BorderSide(color:Colors.lightBlueAccent),
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
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
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightBlue,
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
              borderSide: BorderSide(color: Colors.lightBlue,)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.white),
        ),
        onSaved: (value) {
          password = value.trim();
        },
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Image.asset('images/logo1.png'),
    );
  }

  Widget showAppName() {
    return Text(
      // 'Living And Facilities',
      'Morino Hotel',
      style: TextStyle(
        fontSize: MyStyle().h1,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.white,
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
              image: AssetImage('images/mo3.jpg'),
              fit: BoxFit.fitHeight,
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
