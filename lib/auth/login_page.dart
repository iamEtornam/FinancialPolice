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
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/images/bg_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ),
      )
    );
  }
}

