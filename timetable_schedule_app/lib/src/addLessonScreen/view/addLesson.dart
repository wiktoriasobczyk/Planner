import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/model/lesson.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/view/simple_form_field.dart';
import 'package:timetable_schedule_app/src/drawer/view/drawerApp.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
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
            Divider(),
            // ListTile(
            //   title: DateTimeField(
            //     decoration: InputDecoration(
            //       labelText: 'Data',
            //       labelStyle: TextStyle(fontWeight: FontWeight.bold),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Colors.green,
            //           width: 1.5,
            //           style: BorderStyle.solid,
            //         ),
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(15.0),
            //         ),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Colors.green,
            //           width: 1.5,
            //           style: BorderStyle.solid,
            //         ),
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(15.0),
            //         ),
            //       ),
            //     ),
            //     format: timeFormat,
            //     onShowPicker: (context, currentValue) async {
            //       final time = await showTimePicker(
            //         context: context,
            //         initialTime:
            //             TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            //       );
            //       beginHour = DateTimeField.convert(time).toString();
            //       return DateTimeField.convert(time);
            //     },
            //   ),
            // ),
            ListTile(
              title: RaisedButton(
                child: Text('SEND'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print(this.lesson.name);
                    print(this.lesson.place);
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
