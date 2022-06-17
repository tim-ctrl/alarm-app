import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'showTime.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final navigator = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WakeApp Team2',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade900,

      ),
      home: showTimeOfDay(),

    );
  }
}