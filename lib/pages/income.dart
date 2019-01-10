import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income'),
        backgroundColor: Colors.pink,
        elevation: 1.0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add',
        style: TextStyle(
          fontFamily: 'Champagne_Limousines'
        ),
        ),
        icon: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: < Widget > [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Income',
                        hintStyle: TextStyle(
                          fontFamily: 'Champagne_Limousines'
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 10.0),
                    child: ButtonTheme(
                    buttonColor: Colors.pink,
                    minWidth: double.infinity,
                    height: 45.0,
                    child: MaterialButton(
                      color: Colors.pink,
                      onPressed: () {},
                      child: Text('Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Champagne_Limousines'
                        ), 
                        ),
                    ),
                  ),
                  )
                ],
              );
            }
          );
        },
      ),
    );
  }
}