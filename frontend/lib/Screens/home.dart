// Package
import 'package:flutter/material.dart';

// Widget
import 'package:frontend/Screens/Widgets/Home/home_widgets.dart';

// Controller
import 'package:frontend/Controller/attendance.dart';

// Models
import 'package:frontend/Models/attendance.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  final AttendanceController _controller = AttendanceController();
  @override
  void initState(){
    super.initState();
    _loadTapStatus();
  }

  Future<void> _loadTapStatus() async {
    final tapped = await _controller.isAttendanceToday();
    setState(() {
      AttendanceModel.inHostel = tapped;
    });
  }

  Future<void> _handleTap() async {
    if(AttendanceModel.inHostel){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("You already Attendanced Today!"))
      );
      return;
    }

    await _controller.saveAttendance();
    setState(() {
      AttendanceModel.inHostel = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Attendation Successful")),
    );
  }

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
                HomeWidgets.attendanceButton(context,_handleTap),

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