import 'package:financial_police/db_helper/database_helper.dart';
import 'package:financial_police/model/category.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State < CategoryPage > {
  final myController = TextEditingController();
  List categories;
  var db = new DatabaseHelper();
  int count;
  List < Category > items = new List();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Future saveCategory(String text) async {
    if (text != null) {
      await db.saveCategory(new Category(text, DateTime.now().millisecondsSinceEpoch));

      db.getAllCategory().then((categories){
setState(() {
  items.clear();
  categories.forEach((category){
    items.add(Category.fromMap(category));
  });
});
      });

      Fluttertoast.showToast(
        msg: "Saved",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white
      );
    } else {
      Fluttertoast.showToast(
        msg: "Please, Enter a Category",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white
      );
    }






    print('=== getAllCategory() ===');
    categories = await db.getAllCategory();
    categories.forEach((category) => print(category));

  }

  @override
  void initState() {
    super.initState();
    db.getAllCategory().then((categories) {
      setState(() {
        categories.forEach((category) {
          items.add(Category.fromMap(category));
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
        backgroundColor: Colors.pink,
        elevation: 1.0,
      ),
      body: ListView.builder(
        itemCount: items.length == null ? 0 : items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index].name}',
              softWrap: true,
              style: TextStyle(
                fontFamily: 'Champagne_Limousines'
              ),
               ),
          );
        },
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

                          controller: myController,
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
                            onPressed: () async {
                              print(myController.text);

                              saveCategory(myController.text);

                            },
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