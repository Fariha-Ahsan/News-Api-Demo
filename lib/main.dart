import 'package:flutter/material.dart';

import 'HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title :'flutter api',
          theme:ThemeData(
        primarySwatch: Colors.blue,
    ),
      home: HomeScreen(),
    );
  }
}
