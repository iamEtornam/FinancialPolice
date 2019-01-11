import 'package:financial_police/pages/about_app.dart';
import 'package:financial_police/pages/about_dev.dart';
import 'package:financial_police/pages/auth_page.dart';
import 'package:financial_police/pages/balance_page.dart';
import 'package:financial_police/pages/category.dart';
import 'package:financial_police/pages/expense.dart';
import 'package:financial_police/pages/expense_page.dart';
import 'package:financial_police/pages/income.dart';
import 'package:financial_police/pages/records_overview_page.dart';
import 'package:financial_police/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State < HomePage > {
  static final String isPinSaved = "isPinSaved";
  static final String isAuth = "isAuth";
  bool authActive = false;
  bool authSuccess = false;

  Future < bool > getPinAction() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    authActive = prefs.getBool(isPinSaved);
    authSuccess = prefs.getBool(isAuth);
    if (authActive == true && authSuccess == false) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => AuthPage()
      ));
    }
    print(authActive);
    return authActive;
  }

  static Future < bool > setIsAuth(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isAuth, value);
  }

  Future < bool > _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?',
          style: TextStyle(
            fontFamily: 'Champagne_Limousines'
          )),
        content: new Text('Do you want to exit an App🚶',
          style: TextStyle(
            fontFamily: 'Champagne_Limousines'
          )),
        actions: < Widget > [
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No👎',
              style: TextStyle(
                fontFamily: 'Champagne_Limousines'
              )),
          ),
          new FlatButton(
            onPressed: () {
              setIsAuth(false);
              Navigator.of(context).pop(true);
            },
            child: new Text('Yes👍',
              style: TextStyle(
                fontFamily: 'Champagne_Limousines'
              )),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  void initState() {
    super.initState();
    getPinAction();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size.width;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Financial Police'),
          elevation: 1.0,
          actions: < Widget > [
            IconButton(icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                showDialog(context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Category',
                      style: TextStyle(
                        fontFamily: 'Champagne_Limousines'
                      ), ),
                    content: SingleChildScrollView(
                      child: Container(
                      height: 160.0,
                      child: Column(
                        children: < Widget > [
                          Row(
                            children: < Widget > [
                              Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(Icons.attach_money),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(
                                      builder: (context) => IncomePage()
                                    ));
                                  },
                                  child: Text('Income',
                                    style: TextStyle(
                                      fontFamily: 'Champagne_Limousines'
                                    ), )
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: < Widget > [
                              Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(Icons.money_off),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(
                                      builder: (context) => ExpensePage()
                                    ));
                                  },
                                  child: Text('Expense',
                                    style: TextStyle(
                                      fontFamily: 'Champagne_Limousines'
                                    ), )
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: < Widget > [
                              Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(Icons.category, ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(
                                      builder: (context) => CategoryPage()
                                    ));
                                  },
                                  child: Text('New Category',
                                    style: TextStyle(
                                      fontFamily: 'Champagne_Limousines'
                                    ), )
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    ),
                  ));
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
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
                              child: Icon(Icons.settings),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16.0, 3.0, 3.0, 3.0),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) => SettingPage()
                                  ));
                                },
                                child: Text('Settings',
                                  style: TextStyle(
                                    fontFamily: 'Champagne_Limousines'
                                  ), )
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                          child: Divider(
                            color: Colors.black,
                            height: 2.0,
                          ),
                        ),
                        Row(
                          children: < Widget > [
                            Padding(
                              padding: EdgeInsets.fromLTRB(16.0, 3.0, 3.0, 3.0),
                              child: Icon(Icons.info)
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16.0, 3.0, 3.0, 3.0),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) => AboutApp()
                                  ));
                                },
                                child: Text('About App',
                                  style: TextStyle(
                                    fontFamily: 'Champagne_Limousines'
                                  ), )
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                          child: Divider(
                            color: Colors.black,
                            height: 2.0,
                          ),
                        ),
                        Row(
                          children: < Widget > [
                            Padding(
                              padding: EdgeInsets.fromLTRB(16.0, 3.0, 3.0, 3.0),
                              child: Icon(Icons.person)
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16.0, 3.0, 3.0, 3.0),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) => AboutDev()
                                  ));
                                },
                                child: Text('About Developer',
                                  style: TextStyle(
                                    fontFamily: 'Champagne_Limousines'
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
              tooltip: 'more options',
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: < Widget > [
              Expanded(
                child: InkWell(
                   onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => BalancePage()
                    ));
                  },
                  child: ListTile(
                  title: Text('Balance:',
                    style: TextStyle(
                      fontFamily: 'Champagne_Limousines'
                    ), ),
                  subtitle: Text('GH₵2905',
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Champagne_Limousines',
                    ),
                     ),
                ),
                )
              ),
              Expanded(
                child: InkWell(
                   onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ExpenseOverPage()
                    ));
                  },
                  child: ListTile(
                  title: Text('Expense:',
                    style: TextStyle(
                      fontFamily: 'Champagne_Limousines'
                    ), ),
                  subtitle: Text('GH₵7880',
                    softWrap: true,
                    style: TextStyle(
                      fontFamily: 'Champagne_Limousines',
                      color: Colors.red
                    ),
                     ),
                ),
                )
              ),
              Expanded(
                child: InkWell(
                  child:  IconButton(
                  icon: Icon(Icons.remove_red_eye,
                    color: Colors.red, ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => RecordsOverviewPage()
                    ));
                  },
                ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: < Widget > [
            Center(
              child: ListTile(
                title: Icon(Icons.account_balance_wallet,
                  size: 64.0,
                  color: Colors.grey,
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(left: size / 3.5),
                  child: Text('Waste No Money!',
                    style: TextStyle(
                      fontFamily: 'Champagne_Limousines',
                      fontSize: 16.0
                    ),
                  )
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}