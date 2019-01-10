import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDev extends StatefulWidget {
  @override
  _AboutDevState createState() => _AboutDevState();
}

class _AboutDevState extends State < AboutDev > {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Developer'),
        elevation: 1.0,
        backgroundColor: Colors.pink
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: < Widget > [
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/ic_avatar.png')
                )
              ),
            ),
            Text('Etornam Sunu Bright',
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'Champagne_Limousines',
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5.0, ),
            GestureDetector(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: < Widget > [
                  Icon(
                    Icons.mail
                  ),
                  SizedBox(width: 8.0, ),
                  Text('sunumacbright@gmail.com',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Champagne_Limousines',
                      decoration: TextDecoration.underline
                    ), )
                ],
              ),
              onTap: () async {
                    const url = 'mailto:sunumacbright@gmail.com?subject=Mail%20from%20Financial%20Police&body=Hi%20there';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
            ),
            SizedBox(height: 8.0, ),
            GestureDetector(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: < Widget > [
                  Icon(
                    Icons.phone
                  ),
                  SizedBox(width: 8.0, ),
                  Text('+233-245-436-757',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Champagne_Limousines',
                      decoration: TextDecoration.underline
                    ), )
                ],
              ),
              onTap: () async {
                    const url = 'tel:+233245436757';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
            ),
            SizedBox(height: 15.0, ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: < Widget > [
                GestureDetector(
                  child: Image.asset('assets/images/ic_twitter.png',
                    height: 40.0,
                    width: 40.0, ),
                  onTap: () async {
                    const url = 'https://twitter.com/_regnex';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
                ),
                     SizedBox(width: 8.0,),
                GestureDetector(
                  child: Image.asset('assets/images/ic_github.png',
                    height: 40.0,
                    width: 40.0, ),
                  onTap: () async {
                    const url = 'https://github.com/RegNex';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
                ),
                     SizedBox(width: 8.0,),
                GestureDetector(
                  child: Image.asset('assets/images/ic_linkedin.png',
                    height: 40.0,
                    width: 40.0, ),
                  onTap: () async {
                    const url = 'https://www.linkedin.com/in/etornam-sunu/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
                ),
                SizedBox(width: 8.0,),
                GestureDetector(
                  child: Image.asset('assets/images/ic_medium.png',
                    height: 40.0,
                    width: 40.0, ),
                  onTap: () async {
                    const url = 'https://medium.com/@EtornamSunu';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
                ),
                    
              ],
            ),
          ],
        ),
      ),
    );
  }
}