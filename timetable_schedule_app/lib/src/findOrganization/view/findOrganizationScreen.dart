import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/drawer/view.dart';

class FindOrganizationScreen extends StatefulWidget {
  @override
  _FindOrganizationScreenState createState() => _FindOrganizationScreenState();
}

class _FindOrganizationScreenState extends State<FindOrganizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wyszukaj organizację"),
        ),
        drawer: DrawerApp(),
        body: Container(
          child: Text('Find organization'),
        ));
  }
}
