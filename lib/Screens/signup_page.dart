// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, non_constant_identifier_names, unused_local_variable, void_checks

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/Screens/Widget/text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late UserCredential userCredential;
  RegExp regExp = RegExp(SignupPage.pattern.toString());
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData() async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user!.uid)
          .set({
        'firstname': firstname.text.trim(),
        'lastname': lastname.text.trim(),
        'email': email.text.trim(),
        'userId': userCredential.user!.uid,
        'password': password.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Password is Too Weak",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Password is Too Strong",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Data is Uploaded",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
      ));
    }
  }

  void name({
    required var Cont,
    required String Contname,
    required var Else,
  }) {
    return Cont.text.trim().isEmpty || Cont.text.trim() == null
        ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "$Contname is Empty",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ))
        : Else;
  }

  void validation() {
    name(
      Cont: password,
      Contname: "Password",
      Else: sendData(),
    );

    name(
      Cont: email,
      Contname: "Email",
      Else: () {},
    );
    name(
      Cont: lastname,
      Contname: "Last_name",
      Else: () {},
    );
    name(
      Cont: firstname,
      Contname: "First_name",
      Else: () {},
    );
    !regExp.hasMatch(email.text)
        ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Email is invalid",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ))
        : log("No Empty");
  }

  Widget button(
      {required String name,
      required Color color,
      required Color textColors,
      required var function,
      required}) {
    return Container(
      height: 40,
      width: 130,
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
              // side: BorderSide(color: Colors.green, width: 2),
            ),
          ),
        ),
        onPressed: function,
        child: Text(name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 140),
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.lora(
                    // fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  MyTextField(
                    hinttext: "First_Name",
                    obsecuretext: false,
                    controller: firstname,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    hinttext: "Last_Name",
                    obsecuretext: false,
                    controller: lastname,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    hinttext: "Email",
                    obsecuretext: false,
                    controller: email,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    hinttext: "Password",
                    obsecuretext: true,
                    controller: password,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                    name: "Cancel",
                    color: Colors.grey.shade400,
                    textColors: Colors.grey.shade900,
                    function: () {},
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  button(
                    function: () {
                      validation();
                    },
                    name: "Register",
                    color: Colors.red,
                    textColors: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
