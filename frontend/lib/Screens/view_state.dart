// UI Material
import 'package:flutter/material.dart';

// Color
import 'package:frontend/Constants/colors.dart';

class ViewState extends StatefulWidget {
  @override
  State<ViewState> createState() => _ViewSate();
}

class _ViewSate extends State<ViewState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
              ),

              Row(children: [Text("Meal Summary")]),

              Column(
                children: [
                  Row(
                    children: [
                      Text("Breakfast"),
                      Text("Progress Bar Here"),
                      Text("31/31"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Lunch"),
                      Text("Progress Bar Here"),
                      Text("31/31"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Tea/Snacks"),
                      Text("Progress Bar Here"),
                      Text("31/31"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Dinner"),
                      Text("Progress Bar Here"),
                      Text("31/31"),
                    ],
                  ),
                ],
              ),

              Text("Calender Wise Summary Here"),
            ],
          ),
        ),
      ),
    );
  }
}
