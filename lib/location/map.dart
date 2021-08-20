import 'package:Project/location/bloks.dart';
import 'package:Project/location/mapget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserMap extends StatefulWidget {
  @override
  _UserMapState createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppBlok(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: MapGet(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
