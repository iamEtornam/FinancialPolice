import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State < BalancePage > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('Balance Records'),
        backgroundColor: Colors.pink,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('Add',
          style: TextStyle(
            fontFamily: 'Champagne_Limousines',
          ), 
          ),
          onPressed: (){},
      ),
    );
  }
}