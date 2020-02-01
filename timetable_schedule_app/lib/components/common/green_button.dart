import 'package:flutter/material.dart';
export 'package:timetable_schedule_app/components/common/green_button.dart';

class GreenButton extends StatelessWidget {
  final Function onPressed;
  final String labelText;
  GreenButton({this.labelText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.labelText),
      textColor: Colors.white,
      onPressed: onPressed,
      color: Colors.green,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.green)),
    );
  }
}
