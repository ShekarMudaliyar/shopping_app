import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/cart.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/detail.dart';
import 'package:shopping_app/review.dart';
import 'package:shopping_app/strings.dart';

class ProductDetailPage extends StatefulWidget {
  final detail;
  ProductDetailPage({this.detail});
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _iconsize = 30.0;
  var _currindex = 0;
  var _show = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var text = widget.detail['name'];
    List<Widget> list = [
      new Detail(height: height, width: width, detail: widget.detail),
      new ReviewPage(),
      new CartPage()
    ];
    var titleText = new Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: new Center(
          child: new RotatedBox(
              quarterTurns: 3,
              child: new AutoSizeText(
                text ?? "",
                style: TextStyle(
                    color: mat,
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
                color: mat,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            new IconButton(
              icon: Icon(
                Icons.rate_review,
                size: _iconsize,
                color: mat,
              ),
              onPressed: () {
                setState(() {
                  _currindex = 1;
                });
              },
            ),
          ],
        ));
    var floatingbut = FloatingActionButton(
      child: new Icon(Icons.shopping_cart),
      backgroundColor: Color(0xFF383838),
      foregroundColor: secondaryColor,
      onPressed: () {
        setState(() {
          _show = false;
          _currindex = 2;
        });
      },
    );
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _show ? floatingbut : null,
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
            new Expanded(flex: 4, child: list[_currindex])
          ],
        ),
      ),
    );
  }
}
