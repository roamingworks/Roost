import 'package:flutter/material.dart';

class ColoredRectangleBar extends StatelessWidget {
  final int filledCount;

  const ColoredRectangleBar({super.key, required this.filledCount});

  @override
  Widget build(BuildContext context) {
    const int totalParts = 31;

    return SizedBox(
      height: 30,
      child: Row(
        children: List.generate(totalParts, (index) {
          final isFilled = index < filledCount;
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1.0),
              color: isFilled ? Colors.brown : Colors.white,
            ),
          );
        }),
      ),
    );
  }
}
