// UI Material
import 'package:flutter/material.dart';
import 'package:frontend/Controller/attendance.dart';

// Widgets
import 'package:frontend/Screens/Widgets/ViewState/view_state_widgets.dart';

// COmponents
import 'package:frontend/Components/bottom_nav.dart';

class ViewState extends StatefulWidget {
  final AttendanceController controller;
  ViewState(this.controller);
  @override
  State<ViewState> createState() => _ViewSate();
}

class _ViewSate extends State<ViewState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Top Bar 
              ViewStateWidgets.topBarView(context),

              Row(children: [Text("Meal Summary")]),

              Column(
                children: [
                  Row(
                    children: [
                      Text("Breakfast"),
                      Text("Progress Bar Here"),
                      Text("31/31"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Lunch"),
                      Text("Progress Bar Here"),
                      Text("31/31"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Tea/Snacks"),
                      Text("Progress Bar Here"),
                      Text("31/31"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Dinner"),
                      Text("Progress Bar Here"),
                      Text("31/31"),
                    ],
                  ),
                ],
              ),

              Text("Calender Wise Summary Here"),

              // Bottom bar
              Align(
                alignment: Alignment.bottomCenter,
                child: Nav(context,1,widget.controller),
              )
            ],
          ),
        ),
      ),
    );
  }
}
