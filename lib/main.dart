import 'package:flutter/material.dart';
import 'package:webscraping_flutter/core/arabicdate.dart';
import 'package:webscraping_flutter/core/coundowntime.dart';
import 'package:webscraping_flutter/core/numbertobangla.dart';

class MainClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountDown(),
    );
  }
}

void main(List<String> args) {
  runApp(MainClass());
}
