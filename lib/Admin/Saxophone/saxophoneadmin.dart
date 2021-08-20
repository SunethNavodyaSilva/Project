import 'package:Project/Admin/Saxophone/addsaxophone.dart';
import 'package:Project/Admin/Saxophone/updatesaxophone.dart';
import 'package:flutter/material.dart';

class SaxoPhoneAdmin extends StatefulWidget {
  @override
  _SaxoPhoneAdminState createState() => _SaxoPhoneAdminState();
}

class _SaxoPhoneAdminState extends State<SaxoPhoneAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SAXOPHONE HOME",
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
                                builder: (BuildContext context) => AddSaxophone(),
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
                                builder: (BuildContext context) => UpdateSaxophone(),
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
