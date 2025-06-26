import 'package:flutter/material.dart';
import 'package:frontend/Constants/colors.dart';

class RectangleBar extends StatelessWidget {
  final int filledCount;

  const RectangleBar({super.key, required this.filledCount});

  @override
  Widget build(BuildContext context) {
    const int totalParts = 31;

    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorTheme.appSecondary
      ),
      width: 100,
      height: 30,
      child: Row(
        children: List.generate(totalParts, (index) {
          final isFilled = index < filledCount;
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: isFilled ? ColorTheme.appTertiary : ColorTheme.appSecondary,
              ),
            ),
          );
        }),
      ),
    );
  }
}
