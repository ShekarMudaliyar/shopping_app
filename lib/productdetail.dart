import 'package:flutter/material.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/strings.dart';

class ProductDetailPage extends StatefulWidget {
  final String titletext;
  ProductDetailPage({this.titletext});
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _iconsize = 30.0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var text = widget.titletext;

    var titleText = new Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: new Center(
          child: new RotatedBox(
              quarterTurns: 3,
              child: new Text(
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
                        child: new Image.network(
                          'https://static1.squarespace.com/static/570ea986a3360c29db3c44ec/t/5b43d2c9758d46c3864db607/1531171536238/Pineapple+White+on+Black%2C+Webstie.jpg',
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
