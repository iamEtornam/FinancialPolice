import 'dart:ui';
import 'package:financial_police/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/images/bg_image.jpg'),
                  fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'FINANCIAL POLICE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Champagne_Limousines'),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Signup to continue...',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Champagne_Limousines'),
                    ),
                    SizedBox(height: 40.0),
                    SpinKitFadingCircle(
                      itemBuilder: (_, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: index.isEven ? Colors.yellow : Colors.pink,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10.0),
                    FlatButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      color: Colors.white,
                      icon: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      label: Text('signup with Google',
                          style: TextStyle(
                              fontFamily: 'Champagne_Limousines',
                              color: Colors.black)),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
