// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  Widget button({
    required String name,
    required Color color,
    required Color textColors,
  }) {
    return Container(
      height: 45,
      width: 300,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            textColors,
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            color,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.green, width: 2),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Image.asset('images/logo.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome to Tastee",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text(" Order food form our restaueant and "),
                      Text(" Make reservation in real - time ")
                    ],
                  ),
                  button(
                    name: "Login",
                    color: Colors.green,
                    textColors: Colors.white,
                  ),
                  button(
                    name: "SignUp",
                    color: Colors.white,
                    textColors: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
