// Packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Colors
import 'package:frontend/Constants/colors.dart';
import 'package:frontend/Controller/attendance.dart';

// Screens
import 'package:frontend/Screens/sign.dart';
import 'package:frontend/Screens/dashboard.dart';



Widget Nav(BuildContext context,int index, AttendanceController controller) {
  bool isCenter = index == 1;
  bool isLeft = index == 0;
  bool isRight = index == 2;

  return Container(
    decoration: BoxDecoration(
      color: ColorTheme.appSecondary,
      borderRadius: BorderRadius.circular(10)
    ),
    padding: EdgeInsets.all(5),
    width: 400,
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Container(
            decoration: BoxDecoration(
              color: isLeft ? ColorTheme.appTertiary : ColorTheme.appSecondary,
              borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.all(10),
            width: 50,
            height: 60,
            child: SvgPicture.asset(
              "assets/icons/go.svg",
              color: isLeft ? ColorTheme.appSecondary : ColorTheme.appTertiary
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MealPlannerDashboard(controller)));
          },
          child: Container(
            decoration: BoxDecoration(
              color: isCenter ? ColorTheme.appTertiary : ColorTheme.appSecondary,
              borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.all(10),
            width: 50,
            height: 50,
            child: SvgPicture.asset(
              "assets/icons/calen.svg",
              color: isCenter ? ColorTheme.appSecondary : ColorTheme.appTertiary
            ),
          )
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: isRight ? ColorTheme.appTertiary : ColorTheme.appSecondary,
              borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.all(10),
            width: 50,
            height: 50,
            child: SvgPicture.asset(
              "assets/icons/profile.svg",
              color: isRight ? ColorTheme.appSecondary : ColorTheme.appTertiary
            ),
          )  
        ),
      ],
    ),
  );
}