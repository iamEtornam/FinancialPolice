import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State < CategoryPage > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
        backgroundColor: Colors.pink,
        elevation: 1.0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add',
          style: TextStyle(
            fontFamily: 'Champagne_Limousines',
          )),
        backgroundColor: Colors.pink[300],
        icon: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add New Category',
                style: TextStyle(
                  fontFamily: 'Champagne_Limousines',
                )
              ),
              content: SingleChildScrollView(
                child: Container(
                height: 150.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  children: < Widget > [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Category name',
                          hintStyle: TextStyle(
                            fontFamily: 'Champagne_Limousines',
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
                            ), ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              )
            )
          );
        },
      ),
    );
  }
}