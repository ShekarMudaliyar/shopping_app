import 'package:flutter/material.dart';
import 'package:shopping_app/tabs.dart';
import 'package:shopping_app/strings.dart';
import 'colors.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  login() {
    if (_formKey.currentState.validate()) {
      print(_usernameController.text);
      print(_passwordController.text);
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => new TabsPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const padding =
        EdgeInsets.only(right: 10.0, left: 10.0, top: 5.0, bottom: 5.0);
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
        color: primaryColor.shade300,
        onPressed: fun,
      );
    }

    var logoflex = new SizedBox(
      height: height / 2,
      width: width,
      child: new Container(
          color: primaryColor,
          child: new Center(
            child: new Text(
              title,
              style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          )),
    );
    var formflex = new SizedBox(
      height: height / 2,
      width: width,
      child: new Container(
        color: primaryColor,
        child: new Column(
          children: <Widget>[
            new Form(
              key: _formKey,
              child: new Column(
                children: <Widget>[
                  new Container(
                    padding: padding,
                    child: new TextFormField(
                      controller: _usernameController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: secondaryColor,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter email';
                        } else if (!value.contains('@') ||
                            !value.contains('.')) {
                          return 'Incorrect email format';
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: secondaryColor),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: secondaryColor))),
                    ),
                  ),
                  new Container(
                    padding: padding,
                    child: new TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: secondaryColor,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value.length < 6) {
                          return 'Too short password';
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: secondaryColor),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: secondaryColor))),
                    ),
                  ),
                  new Container(
                    padding: padding,
                    child: matbutton("Login", login),
                  ),
                  new Container(
                    padding: padding,
                    child: matbutton("Forgot Password", () {}),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[logoflex, formflex],
          ),
        ),
      ),
    );
  }
}
