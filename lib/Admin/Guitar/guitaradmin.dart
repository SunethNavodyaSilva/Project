import 'package:Project/Admin/Guitar/addguitar.dart';
import 'package:Project/Admin/Guitar/updateguitar.dart';
import 'package:flutter/material.dart';

class GuitarAdmin extends StatefulWidget {
  @override
  _GuitarAdminState createState() => _GuitarAdminState();
}

class _GuitarAdminState extends State<GuitarAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "GUITAR HOME",
          style: TextStyle(
            color: Colors.black,
          ),
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
                      mainAxisSpacing: 14,
                      childAspectRatio: 2.9,
                      crossAxisSpacing: 9.9,
                      primary: false,
                      crossAxisCount: 1,
                      children: [
                        SizedBox(
                          height: 20,
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
                                builder: (BuildContext context) => AddGuitar(),
                              ),
                            );
                          },
                          child: Text(
                            "ADD",
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
                                builder: (BuildContext context) => UpdateGuitar(),
                              ),
                            );
                          },
                          child: Text(
                            "UPDATE AND DELETE",
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
