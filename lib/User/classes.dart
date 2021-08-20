import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Classes extends StatefulWidget {


  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {

  void _phone(int no) async {
    var x = "tel:${no.toString()}";
    if(await canLaunch(x)){
      await launch(x);
    }
    else{
      throw "";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "CLASSES",
          style: TextStyle(color: Colors.black)
        ),
        backgroundColor: Colors.lightBlue,
      ),

      body: StreamBuilder(
        stream: Firestore.instance
                .collection("Classes")
                .snapshots(),
        builder: (context, snapshot) {

          if(snapshot.data == null){
            return CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: snapshot.data.documents.length,
          itemBuilder: (context, i) {
            DocumentSnapshot a = snapshot.data.documents[i];
            return Container(
              child: ListTile(
                leading: Image.network(
                  a["image"],
                  height: 99.9,
                  width: 99.9,
                ),
                title: Text(
                  a["class"],
                  style: TextStyle(
                    fontSize: 16.9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  children: <Widget>[
                    Text(
                      a["info"],
                      style: TextStyle(
                        fontSize: 16.9,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 75,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.9),
                            side: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          onPressed: (){
                            _phone(0332296172);
                          },
                          child: Text(
                            "CALL",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          );
          
        },
      ),
    );
  }
}