import 'package:financial_police/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_view/pin_code_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State < AuthPage > {
  static final String isSavedMain = "isSavedMain";
    static final String isAuth = "isAuth";
  bool authState = false;
  static String passcode;

  static Future < String > getPinAction() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    passcode = prefs.getString(isSavedMain);
    print('passget: $passcode');
    return passcode;
  }

   static Future < bool > setIsAuth(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isAuth, value);
  }

  @override
    void initState() {
      getPinAction();
      super.initState();
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
          'Entyer your Pin to continue',
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
          _validatePin(code);
        },
      ),
    );
  }

  void _validatePin(code) {
    print('pass: $passcode');
    if (code == passcode) {
      setIsAuth(true);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomePage()
      ));
    } else {
      setIsAuth(false);
      Fluttertoast.showToast(
        msg: "Wrong Pin",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white
      );
    }
  }
}