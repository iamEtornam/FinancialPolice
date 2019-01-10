import 'package:flutter/material.dart';

class ExpenseOverPage extends StatefulWidget {
  _ExpenseOverPageState createState() => _ExpenseOverPageState();
}

class _ExpenseOverPageState extends State<ExpenseOverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        elevation: 1.0,
        title: Text('Expenses Records'),
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
      )
    );
  }
}