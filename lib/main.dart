import 'package:flutter/material.dart';
import 'package:tourism_app/pages/Map_Page.dart';
import 'package:tourism_app/pages/homePage.dart';
import 'package:tourism_app/pages/navpages/main_page.dart';
import 'package:tourism_app/pages/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Welcome_page(), // connection to initial page
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome_page(), // Define the welcome screen page as the initial route
        '/home': (context) => HomePage(), // Define the home screen page as a named route
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)
      ),
      home: Map_page(),
    );

  }
}

