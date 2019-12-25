import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/drawer/view/drawerApp.dart';


class AddLessonScreen extends StatefulWidget {
  @override
  _AddLessonScreenState createState() => _AddLessonScreenState();
}

class _AddLessonScreenState extends State<AddLessonScreen> {
  String name = "";
  String date = "";
  String beginHour = "";
  String endingHour = "";
  String teacher = "";
  String place = "";
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dodaj zajęcia"),
      ),
      drawer: DrawerApp(),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(children: <Widget>[
            ListTile(
              title: TextFormField(
                onSaved: (value) => name = value,
                decoration: InputDecoration(
                  labelText: 'name',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              title: TextFormField(
                onSaved: (value) => date = value,
                decoration: InputDecoration(
                  labelText: 'date',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: TextFormField(
                onSaved: (value) => beginHour = value,
                decoration: InputDecoration(
                  labelText: 'beginHour',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                maxLines: 9,
              ),
            ),
            ListTile(
              title: RaisedButton(
                child: Text('SEND'),
                onPressed: () {
                  this.key.currentState.save();

                  // Message message = Message(subject, body);

                  // Navigator.pop(context, message);
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
