import 'package:flutter/material.dart';
import 'package:shopping_app/cart.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/home.dart';
import 'package:shopping_app/profile.dart';
import 'package:shopping_app/search.dart';
import 'package:shopping_app/strings.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new HomePage(),
    new SearchPage(),
    new CartPage(),
    new ProfilePage(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(title,
            style: TextStyle(
              color: secondaryColor,
            )),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        fixedColor: primaryColor,
        iconSize: 20.0,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }
}
