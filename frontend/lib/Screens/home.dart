// Package
import 'package:flutter/material.dart';

// Widget
import 'package:frontend/Screens/Widgets/Home/home_widgets.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                // Title
                SizedBox(height: 100,),
                HomeWidgets.inHostelTitle(context),

                SizedBox(height: 100,),
                HomeWidgets.attendanceButton(context),

                SizedBox(height: 50,),
                HomeWidgets.attendShowButton(context),
              ],
            ),
          )
        ) 
      ),
    );
  }
}