import 'package:flutter/material.dart';
import 'package:office_app/geo/personslocation.dart';

class Geolocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocation'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Who is in the office?'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonsLocation())
            );
          },
        ),
      ),
    );
  }
}
