import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  const Email({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "test@email.com",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your email address';
        }
      },
    );
  }
}
