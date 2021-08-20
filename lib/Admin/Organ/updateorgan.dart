import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateOrgan extends StatefulWidget {
  @override
  _UpdateOrganState createState() => _UpdateOrganState();
}

class _UpdateOrganState extends State<UpdateOrgan> {
  TextEditingController _exercise = TextEditingController();
  TextEditingController _info = TextEditingController();
  TextEditingController _image = TextEditingController();

  _inputBox(TextEditingController _c, String lT) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9.9, vertical: 4.9),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.lightBlue,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: TextField(
        controller: _c,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 9.9),
          labelText: lT,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  CollectionReference collect = Firestore.instance.collection("Organ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "UPDATE AND DELETE ORGAN",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: collect.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> ss) {
          if (ss.hasData) {
            return ListView.builder(
              itemCount: ss.data.documents.length,
              itemBuilder: (con, i) {
                var doc = ss.data.documents[i].data();
                return ListTile(
                  trailing: IconButton(
                    icon: Icon(Icons.border_color),
                    onPressed: () {
                      _exercise.text = doc["exercise"];
                      _image.text = doc["image"];
                      _info.text = doc["info"];

                      showDialog(
                        barrierDismissible: true,
                        barrierColor: Colors.lightBlue.withOpacity(0.1),
                        context: con,
                        builder: (con) => Dialog(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(7.9),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _inputBox(_exercise, "Exercise"),
                                  SizedBox(
                                    height: 19.9,
                                  ),
                                  _inputBox(_image, "Image"),
                                  SizedBox(
                                    height: 19.9,
                                  ),
                                  _inputBox(_info, "Information"),
                                  SizedBox(
                                    height: 19.9,
                                  ),
                                  RaisedButton(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 18,
                                      horizontal: 72,
                                    ),
                                    color: Colors.lightBlue,
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(19.9),
                                    ),
                                    child: Text("UPDATE"),
                                    onPressed: () {
                                      ss.data.documents[i].reference.update({
                                        "exercise": _exercise.text,
                                        "image": _image.text,
                                        "info": _info.text,
                                      }).whenComplete(() => Navigator.pop(con));
                                    },
                                  ),
                                  SizedBox(height: 19.9),
                                  RaisedButton(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 18,
                                      horizontal: 72,
                                    ),
                                    color: Colors.lightBlue,
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(19.9),
                                    ),
                                    child: Text("DELETE"),
                                    onPressed: () {
                                      ss.data.documents[i].reference.delete();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  title: Text(
                    doc["exercise"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                        doc["info"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  leading: Image.network(
                    doc["image"],
                    height: 99.9,
                    width: 99.9,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          } else {
            return Text("");
          }
        },
      ),
    );
  }
}
