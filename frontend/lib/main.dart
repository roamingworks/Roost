// Package
import 'package:flutter/material.dart';

// Screens
import 'package:frontend/Screens/view_state.dart';
import 'Screens/dashboard.dart';
import 'Screens/sign.dart';
import 'Screens/home.dart';

// Controller 
import 'package:frontend/Controller/attendance.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AttendanceController controller = AttendanceController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roost',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'BriColage',
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      home: RootPage(controller),
      routes: {
        "/stats": (context) => ViewState(controller),
        "/home": (context) => Home(controller),
        "/dashboard": (context) => MealPlannerDashboard(controller),
        "/sign": (context) => SignIn()
      },
    );
  }
}

class RootPage extends StatefulWidget {
  final AttendanceController controller;
  RootPage(this.controller);
  @override
  State<RootPage> createState() => _RootPage();
}

class _RootPage extends State<RootPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(widget.controller),
    );
  }
}
