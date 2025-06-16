import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:frontend/Constants/colors.dart';
import 'package:frontend/Screens/dashboard.dart';
import 'package:frontend/Controller/attendance.dart';

class HomeWidgets {
  static Column inHostelTitle(BuildContext context, AttendanceController controller){
    DateTime now = DateTime.now();
    String formatted = DateFormat("MMM d 'at' HH:mm").format(now);

    return Column(
      children: [
        (controller.isHostel) ?
        Text("You are currently IN the hostel",style: TextStyle(color: Colors.black),)
        :
        Text('You are currently AWAY'),
        Text("(as of $formatted)",style: TextStyle(color: ColorTheme.textSecondary,fontSize: 10),)
      ],
    );
  }

  static Widget attendanceButton(BuildContext context, VoidCallback handle,AttendanceController controller){
    return GestureDetector(
      onTap: handle,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: ColorTheme.appTertiary,
          borderRadius: BorderRadius.circular(100)
        ),
        child: (controller.isHostel) ? Image.asset('assets/images/runboy.png') : Image.asset('assets/images/home.png'),
      ),
    );
  }

  static Widget attendShowButton(BuildContext context, AttendanceController controller){
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12))
      ),
      onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => MealPlannerDashboard(controller)));
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