import 'package:flutter/cupertino.dart';
import 'package:shopping_app/strings.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Text(profile),
      ),
    );
  }
}
