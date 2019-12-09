import 'package:flutter/material.dart';
import 'package:productivist/main.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final emailField = Container(
      color: Colors.white,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20,
        ),
        decoration: InputDecoration(
          //fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(15.0, 12.0, 20.0, 12.0),
          hintText: "Username",
        ),
      ),
    );

    final passwordField = Container(
      color: Colors.white,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20,
        ),
        decoration: InputDecoration(
          //fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(15.0, 12.0, 20.0, 12.0),
          hintText: "Password",
        ),
      ),
    );

    final signUpButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: 200,
        /*MediaQuery.of(context).size.width,*/
        padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
        child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 20)
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    // Actual UI Design starts here
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 51, 75, 1),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(45, 200, 0, 60),
            child: Row(children: <Widget>[
              FlatButton(
                child: Text("Log In",
                    style: TextStyle(
                      fontFamily: 'Montserrat-ExtraLight',
                      fontSize: 40,
                      letterSpacing: -2,
                      color: Colors.grey,
                    )),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 40,
                    letterSpacing: -1,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
          ),

          //Email textfield
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 15),
            child: emailField,
          ),

          //Password textfield
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 40),
            child: passwordField,
          ),

          //Login Button
          Padding(
            padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
            child: signUpButton,
          ),
        ],
      ),
    );
  }
}
