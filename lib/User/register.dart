import 'package:Project/User/bottomnav.dart';
import 'package:Project/connection/connect.dart';
import 'package:Project/User/home.dart';
import 'package:Project/services/users.dart';
import 'package:Project/shared/load.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _fkey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _instrument = TextEditingController();

  void validate() {
    if (_fkey.currentState.validate()) {
      print('Valid');
    } else {
      print('Not Valid');
    }
  }

  String pass(v) {
    if (v.isEmpty) {
      return "Please Enter Password";
    } else if (v.length < 5) {
      return "Please Enter Strong Password";
    } else {
      return null;
    }
  }

  bool load = false;

  @override
  Widget build(BuildContext context) {
    return load ? Load() : Scaffold(
        backgroundColor: Colors.orange[200],
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('REGISTER'),
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 49, horizontal: 19),
            child: Form(
              autovalidate: true,
              key: _fkey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'User Name',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black12, width: 1.9),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.9),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Please Enter Email'),
                      EmailValidator(errorText: 'Please Enter Valid Email'),
                    ]),
                    controller: _email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1.9),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.9),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: pass,
                    controller: _password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.security),
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black12, width: 1.9),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.9),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _instrument,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.music_note),
                      hintText: 'Favorite Instrument',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black12, width: 1.9),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.9),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 72),
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32.0)),
                      onPressed: () async {
                        setState(() => load = true);
                        bool naviGate =
                            await register(_email.text, _password.text);

                        var firebaseUSer = FirebaseAuth.instance.currentUser;
                        FirebaseFirestore.instance
                            .collection("Users")
                            .doc(firebaseUSer.uid)
                            .set({
                          "UserName": _username.text,
                          "Email": _email.text,
                          "Instrument": _instrument.text,
                          "UID":
                              FirebaseAuth.instance.currentUser.uid.toString(),
                        }).then((_) {
                          print("Registered");
                        });
                        if (naviGate) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNav(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'REGISTER',
                        style: TextStyle(fontSize: 18.0),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
