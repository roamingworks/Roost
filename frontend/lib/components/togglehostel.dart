import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';

class ToggleHostelButton extends StatefulWidget {
  const ToggleHostelButton({super.key});

  @override
  State<ToggleHostelButton> createState() => _ToggleHostelButtonState();
}

class _ToggleHostelButtonState extends State<ToggleHostelButton> {
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
        width: 150,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: ColorTheme.appTertiary, width: 1),
          color: isOn ? ColorTheme.appSecondary : ColorTheme.appTertiary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Padding(
              padding:
                  isOn ? EdgeInsets.only(left: 45) : EdgeInsets.only(right: 14),
              child: Align(
                alignment: isOn ? Alignment(-0.5, 0) : Alignment.center,
                child: Text(
                  isOn ? 'Away' : 'In Hostel',
                  style: TextStyle(
                    color:
                        isOn ? ColorTheme.appTertiary: ColorTheme.appSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: isOn ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color:
                      isOn ? ColorTheme.appTertiary : ColorTheme.appSecondary,
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
