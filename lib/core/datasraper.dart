// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names
// ignore: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class WebSraper extends StatefulWidget {
  @override
  State<WebSraper> createState() => _WebSraperState();
}

class _WebSraperState extends State<WebSraper> {
  bool loading = false;
  var header = {
    'User-Agent':
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'
  };
  var data;
  @override
  void initState() {
    super.initState();
    DataScraper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nais Web Scraper")),
      body: SafeArea(
          child: loading
              ? ListView(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [Center(child: Text("Seheri : ${data[1]}"))],
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }

  DataScraper() async {
    final response = await http.Client().get(Uri.parse(
      "https://isubqo.com/fasting-time/bangladesh/dhaka/dhaka",
    ));
    var document = parser.parse(response.body);

    setState(() {
      var responseString1 = document
          .getElementsByClassName("namaz-time-view")[0]
          .children[0]
          .children[0];
      var nais = responseString1.text.trim();
      data = nais.split(' ');
      var len = nais.length;

      if (len == 0) {
        loading = !loading;
      } else {
        loading = true;
      }
    });
  }
}
