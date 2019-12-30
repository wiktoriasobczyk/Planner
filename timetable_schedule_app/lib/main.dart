
import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/home/view.dart';
// import 'package:timetable_schedule_app/src/graphqlTest/view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zarządzanie planem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(),
    );
  }
}



