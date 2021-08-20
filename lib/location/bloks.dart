import 'package:Project/location/currentlocation.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class AppBlok with ChangeNotifier {
  final currentLocation = CurrentLocation();

  Position cl;

  AppBlok() {
    setCL();
  }

  setCL() async {
    cl = await currentLocation.getCurrentLocation();
    notifyListeners();
  }
}