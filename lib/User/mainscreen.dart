import 'package:Project/User/login.dart';
import 'package:Project/User/register.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: 150,
          ),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.orange[200],
              backgroundImage: AssetImage("assets/logo.png"),
              maxRadius: 70.0,
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 72),
              color: Colors.lightBlue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(32.0)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              },
              child: Text("LOGIN", style: TextStyle(fontSize: 18.0)),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(18.0),
              child: Text("If you don't have an account yet ?")),
          Center(
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 72),
              color: Colors.lightBlue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(32.0)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text(
                "REGISTER",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
