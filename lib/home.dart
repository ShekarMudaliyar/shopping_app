import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/productdetail.dart';
import 'list.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = items;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final double itemHeight = (height) / 2;
    final double itemWidth = width / 2;
    return Container(
      color: Colors.white,
      child: new GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
            mainAxisSpacing: 1),
        itemBuilder: (context, i) {
          return new InkWell(
              onTap: () {
                print(i);
                Navigator.push(
                    context,
                    new CupertinoPageRoute(
                        builder: (context) => new ProductDetailPage(
                              detail: data[i],
                            )));
              },
              child: new Container(
                height: height / 4,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage(data[i]['image']),
                              fit: BoxFit.fitHeight),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                    ),
                    new Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: new Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 5.0),
                                child: new AutoSizeText(
                                  data[i]['name'],
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.0),
                                child: new Text(
                                  '\$${data[i]['price']}',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        )),
                    new Positioned(
                      bottom: 20,
                      right: 1,
                      // child: Padding(
                      // padding:
                      // const EdgeInsets.only(bottom: 5.0, right: 3.0),
                      child: new Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          child: new IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: mat,
                            ),
                            onPressed: () {
                              print('pressed' + i.toString());
                            },
                          )),
                    )
                    // ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
