import 'package:flutter/material.dart';

class Kudos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kudos'),
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
