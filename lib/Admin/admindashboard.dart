import 'package:Project/Admin/exerciseshome.dart';
import 'package:Project/User/mainscreen.dart';
import 'package:Project/Admin/userdetails.dart';
import 'package:Project/Admin/adminplaces.dart';
import 'package:Project/Admin/classdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminDash extends StatefulWidget {
  @override
  _AdminDashState createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "ADMIN DASHBOARD",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          FlatButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.logout,
            ),
            label: Text(""),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 14,
                      childAspectRatio: 2.9,
                      crossAxisSpacing: 9.9,
                      primary: false,
                      crossAxisCount: 1,
                      children: [
                        RaisedButton(
                          padding: EdgeInsets.zero,
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.9),
                            side: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    UserDetails(),
                              ),
                            );
                          },
                          child: Text(
                            "USER DETAILS",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        RaisedButton(
                          padding: EdgeInsets.zero,
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.9),
                            side: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => AdminPlaces(),
                              ),
                            );
                          },
                          child: Text(
                            "PLACES",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        RaisedButton(
                          padding: EdgeInsets.zero,
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.9),
                            side: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => ExercisesHome(),
                              ),
                            );
                          },
                          child: Text(
                            "EXERCISES",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        RaisedButton(
                          padding: EdgeInsets.zero,
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.9),
                            side: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => ClassDetails(),
                              ),
                            );
                          },
                          child: Text(
                            "CLASS DETAILS",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
