import 'package:flutter/material.dart';

class Geolocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocation'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Main screen'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
