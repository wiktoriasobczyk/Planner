import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DateFormiOS extends StatefulWidget {
  @override
  _DateFormiOSState createState() => _DateFormiOSState();
}

class _DateFormiOSState extends State<DateFormiOS> {
  final format = DateFormat("yyyy-MM-dd");
  DateTime value;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: DateTimeField(
        decoration: InputDecoration(
          labelText: 'Data zajęć',
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
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.5,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0),
            child: Icon(FontAwesomeIcons.calendar),
          ),
          focusedBorder: OutlineInputBorder(
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
        initialValue: value,
        format: format,
        onShowPicker: (context, currentValue) async {
          await showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoDatePicker(
                  onDateTimeChanged: (DateTime date) {
                    value = date;
                  },
                );
              });
          setState(() {
            value = value;
          });
          return value;
        },
      ),
    );
  }
}
