import 'package:Project/Admin/Cello/celloadmin.dart';
import 'package:Project/Admin/Guitar/guitaradmin.dart';
import 'package:Project/Admin/Organ/organadmin.dart';
import 'package:Project/Admin/Saxophone/saxophoneadmin.dart';
import 'package:Project/Admin/Thabla/thablaadmin.dart';
import 'package:Project/Admin/Violin/violinadmin.dart';
import 'package:flutter/material.dart';

class ExercisesHome extends StatefulWidget {
  @override
  _ExercisesHomeState createState() => _ExercisesHomeState();
}

class _ExercisesHomeState extends State<ExercisesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "EXERCISES HOME",
          style: TextStyle(color: Colors.black),
        ),
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
                                          GuitarAdmin(),
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
                                          ViolinAdmin(),
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
                                          CelloAdmin(),
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
                                          OrganAdmin(),
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
                                          ThablaAdmin(),
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
                                          SaxoPhoneAdmin(),
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
