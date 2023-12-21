// import 'dart:html';

import 'package:flutter/material.dart';
import './src/views/register_screen.dart';
import './src/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Yk App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: HomeScreen(),
        routes: {
          '/register': (context) => RegisterScreen(),
          '/home': (context) => MyHomePage(),
        });
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hallo"),
      ),
      body: const Center(
        child: Text("Hallo"),
      ),
    );
  }
}
