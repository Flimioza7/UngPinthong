

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:ungpinthong/utility/my_style.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}


class _Page2State extends State<Page2> {

//field
String codestring = '';

//method



Widget readQRbudton() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton.icon(
              icon: Icon(Icons.photo_camera),
              label: Text('Read QR Code'),
              onPressed: () {
                readQRthread();
              },
            ),
          ),
        ],
      ),
    ],
  );
}

Future<void> readQRthread()async{
try {
  String readedQR = await BarcodeScanner.scan();
  if (readedQR != null) {
    setState(() {
     codestring=readedQR; 
    });
  }
  
} catch (e) {
}

}

Widget codereaded() {
  return Center(
    child: Text(
      'Code Readed $codestring',
      style: TextStyle(color: MyStyle().textColor, fontSize: MyStyle().h2),
    ),
  );
}

Widget headtitel() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Read Barcode or QR Code',
        style: TextStyle(fontSize: MyStyle().h1),
      ),
    ],
  );
}




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[headtitel(), codereaded(), readQRbudton()],
      ),
    );
  }
}
