import 'dart:math';

import 'package:flutter/material.dart';
import 'package:office_app/geo/personlocation.dart';

class PersonsLocation extends StatefulWidget  {

  @override
  State<StatefulWidget> createState() {
    return PersonsLocationState();
  }
}

class PersonsLocationState extends State<PersonsLocation> {

  var persons = List<Person>.from([
    Person("Mike", true, 1),
    Person("Bob", false, null),
    Person("Alice", true, 3),
    Person("Greg", true, 1) ,
    Person("Jenny", false, null)
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Who is in the office?"),
        ),
      body: Builder(
        builder: (context) => Center(
          child: ListView(children: getPersonsListRows(context))
        ),
      )
    );
  }

  List<Widget> getPersonsListRows(context)  {
    List<Widget> widgets = [];

    widgets.add(getListHeader("In the office:"));

    persons.forEach((person) {
      if (person.isInTheOffice) {
        widgets.add(getListRow(context, person));
      }
    });

    widgets.add(getListHeader("Out side of the office:"));
    persons.forEach((person) {
      if (!person.isInTheOffice) {
        widgets.add(getListRow(context, person));
      }
    });

    widgets.add(Padding(padding:  EdgeInsets.all(10.0), child: RaisedButton(
      child: Text('Debug Shuffle'),
      onPressed: () {
        shufflePersons();
      },
    )));
    return widgets;
  }

  Widget getListHeader(String text) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        )
    );
  }

  Widget getListRow(context, Person person) {
    var textColor;
    if (person.isInTheOffice) {
      textColor = Colors.green;
    } else {
      textColor = Colors.redAccent;
    }
    return InkWell(
      child: Padding
        (padding: EdgeInsets.all(10.0),
          child: Text(
            person.name,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: textColor),
          )
      ),
      onTap: () {
        if (person.isInTheOffice) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PersonLocation(person: person))
          );
        } else {
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text("${person.name} is not in the office"),
          ));
        }
      },
    );
  }

  shufflePersons() {
    var random = Random();
    setState(() {
      persons = persons.map((person) {
        bool inOffice = random.nextBool();
        int roomNumber;
        if (inOffice) {
          roomNumber = random.nextInt(5) + 1;
        }
        return Person(person.name, inOffice, roomNumber);
      }
      ).toList();
    });
  }
}

class Person {
  String name;
  bool isInTheOffice;
  int roomNumber;

  Person(String name, bool isInTheOffice, int roomNumber) {
    this.name = name;
    this.isInTheOffice = isInTheOffice;
    this.roomNumber = roomNumber;
  }
}
