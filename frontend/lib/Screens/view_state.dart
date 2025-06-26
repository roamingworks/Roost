// UI Material
import 'package:flutter/material.dart';
import 'package:frontend/Components/calendar.dart';
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
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Top Bar 
              ViewStateWidgets.topBarView(context),
              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/meal.png'),
                  SizedBox(width: 15,),
                  Text(
                    "Meal Summary",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  
                ]
              ),
              SizedBox(height: 40,),
              ViewStateWidgets.mealSummary(
                filledCount: 10,
                meal: 'Breakfast',
                image: 'assets/images/Breakfast.png'
              ),
              SizedBox(height: 20,),
              ViewStateWidgets.mealSummary(
                filledCount: 20,
                meal: 'Lunch',
                image: 'assets/images/Lunch.png'
              ),
              SizedBox(height: 20,),
              ViewStateWidgets.mealSummary(
                filledCount: 30,
                meal: 'Tea/Snacks',
                image: 'assets/images/Tea.png'
              ),
              SizedBox(height: 20,),
              ViewStateWidgets.mealSummary(
                filledCount: 1,
                meal: 'Dinner',
                image: 'assets/images/Dinner.png'
              ),
              SizedBox(height: 20,),
              Calendar.customCalendarWidget(context: context),
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
