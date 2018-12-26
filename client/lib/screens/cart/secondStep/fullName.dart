import 'package:flutter/material.dart';

class FullName extends StatelessWidget {
  const FullName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full name",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your name';
        }
      },
    );
  }
}
