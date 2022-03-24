// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  var sec;
  var mini = 0;
  var minit = 0;
  var temphour = 0;
  var hours = 0;
  var iftertimehours = 4;
  var iftertimemin = 1;
  var iftertimesec = 1;
  var lefthour, leftmin, leftsec;
  bool doubledigitsec = true;
  bool doubledigitmin = true;
  bool doubledigitsours = true;
  @override
  void initState() {
    // CusTimer();
    super.initState();
    Customcountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            "${doubledigitsours ? "0$lefthour" : lefthour} : ${doubledigitmin ? "0$leftmin" : leftmin} :${doubledigitsec ? "0$leftsec" : leftsec}",
            style: TextStyle(
              fontSize: 36,
            )),
      ),
    );
  }

  // CusTimer() async {
  //   for (int i = 1; i < 61; i++) {
  //     setState(() {
  //       doubledigitsec = false;
  //       sec = i;
  //       if (i.toString().length == 1) {
  //         doubledigitsec = true;
  //       } else {
  //         doubledigitsec = false;
  //       }
  //       if (i == 60) {
  //         i = 0;
  //         minit = minit + 1;
  //       }
  //       if (minit == 60) {
  //         minit = 0;
  //         hours = hours + 1;
  //       }
  //     });
  //     await Future.delayed(Duration(seconds: 1));
  //   }
  // }
  Customcountdown() async {
    for (int i = iftertimesec; i >= 0; i--) {
      setState(() {
        doubledigitmin = false;
        doubledigitsec = false;
        doubledigitsours = false;
        leftsec = iftertimesec;
        leftmin = iftertimemin;
        lefthour = iftertimehours;
        leftsec = i;
        if (i == 0) {
          i = 60;
          iftertimemin = iftertimemin - 1;
          leftmin = iftertimemin;
        }
        if (leftsec.toString().length == 1) {
          doubledigitsec = !doubledigitsec;
        }
        if (leftmin.toString().length == 1) {
          doubledigitmin = !doubledigitmin;
        }
        if (lefthour.toString().length == 1) {
          doubledigitsours = !doubledigitsours;
        }
        if (iftertimemin == 0) {
          iftertimemin = 60;
          iftertimehours = iftertimehours - 1;
          lefthour = iftertimehours;
        }
      });
      await Future.delayed(Duration(seconds: 1));
      if (lefthour == 0) {
        break;
      }
    }
  }
}
