import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddGuitar extends StatefulWidget {
  @override
  _AddGuitarState createState() => _AddGuitarState();
}

class _AddGuitarState extends State<AddGuitar> {
  TextEditingController _exercise = TextEditingController();
  TextEditingController _info = TextEditingController();
  TextEditingController _image = TextEditingController();

  Map<String, dynamic> addGuitar;
  CollectionReference collectionReference =
      Firestore.instance.collection("Guitar");

  guitarAdd() {
    addGuitar = {
      "exercise": _exercise.text,
      "image": _image.text,
      "info": _info.text,
    };

    collectionReference.add(addGuitar).whenComplete(() => print("Successful"));
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ADD GUITAR",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal:19.9),
        child: Column(
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
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 72),
              color: Colors.lightBlue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19.9),
              ),
              onPressed: (){ guitarAdd(); },
              child: Text(
                "ADD",
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
