import 'package:flutter/material.dart';

import 'package:qrreaderapp/src/pages/home_pages.dart';
import 'package:qrreaderapp/src/pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRreader',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
      },
      theme: ThemeData(primaryColor: Colors.blueAccent),
    );
  }
}
