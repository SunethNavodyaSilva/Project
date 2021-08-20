import 'package:Project/User/profile.dart';
import 'package:flutter/material.dart';
import 'package:Project/User/classes.dart';
import 'package:Project/User/home.dart';
import 'package:Project/connection/chatbot.dart';
import 'package:Project/location/map.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  
  int _i = 0;

  final List<Widget> _c = [
    Home(),
    Classes(),
    UserMap(),
    ChatBot(),
    Profile(),
  ];
  void _onTap(int i) {
    setState(() {
      _i = i;
    });
  }
  bool load = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _c[_i],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.orange[200],
        currentIndex: _i,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text("Home"),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            title: Text("Classes"),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location_alt_outlined),
            title: Text("Map"),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            title: Text("Chatbot"),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            title: Text("Profile"),
            backgroundColor: Colors.black,
          )
        ],
        selectedFontSize: 12.9,
        unselectedFontSize: 12.9,
        selectedItemColor: Colors.blue[600],
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
