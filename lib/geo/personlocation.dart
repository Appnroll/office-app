import 'dart:math';

import 'package:flutter/material.dart';
import 'package:office_app/geo/personslocation.dart';

class PersonLocation extends StatelessWidget {

  final Person person;

  PersonLocation({Key key, @required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location details"),
      ),
      body: Center(
        child: Text("${person.name} is in room number ${person.roomNumber}" ),
      ),
    );
  }
}