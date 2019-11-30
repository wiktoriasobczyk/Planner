import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/home/view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ManageApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(title: 'Login home page'),
    );
  }
}



