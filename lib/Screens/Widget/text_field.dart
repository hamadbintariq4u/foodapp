// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hinttext;
  final bool obsecuretext;
  final TextEditingController controller;

  const MyTextField({
    required this.hinttext,
    required this.obsecuretext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecuretext,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
      ),
    );
  }
}
