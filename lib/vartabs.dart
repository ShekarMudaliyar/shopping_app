import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/cart.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/home.dart';
import 'package:shopping_app/profile.dart';
import 'package:shopping_app/search.dart';
import 'package:shopping_app/strings.dart';

class VerTabs extends StatefulWidget {
  @override
  _VerTabsState createState() => _VerTabsState();
}

class _VerTabsState extends State<VerTabs> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new HomePage(),
    new SearchPage(),
    new CartPage(),
    new ProfilePage(),
  ];
  var text = title;
  double _iconsize = 30.0;
  @override
  Widget build(BuildContext context) {
    var titleText = new Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: new Center(
          child: new RotatedBox(
              quarterTurns: 3,
              child: new AutoSizeText(
                text,
                style: TextStyle(
                    color: mat,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    wordSpacing: 10.0,
                    letterSpacing: 8.0),
              ))),
    );
    var icons = new Container(
        margin: EdgeInsets.only(top: 10.0),
        child: new Column(
          children: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.home,
                size: _iconsize,
                color: mat,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                  text = title;
                });
              },
            ),
            new IconButton(
              icon: Icon(
                Icons.search,
                size: _iconsize,
                color: mat,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                  text = search;
                });
              },
            ),
            new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: _iconsize,
                color: mat,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                  text = cart;
                });
              },
            ),
            new IconButton(
              icon: Icon(
                Icons.person,
                size: _iconsize,
                color: mat,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                  text = profile;
                });
              },
            ),
          ],
        ));
    return new SafeArea(
      child: new Scaffold(
        body: new Row(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new Container(
                color: primaryColor,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[icons, titleText],
                ),
              ),
            ),
            new Expanded(
              flex: 4,
              child: new Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                ),
                child: _children[_currentIndex],
              ),
            )
          ],
        ),
      ),
    );
  }
}
