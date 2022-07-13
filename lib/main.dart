import 'package:flutter/material.dart';
import 'dashboard/categorylistpage.dart';
import 'dashboard/home_screen.dart';
import 'pages/walktrough/walktrough.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Walkthrough()
    );
  }
}

