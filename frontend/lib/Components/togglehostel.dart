import 'package:flutter/material.dart';
import 'package:frontend/Constants/colors.dart';

// Models
import 'package:frontend/Models/attendance.dart';

class ToggleHostelButton extends StatefulWidget {
  const ToggleHostelButton({super.key});

  @override
  State<ToggleHostelButton> createState() => _ToggleHostelButtonState();
}

class _ToggleHostelButtonState extends State<ToggleHostelButton> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 150,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: ColorTheme.appTertiary, width: 1),
          color: AttendanceModel.inHostel ? ColorTheme.appTertiary : ColorTheme.appSecondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Padding(
              padding:
                  AttendanceModel.inHostel ? EdgeInsets.only(left: 45) : EdgeInsets.only(right: 14),
              child: Align(
                alignment: AttendanceModel.inHostel ? Alignment(-1.5,0) : Alignment(0.2, 0),
                child: Text(
                  AttendanceModel.inHostel ? 'In Hostel' : 'Away',
                  style: TextStyle(
                    color:
                        AttendanceModel.inHostel ? ColorTheme.appSecondary: ColorTheme.appTertiary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: AttendanceModel.inHostel ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color:
                      AttendanceModel.inHostel ? ColorTheme.appSecondary : ColorTheme.appTertiary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
