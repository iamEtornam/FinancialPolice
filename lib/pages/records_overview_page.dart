import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class RecordsOverviewPage extends StatefulWidget {
  _RecordsOverviewPageState createState() => _RecordsOverviewPageState();
}

class _RecordsOverviewPageState extends State < RecordsOverviewPage > {
RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('Records Overview'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          ListTile(
            title: Text('Last records overview',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Champagne_Limousines',
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text('LAST 30 DAYS',
              style: TextStyle(
                fontFamily: 'Champagne_Limousines',
                fontSize: 14.0,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.black,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: < Widget > [
                        Row(
                          children: < Widget > [
                            Padding(
                              padding: EdgeInsets.fromLTRB(16.0, 3.0, 3.0, 3.0),
                              child: Icon(Icons.import_export)
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16.0, 3.0, 3.0, 3.0),
                              child: MaterialButton(
                                onPressed: () {
                       
                                },
                                child: Text('Export Records',
                                  style: TextStyle(
                                    fontFamily: 'Champagne_Limousines',
                                    fontSize: 18.0
                                  ), )
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  }
                );
              },
            ),
          ),
          Divider(),
          Expanded(
            child: Container(
            height: height,
            child: ListView.separated(
              itemCount: 30,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Financial Expense$index',
                      softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Champagne_Limousines'
                    ),
                  ),
                  Text('GH₵2,568.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Champagne_Limousines'
                    ),
                  )
                    ],
                  ),
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('cash',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Champagne_Limousines'
                    ),
                  ),
                  Text('09/01/2019',
                    style: TextStyle(
                     fontWeight: FontWeight.bold,
                      fontFamily: 'Champagne_Limousines'
                    ),
                  )
                    ],
                  ),
                  leading: Material(
                    shape: CircleBorder(),
                    color:  _randomColor.randomColor(),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.train,
                        color: Colors.white,
                        size: 30.0, ),
                    ),
                  ),
                );
              },
            ),
          ),
          )
          ],
        ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15.0),
        child: Text('show more',
        style: TextStyle(
          fontFamily: 'Champagne_Limousines',
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          decoration: TextDecoration.underline
        ),),
      ),

    );
  }
}