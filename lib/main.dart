import 'package:flutter/material.dart';
import 'package:productivist/screens/signup_page.dart';
import 'screens/welcome_page.dart';

// Server name
//https://sheltered-basin-61980.herokuapp.com/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          //primarySwatch: Colors.blue,
          ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

    final loginButton = Material(
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
            MaterialPageRoute(builder: (context) => WelcomePage()),
          );
        },
        child: Text("Log In",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 20)
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    // Actual UI Design starts here
    return Scaffold(
      backgroundColor: Color(0xFF1d284d),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(55, 200, 0, 60),
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 40,
                    letterSpacing: -1,
                    color: Colors.white,
                  ),
                ),
              ),
              FlatButton(
                child: Text("Sign Up",
                    style: TextStyle(
                      fontFamily: 'Montserrat-ExtraLight',
                      fontSize: 40,
                      letterSpacing: -2,
                      color: Colors.grey,
                    )),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
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
            child: loginButton,
          ),
        ],
      ),
    );
  }
}
