import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class DateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  final Function validator;
  final Function onSaved;
  final String labelText;

  DateField({
    this.validator,
    this.onSaved,
    this.labelText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: DateTimeField(
        format: format,
        decoration: InputDecoration(
          labelText: this.labelText,
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
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
