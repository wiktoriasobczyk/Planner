import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/controller/add-lesson-controller.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/view.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/view/simple_form_field.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/view/time_form_field.dart';
import 'package:timetable_schedule_app/src/common/green_button.dart';
import 'package:timetable_schedule_app/src/drawer/view/drawerApp.dart';

import 'package:intl/intl.dart';

class AddLessonScreen extends StatefulWidget {
  @override
  _AddLessonScreenState createState() => _AddLessonScreenState();
}

class _AddLessonScreenState extends State<AddLessonScreen> {
  final timeFormat = DateFormat("HH:mm");
  final _formKey = GlobalKey<FormState>();
  var _key = new GlobalKey<ScaffoldState>();
  AddLessonCtrl addLessonCtrl = new AddLessonCtrl();
  String name;
  DateTime date;
  DateTime beginHour;
  DateTime endingHour;
  String teacher;
  String place;
  Future delayedSnakeBar(context, String message) async {
    await Future.delayed(Duration(seconds: 1));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
                this.name = value;
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
                this.beginHour = value;
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
                this.endingHour = value;
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
                this.date = value;
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
                this.teacher = value;
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
                this.place = value;
              },
            )),
            ListTile(
              title: GreenButton(
                labelText: 'DODAJ',
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    String addingResult = await addLessonCtrl.addLessonCallout(
                        name, date, beginHour, endingHour, teacher, place);
                    if (addingResult.contains('exception')) {
                      _key.currentState.showSnackBar(SnackBar(
                          content: Text(addingResult),
                          backgroundColor: Colors.red));
                    } else {
                      _key.currentState.showSnackBar(SnackBar(
                          content: Text(addingResult),
                          backgroundColor: Colors.green));
                    }
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
