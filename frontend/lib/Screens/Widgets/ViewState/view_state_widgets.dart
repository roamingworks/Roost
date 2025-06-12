
import 'package:frontend/Constants/colors.dart';
import 'package:flutter/material.dart';

class ViewStateWidgets {

  static Row topBarView(BuildContext context){
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(
            Icons.restaurant,
            color: ColorTheme.textSecondary,
          ),
          label: Text(
            'Plan Meal',
            style: TextStyle(
              fontSize: 20,
              color: ColorTheme.textSecondary,
            ),
          ),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            side: BorderSide.none,
          ),
        ),
      ),
      SizedBox(width: 12),
      Expanded(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.bar_chart,
            color: ColorTheme.appSecondary,
          ),
          label: Text(
            'View Stats',
            style: TextStyle(
              fontSize: 20,
              color: ColorTheme.appSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorTheme.appTertiary,
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    ],
  );
  }


}