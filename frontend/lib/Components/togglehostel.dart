import 'package:flutter/material.dart';
import 'package:frontend/Constants/colors.dart';

class ToggleHostelButton extends StatefulWidget {
  const ToggleHostelButton({super.key});

  @override
  State<ToggleHostelButton> createState() => _ToggleHostelButtonState();
}

class _ToggleHostelButtonState extends State<ToggleHostelButton> {
  bool outHostel = false;

  void toggleSwitch() {
    setState(() {
      outHostel = !outHostel;
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
          color: outHostel ? ColorTheme.appSecondary : ColorTheme.appTertiary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Padding(
              padding:
                  outHostel ? EdgeInsets.only(left: 45) : EdgeInsets.only(right: 14),
              child: Align(
                alignment: outHostel ? Alignment(-0.5, 0) : Alignment.center,
                child: Text(
                  outHostel ? 'Away' : 'In Hostel',
                  style: TextStyle(
                    color:
                        outHostel ? ColorTheme.appTertiary: ColorTheme.appSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: outHostel ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color:
                      outHostel ? ColorTheme.appTertiary : ColorTheme.appSecondary,
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
