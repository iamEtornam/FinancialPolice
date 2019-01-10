import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State < AboutApp > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About App'),
        elevation: 1.0,
        backgroundColor: Colors.pink
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: < Widget > [
              Text('Financial Police👮💰',
                style: TextStyle(
                  fontFamily: 'Champagne_Limousines',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10.0, ),
              Text('version 1.0',
                style: TextStyle(
                  fontFamily: 'Champagne_Limousines',
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 30.0, ),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: < Widget > [
                    Text('Rate App',
                      style: TextStyle(
                        fontFamily: 'Champagne_Limousines',
                        fontSize: 18.0,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 40.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 40.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 40.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 40.0,
                    ),
                    Icon(
                      Icons.star_half,
                      color: Colors.yellow,
                      size: 40.0,
                    ),
                  ],
                ),
                onTap: () {
                 LaunchReview.launch();
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}