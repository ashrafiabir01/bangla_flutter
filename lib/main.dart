import 'package:flutter/material.dart';
import 'package:webscraping_flutter/core/numbertobangla.dart';

class MainClass extends StatelessWidget {
  const MainClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BanglaNumber(),
    );
  }
}

void main(List<String> args) {
  runApp(MainClass());
}
