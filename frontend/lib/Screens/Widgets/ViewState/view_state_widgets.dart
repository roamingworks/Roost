
import 'package:frontend/Constants/colors.dart';
import 'package:flutter/material.dart';

class ViewStateWidgets {

  static Container topBarView(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.appSecondary,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
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
      ),
    );
  }


}