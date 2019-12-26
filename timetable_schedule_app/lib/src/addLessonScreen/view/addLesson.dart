import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/drawer/view/drawerApp.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

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
                               decoration: InputDecoration(
                  labelText: 'Nazwa',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: TextFormField(
                onSaved: (value) => date = value,
                decoration: InputDecoration(
                  labelText: 'Data',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: RaisedButton(
                child: Text('SEND'),
                onPressed: () {
                  this.key.currentState.save();
                  print('wpisana data' + date);
                  print('wpisana nazwa' + name);
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
