import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:frontend/Constants/colors.dart';
import 'package:frontend/Screens/dashboard.dart';

class HomeWidgets {

  static Column inHostelTitle(BuildContext context){

    DateTime now = DateTime.now();
    String formatted = DateFormat("MMM d 'at' HH:mm").format(now);

    return Column(
      children: [
        Text("You are currently IN the hostel",style: TextStyle(color: Colors.black),),
        Text("(as of $formatted)",style: TextStyle(color: ColorTheme.textSecondary,fontSize: 10),)
      ],
    );
  }

  static Widget attendanceButton(BuildContext context){
    return GestureDetector(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: ColorTheme.appTertiary,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Image.asset('assets/images/runboy.png'),
      ),
    );
  }

  static Widget attendShowButton(BuildContext context){
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12))
      ),
      onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => MealPlannerDashboard()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Text("View Monthly Attendance",style: TextStyle(color: ColorTheme.textSecondary),),
          Icon(Icons.chevron_right_rounded,color: Colors.black,size: 30,)
        ],
      ) 
    );
  }
}