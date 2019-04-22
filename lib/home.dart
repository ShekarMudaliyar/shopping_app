import 'package:flutter/material.dart';
import 'package:shopping_app/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: new GridView.builder(
        itemCount: 10,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          return new InkWell(
              onTap: () {
                print(i);
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
                              image: new NetworkImage(
                                  'https://static1.squarespace.com/static/570ea986a3360c29db3c44ec/t/5b43d2c9758d46c3864db607/1531171536238/Pineapple+White+on+Black%2C+Webstie.jpg')),
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
                          child: new Text(
                            'text',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    new Positioned(
                        bottom: 1,
                        right: 1,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 5.0, right: 3.0),
                          child: new CircleAvatar(
                              backgroundColor: Colors.white,
                              foregroundColor: black,
                              child: new IconButton(
                                icon: Icon(Icons.shopping_cart),
                                onPressed: () {
                                  print('pressed' + i.toString());
                                },
                              )),
                        )),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
