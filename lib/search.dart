import 'package:flutter/cupertino.dart';
import 'package:shopping_app/strings.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Text(search),
      ),
    );
  }
}
