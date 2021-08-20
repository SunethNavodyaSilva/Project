import 'package:Project/User/mainscreen.dart';
import 'package:Project/shared/load.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Project/services/users.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var userFirebase = FirebaseAuth.instance.currentUser;
  String _email;
  String _username;
  String _instrument;

  bool load = false;

  @override
  Widget build(BuildContext context) {
    return load
        ? Load()
        : Scaffold(
            backgroundColor: Colors.orange[200],
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "YOUR PROFILE",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: [
                FlatButton.icon(
                  onPressed: () {
                    setState(() => load = true);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  icon: Icon(
                    Icons.logout,
                  ),
                  label: Text(""),
                )
              ],
            ),
            body: Container(
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .doc(userFirebase.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("");
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.orange[200],
                          backgroundImage: AssetImage("assets/logo.png"),
                          maxRadius: 70.0,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.9),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.9,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.9),
                        child: Text(
                          snapshot.data["UserName"],
                          style: TextStyle(fontSize: 14.9),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.9),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Email",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.9,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.9),
                        child: Text(
                          snapshot.data["Email"],
                          style: TextStyle(fontSize: 14.9),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.9),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Favorite Instrument",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.9,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.9),
                        child: Text(
                          snapshot.data["Instrument"],
                          style: TextStyle(fontSize: 14.9),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.9),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "User ID",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.9,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.9),
                        child: Text(
                          snapshot.data["UID"],
                          style: TextStyle(fontSize: 14.9),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
  }
}
