import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Load extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[200],
      child: SpinKitChasingDots(
        color: Colors.lightBlue,
        size: 49.0,
      ),
    );
  }
}
