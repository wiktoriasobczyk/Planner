import 'package:flutter/material.dart';

class SimpleTextForm extends StatelessWidget {
  final Function validator;
  final Function onSaved;
  final String labelText;

  SimpleTextForm({
    this.validator,
    this.onSaved,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      validator: validator,
      onSaved: onSaved,
    );
  }
}
