
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';


class ToggleButton extends StatefulWidget{
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton>{
  bool isOn = false;

  void toggleSwitch() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSwitch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 120,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorTheme.appTertiary,
            width: 1
          ),
          color: isOn ? ColorTheme.appTertiary : ColorTheme.appSecondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 30),
              child: Align(
              alignment: isOn ? Alignment.centerLeft : Alignment.centerRight,
              child: Text(
                isOn ? 'In Hostel' : 'Away',
                style: TextStyle(
                  color: isOn ? ColorTheme.appSecondary : ColorTheme.appTertiary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),

            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: isOn ? ColorTheme.appSecondary : ColorTheme.appTertiary ,
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