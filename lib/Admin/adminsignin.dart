import 'package:Project/Admin/admindashboard.dart';
import 'package:Project/User/bottomnav.dart';
import 'package:Project/connection/connect.dart';
import 'package:Project/shared/load.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AdminSignIn extends StatefulWidget {
  @override
  _AdminSignInState createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  GlobalKey<FormState> _fkey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

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
      return "Password is incorret";
    } else {
      return null;
    }
  }

  bool load = false;

  @override
  Widget build(BuildContext context) {
    return load
        ? Load()
        : Scaffold(
            backgroundColor: Colors.orange[200],
            appBar: AppBar(
              title: Text("ADMIN LOGIN"),
            ),
            body: Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 49, horizontal: 19),
                child: Form(
                  autovalidate: true,
                  key: _fkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Please Enter Email'),
                          EmailValidator(errorText: 'Please Enter Valid Email'),
                        ]),
                        controller: _email,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: "Email",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black12, width: 1.9),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.9),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.9),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.9),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        validator: pass,
                        controller: _pass,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.security),
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black12, width: 1.9),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.9),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.9),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.9),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        obscureText: true,
                      ),
                      
                      SizedBox(
                        height: 50
                      ),

                      RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 72),
                        color: Colors.lightBlue,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(32.0)),
                        onPressed: () async {
                          setState(() => load = true);

                          bool naviGate = await logIn(_email.text, _pass.text);

                          if (naviGate) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminDash(),
                              ),
                            );
                          }
                        },
                        child: Text("LOGIN"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
