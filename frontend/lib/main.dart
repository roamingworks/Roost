// Package
import 'package:flutter/material.dart';

// Screens
import 'package:frontend/Screens/view_state.dart';
import 'Screens/dashboard.dart';
import 'Screens/sign.dart';
import 'Screens/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roost',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'BriColage',
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      home: RootPage(),
      routes: {
        "/stats": (context) => ViewState(),
        "/home": (context) => Home(),
        "/dashboard": (context) => MealPlannerDashboard(),
        "/sign": (context) => SignIn()
      },
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  State<RootPage> createState() => _RootPage();
}

class _RootPage extends State<RootPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
    );
  }
}
