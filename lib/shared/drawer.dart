import 'package:Project/User/mainscreen.dart';
import 'package:Project/User/profile.dart';
import 'package:flutter/material.dart';
import 'package:Project/User/classes.dart';

import 'package:Project/location/map.dart';

class NewDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.orange[200],
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 230,
              padding: EdgeInsets.all(20),
              color: Colors.lightBlue,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 125,
                      height: 125,
                      margin: EdgeInsets.only(top: 45),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              title: Text(
                "My Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Profile()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.card_membership,
                color: Colors.black,
              ),
              title: Text(
                "Classes",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Classes()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add_location_alt_outlined,
                color: Colors.black,
              ),
              title: Text(
                "Map",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => UserMap()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.people_alt_outlined,
                color: Colors.black,
              ),
              title: Text(
                "About Us",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: null,
            ),
            ListTile(
              leading: Icon(
                Icons.call,
                color: Colors.black,
              ),
              title: Text(
                "Contact Us",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: null,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black54,
              ),
              title: Text(
                "Log Out",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
