
import 'package:financial_police/pages/pincode_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State < SettingPage > {
  var countries;
  var isLoading = false;
  final isSetPref = "isSet";
  List list = List();

  bool _switch = false;

  @override
  void initState() {
    _fetchData();
    getPinAction();
    super.initState();
  }

  void _onChanged(bool value) {
    setState(() {
      _switch = value;
    if(value == true){
     Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => PinCodeSet()
    ));
    }
    });
  }

  // Future < bool > setPinAction(bool value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if(value == true){
  //    Navigator.push(context, MaterialPageRoute(
  //     builder: (context) => PinCodeSet()
  //   ));
  //   }
  //   return prefs.setBool(isSetPref, value);
  // }

  Future < bool > getPinAction() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _switch = prefs.getBool(isSetPref) ?? false;
    return _switch;
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    String jsonCurrency = await _loadCurrenciesJson();
    list = json.decode(jsonCurrency) as List;
   // print(list);

    setState(() {
      isLoading = false;
    });
  }

  Future < String > _loadCurrenciesJson() async {
    return await DefaultAssetBundle.of(context).loadString('assets/data/currencies.json');
  }

  void currencyDialog(BuildContext context) {
    showDialog < bool > (
      context: context,
      builder: (context) {
        return Material(
          child: isLoading ?
          Center(
            child: CircularProgressIndicator(),
          ) :
          ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: list == null ? 0 : list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(list[index]['name'],
                  style: TextStyle(
                    fontFamily: 'Champagne_Limousines',
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0
                  ),
                ),
                subtitle: Text(list[index]['name_plural'],
                  style: TextStyle(
                    fontFamily: 'Champagne_Limousines'
                  ),
                ),
                trailing: Text(list[index]['symbol'],
                  style: TextStyle(
                    fontFamily: 'Champagne_Limousines'
                  ), ),
              );
            },

          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('Settings'),
        backgroundColor: Colors.pink
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: < Widget > [
            ListTile(
              title: Text('Change Currency',
                style: TextStyle(
                  fontFamily: 'Champagne_Limousines'
                ),
              ),
              subtitle: Text('current currency: GH₵',
                style: TextStyle(
                  fontFamily: 'Champagne_Limousines'
                ),
              ),
              onTap: () {
                currencyDialog(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Set PIN',
                style: TextStyle(
                  fontFamily: 'Champagne_Limousines'
                ),
              ),
              subtitle: Text('protect your data from others',
                style: TextStyle(
                  fontFamily: 'Champagne_Limousines'
                ),
              ),
              trailing: Switch(
                value: _switch,
                onChanged: _onChanged,
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('Privacy Policy',
                style: TextStyle(
                  fontFamily: 'Champagne_Limousines'
                ),
              ),
              subtitle: Text('data protection policy and usage',
                style: TextStyle(
                  fontFamily: 'Champagne_Limousines'
                ),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('Terms & Conditions',
                style: TextStyle(
                  fontFamily: 'Champagne_Limousines'
                ),
              ),
              subtitle: Text('an outline of the T&C of this App',
                style: TextStyle(
                  fontFamily: 'Champagne_Limousines'
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}