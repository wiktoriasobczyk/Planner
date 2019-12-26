import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/model/lesson.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/view.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/view/simple_form_field.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/view/time_form_field.dart';
import 'package:timetable_schedule_app/src/drawer/view/drawerApp.dart';

import 'package:intl/intl.dart';

class AddLessonScreen extends StatefulWidget {
  @override
  _AddLessonScreenState createState() => _AddLessonScreenState();
}

class _AddLessonScreenState extends State<AddLessonScreen> {
  final timeFormat = DateFormat("HH:mm");
  final _formKey = GlobalKey<FormState>();
  Lesson lesson = new Lesson();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dodaj zajęcia"),
      ),
      drawer: DrawerApp(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            ListTile(
              title: SimpleTextForm(
              labelText: 'Nazwa',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Wpisz nazwe zajęć';
                }
                return null;
              },
              onSaved: (String value) {
                lesson.name = value;
              },
            )),
            Divider(),
            TimeField(
              labelText: 'Godzina rozpoczęcia',
              validator: (DateTime value) {
                if (value == null) {
                  return 'Wpisz godzine rozpoczęcia wydarzenia';
                }
                return null;
              },
              onSaved: (DateTime value) {
                lesson.beginHour = value;
              },
            ),
            Divider(),
            TimeField(
              labelText: 'Godzina zakończenia',
              validator: (DateTime value) {
                if (value == null) {
                  return 'Wpisz godzine zakończenia wydarzenia';
                }
                return null;
              },
              onSaved: (DateTime value) {
                lesson.endingHour = value;
              },
            ),
            Divider(),
            DateField(
              labelText: 'Data zajęć',
              validator: (DateTime value) {
                if (value == null) {
                  return 'Wpisz date wydarzenia';
                }
                return null;
              },
              onSaved: (DateTime value) {
                lesson.date = value;
              },
            ),
            Divider(),
            ListTile(
                title: SimpleTextForm(
              labelText: 'Prowadzący',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Wpisz prowadzącego zajęcia';
                }
                return null;
              },
              onSaved: (String value) {
                lesson.teacher = value;
              },
            )),
                      Divider(),
            ListTile(
                title: SimpleTextForm(
              labelText: 'Miejsce',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Wpisz miejsce wydarzenia';
                }
                return null;
              },
              onSaved: (String value) {
                lesson.place = value;
              },
            )),
            ListTile(
              title: RaisedButton(
                child: Text('SEND'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print(this.lesson.name);
                    print(this.lesson.place);
                    print(this.lesson.beginHour);
                    print(this.lesson.teacher);
                    print(this.lesson.date);
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
