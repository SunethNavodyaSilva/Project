import 'package:Project/User/instrument/guitar.dart';
import 'package:Project/User/instrument/cello.dart';
import 'package:Project/User/instrument/organ.dart';
import 'package:Project/User/instrument/saxophone.dart';
import 'package:Project/User/instrument/thabla.dart';
import 'package:Project/User/instrument/violin.dart';
import 'package:Project/User/profile.dart';
import 'package:Project/shared/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NewDrawer(),
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("HOME", style: TextStyle(color: Colors.black)),
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
                      mainAxisSpacing: 9.9,
                      crossAxisSpacing: 9.9,
                      primary: false,
                      crossAxisCount: 2,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Container(
                                child: new Image.asset(
                                  "assets/guitar.png",
                                  height: 89.9,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Guitar",
                                style: TextStyle(
                                    fontSize: 14.9,
                                    fontWeight: FontWeight.bold),
                              ),
                              RaisedButton(
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
                                          Guitar(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "CLICK",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Container(
                                child: new Image.asset(
                                  "assets/violin.png",
                                  height: 89.9,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Violin",
                                style: TextStyle(
                                    fontSize: 14.9,
                                    fontWeight: FontWeight.bold),
                              ),
                              RaisedButton(
                                color: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19.9),
                                  side: BorderSide(color: Colors.lightBlue),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Violin(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "CLICK",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Container(
                                child: new Image.asset(
                                  "assets/cello.png",
                                  height: 89.9,
                                  width: 150.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Cello",
                                style: TextStyle(
                                    fontSize: 14.9,
                                    fontWeight: FontWeight.bold),
                              ),
                              RaisedButton(
                                color: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19.9),
                                  side: BorderSide(color: Colors.lightBlue),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Cello(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "CLICK",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Container(
                                child: new Image.asset(
                                  "assets/Organ.png",
                                  height: 89.9,
                                  width: 150.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Organ",
                                style: TextStyle(
                                    fontSize: 14.9,
                                    fontWeight: FontWeight.bold),
                              ),
                              RaisedButton(
                                color: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19.9),
                                  side: BorderSide(color: Colors.lightBlue),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Organ(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "CLICK",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Container(
                                child: new Image.asset(
                                  "assets/thabla.png",
                                  height: 89.9,
                                  width: 150.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Thabla",
                                style: TextStyle(
                                    fontSize: 14.9,
                                    fontWeight: FontWeight.bold),
                              ),
                              RaisedButton(
                                color: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19.9),
                                  side: BorderSide(color: Colors.lightBlue),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Thabla(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "CLICK",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Container(
                                child: new Image.asset(
                                  "assets/saxophone.png",
                                  height: 89.9,
                                  width: 150.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Saxophone",
                                style: TextStyle(
                                    fontSize: 14.9,
                                    fontWeight: FontWeight.bold),
                              ),
                              RaisedButton(
                                color: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19.9),
                                  side: BorderSide(color: Colors.lightBlue),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Saxophone(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "CLICK",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
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
