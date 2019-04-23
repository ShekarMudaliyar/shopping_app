import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/colors.dart';
import 'list.dart';
import 'cardconfig.dart';

// import 'package:square_in_app_payments/models.dart';
// import 'package:square_in_app_payments/in_app_payments.dart';
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var side = 5.0;
  List data = items;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    matbutton(String text, Function fun) {
      return new RaisedButton(
        elevation: 1.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: new Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        color: secondaryColor,
        onPressed: fun,
      );
    }

    var clip = new ClipPath(
      child: new Container(
        decoration: BoxDecoration(color: secondaryColor),
      ),
      clipper: Header(),
    );
    var totalcard = new Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(side),
              bottomRight: Radius.circular(side))),
      child: new Container(
        decoration: BoxDecoration(
            color: mat,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(side),
                bottomRight: Radius.circular(side))),
        height: 50.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new AutoSizeText(
              "Total: 500.0",
              maxLines: 2,
              style: TextStyle(color: primaryColor),
            ),
            matbutton("Pay", payment)
          ],
        ),
      ),
    );
    var listitem = new ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return new ListTile(
          leading: new CircleAvatar(
            backgroundImage: new AssetImage(data[index]['image']),
          ),
          title: new Text(data[index]['name']),
          trailing: new Text(data[index]['price']),
        );
      },
    );
    var cartcard = new Padding(
      padding: EdgeInsets.only(
          top: height / 15, right: 10.0, left: 10.0, bottom: 20.0),
      child: Stack(
        children: <Widget>[
          new Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(side),
                    bottomRight: Radius.circular(side),
                    topLeft: Radius.circular(side),
                    topRight: Radius.circular(side))),
            elevation: 2.0,
            color: primaryColor,
            child: Column(
              children: <Widget>[
                new Expanded(child: listitem),
                new Container(
                  height: 50.0,
                )
              ],
            ),
          ),
          new Positioned(bottom: 0, left: 0, right: 0, child: totalcard)
        ],
      ),
    );

    return new Scaffold(
      body: Stack(
        children: <Widget>[clip, cartcard],
      ),
    );
  }
}

class Header extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 300);
    path.lineTo(size.width, size.height - 400);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
