// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import "./pages/home_content.dart";

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeContent(),
    );
  }
}

