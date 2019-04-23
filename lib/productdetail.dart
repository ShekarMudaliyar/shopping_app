import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/strings.dart';

class ProductDetailPage extends StatefulWidget {
  final detail;
  ProductDetailPage({this.detail});
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _iconsize = 30.0;
  @override
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var text = widget.detail['name'];

    var titleText = new Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: new Center(
          child: new RotatedBox(
              quarterTurns: 3,
              child: new AutoSizeText(
                text ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 8.0),
              ))),
    );
    var icons = new Container(
        margin: EdgeInsets.only(top: 10.0),
        child: new Column(
          children: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: _iconsize,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: _iconsize,
              ),
              onPressed: () {},
            ),
          ],
        ));
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: new Icon(Icons.shopping_cart),
          backgroundColor: Color(0xFF383838),
          foregroundColor: secondaryColor,
        ),
        body: new Row(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new Container(
                color: secondaryColor,
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
                  color: primaryColor,
                ),
                child: new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new SizedBox(
                        height: height / 2,
                        child: new Image.asset(
                          widget.detail['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(left: 10.0, top: 10.0),
                        child: new Text(
                          text,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
