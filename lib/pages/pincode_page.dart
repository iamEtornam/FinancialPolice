import 'package:financial_police/pages/pincode_confirm_page.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_view/pin_code_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PinCodeSet extends StatefulWidget {
  @override
  _PinCodeSetState createState() => _PinCodeSetState();
}

class _PinCodeSetState extends State < PinCodeSet > {
  static final String isSaved1 = "isSaved1";

  static Future < bool > setPinAction(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(isSaved1, value);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PinCode(
        title: Text(
          "Authenticate",
          style: TextStyle(
            color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),

        subTitle: Text(
          'Enter the pin code',
          style: TextStyle(color: Colors.white,
            fontFamily: 'Champagne_Limousines')
        ),
        codeLength: 4,
        obscurePin: true,
        keyTextStyle: TextStyle(
          fontFamily: 'Champagne_Limousines',
          color: Colors.white
        ),
        onCodeEntered: (code) {
          //callback after full code has been entered
          print(code);
          _savePin(code);
        },
      ),
    );
  }

  void _savePin(code) async{
    setPinAction(code);
     Fluttertoast.showToast(
        msg: "Confirm Pin Code",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white
    );
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => PinCodeConfirm()
    ));
  }
}