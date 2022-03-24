// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class ArabicDate extends StatefulWidget {
  @override
  State<ArabicDate> createState() => _ArabicDateState();
}

class _ArabicDateState extends State<ArabicDate> {
  var nias;
  var arabicmonth;
  var arabicdatenum;
  var arabicyear;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    arabicgetdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "${arabicmonth}-${arabicdatenum}-${arabicyear}",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }

  arabicgetdate() async {
    final response = await http.Client()
        .get(Uri.parse('https://isubqo.com/islamic-calendar'));
    var document = parser.parse(response.body);
    setState(() {
      var responsedata = document
          .getElementsByClassName('card-header text-center')[0]
          .children[1];

      var gethtmldata = responsedata.text.trim();

      var arabicdatesplit = gethtmldata.split('-');
      var arabicdate = arabicdatesplit[1];
      var aracpicdatesplitdata = arabicdate.split(' ');
      arabicmonth = aracpicdatesplitdata[1];
      arabicdatenum = aracpicdatesplitdata[2];
      arabicyear = aracpicdatesplitdata[3];
    });
  }
}
