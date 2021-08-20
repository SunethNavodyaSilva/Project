import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Saxophone extends StatefulWidget {
  @override
  _SaxophoneState createState() => _SaxophoneState();
}

class _SaxophoneState extends State<Saxophone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text(
          'SAXOPHONE',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Saxophone").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              return Column(
                children: <Widget>[
                  SizedBox(height: 20.9),
                  Text(
                    document['exercise'],
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 9.9,
                  ),
                  Image.network(
                    document['image'],
                    height: 199.9,
                    width: 300,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 19.9),
                    child: Text(
                      document['info'],
                      style: TextStyle(
                        fontSize: 14.9,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
