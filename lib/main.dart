import 'package:flutter/material.dart';
import 'package:when_bus/screens/cusom_list.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Binggrae2',
        useMaterial3: true,
      ),
      home: const Home(),
      // home:CustomScrollViewDemoPage(),
    );
  }
}

