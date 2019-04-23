import 'package:flutter/material.dart';
import 'package:shopping_app/colors.dart';

class Detail extends StatelessWidget {
  final height;
  final width;
  final detail;
  Detail({this.height, this.width, this.detail});
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new SizedBox(
              height: height / 2,
              child: new Image.asset(
                detail['image'],
                fit: BoxFit.cover,
              ),
            ),
            new Container(
              margin: EdgeInsets.only(left: 10.0, top: 10.0),
              child: new Text(
                detail['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: new Text(
                  "Quickly ship features with a focus on native end-user experiences. Layered architecture allows for full customization, which results in incredibly fast rendering and expressive and flexible designs."),
            ),
          ],
        ),
      ),
    );
  }
}
