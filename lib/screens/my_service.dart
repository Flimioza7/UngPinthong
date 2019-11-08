import 'package:flutter/material.dart';
import 'package:ungpinthong/models/user_model.dart';
import 'package:ungpinthong/widget/Page1.dart';
import 'package:ungpinthong/widget/page2.dart';
import 'package:ungpinthong/widget/page3.dart';

class Myservice extends StatefulWidget {
  final Usermodel usermodel;
  Myservice({Key key, this.usermodel}) : super(key: key); //รับค่า

  @override
  _MyserviceState createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  // field
  Usermodel myusermodel;
  Widget currenwiget = Page1();
  //Method

  Widget menupage1() {
    return ListTile(
      leading: Icon(
        Icons.filter_1,
        size: 36.0,
        color: Colors.pink,
      ),
      title: Text('Page1'),
      subtitle: Text('Detail Of Page1'),
      onTap: () {setState(() {
       currenwiget = Page1(); 
      });
        Navigator.of(context).pop();
      },
    );
  }

  Widget menupage2() {
    return ListTile(
      leading: Icon(Icons.filter_2, size: 36.0, color: Colors.blue),
      title: Text('Read Bracode'),
      subtitle: Text('Detail Of Bracode'),
      onTap: () {setState(() {
       currenwiget = Page2(); 
      });
        Navigator.of(context).pop();
      },
    );
  }

  Widget menupage3() {
    return ListTile(
      leading: Icon(
        Icons.filter_3,
        size: 36.0,
        color: Colors.green,
      ),
      title: Text('Page1'),
      subtitle: Text('Detail Of Page3'),
      onTap: () {setState(() {
       currenwiget = Page3(); 
      });
        Navigator.of(context).pop();
      },
    );
  }

  Widget headerdrawer() {
    return DrawerHeader(
      child: Column(
        children: <Widget>[showlogo(), showlogin()],
      ),
    );
  }

  Widget showlogin() {
    return Text('Login By ${myusermodel.name}');
  }

  Widget showlogo() {
    return Container(
      height: 80.0,
      child: Image.asset('images/logo1.png'),
    );
  }

  Widget showdrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headerdrawer(),
          menupage1(),
          menupage2(),
          menupage3(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    myusermodel = widget.usermodel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My service'),
      ),
      body: currenwiget,
      drawer: showdrawer(),
    );
  }
}
