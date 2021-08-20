import 'package:Project/location/bloks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapGet extends StatefulWidget {
  @override
  _MapGetState createState() => _MapGetState();
}

class _MapGetState extends State<MapGet> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void im(s, sID) async {
    var markerIdVal = sID;
    final MarkerId mID = MarkerId(markerIdVal);
    final Marker m = Marker(
        markerId: mID,
        position: LatLng(s['place'].latitude, s['place'].longitude),
        infoWindow: InfoWindow(title: 'Class', snippet: s['class']));
    setState(() {
      markers[mID] = m;
    });
  }

  void initState() {
    getData();
    super.initState();
  }

  getData() {
    Firestore.instance.collection('Places').getDocuments().then((d) {
      if (d.documents.isNotEmpty) {
        for (int j = 0; j < d.documents.length; j++) {
          im(d.documents[j].data(), d.documents[j].documentID);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBlok = Provider.of<AppBlok>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text(
          "MAP",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: (appBlok.cl == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Container(
                  height: 550.0,
                  child: GoogleMap(
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                      new Factory<OneSequenceGestureRecognizer>(
                        () => new EagerGestureRecognizer(),
                      ),
                    ].toSet(),
                    markers: Set<Marker>.of(markers.values),
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(appBlok.cl.latitude, appBlok.cl.longitude),
                      zoom: 13.9,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
