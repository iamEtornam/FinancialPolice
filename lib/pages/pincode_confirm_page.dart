import 'package:financial_police/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_view/pin_code_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PinCodeConfirm extends StatefulWidget {
  @override
  _PinCodeConfirmState createState() => _PinCodeConfirmState();
}

class _PinCodeConfirmState extends State < PinCodeConfirm > {
  static final String isSaved1 = "isSaved1";
  static final String isSaved2 = "isSaved2";
  static final String isSavedMain = "isSavedMain";
  static final String isPinSaved = "isPinSaved";
  static final String isSetPref = "isSet";
  static String password1;


   static Future < String > getPassword1() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    password1 = prefs.getString(isSaved1);
    print('passget: $password1');
    return password1;
  }

  static Future < bool > setPinAction(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(password1 == value){
      setActualPinAction(value);
    }else{
       Fluttertoast.showToast(
            msg: "Confirmation Pin wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white
        );
    }
    return prefs.setString(isSaved2, value);
  }

  static Future < bool > setActualPinAction(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('main Pass: $value');
    return prefs.setString(isSavedMain, value);
  }

  static Future < bool > setSwitchAction(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isSetPref, value);
  }

  static Future < bool > setAuthState(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isPinSaved, true);
  }

  @override
    void initState() {
   getPassword1();
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
          'Confirm your pin code',
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

  void _validatePin(code) async{
    setPinAction(code);
    setSwitchAction(true);
    setAuthState(true);
        Fluttertoast.showToast(
            msg: "Pin code is set successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white
        );
        Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => HomePage()
    ));
      }
    }
    