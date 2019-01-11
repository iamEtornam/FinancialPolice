import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State < LoginPage > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: new BoxDecoration(color: Colors.black45),
         child: BackdropFilter(
           filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
           child: Image.asset('assets/images/bg_image.jpg',
         fit: BoxFit.cover,
         height: double.infinity,
         width: double.infinity,
         alignment: Alignment.center,
         ),
         )
        ),
      )
    );
  }
}