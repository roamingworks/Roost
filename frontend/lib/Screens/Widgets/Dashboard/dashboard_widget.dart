// UI Material
import 'package:flutter/material.dart';

// Color Theme
import 'package:frontend/Constants/colors.dart';

// Package
import 'package:intl/intl.dart';
import 'package:frontend/Components/toggle_food.dart';

// Model
import 'package:frontend/Models/meal.dart';


class DashboardWidgets {

  // Top Bar
  static Container topBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.appSecondary,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.restaurant,
                color: ColorTheme.appSecondary,
              ),
              label: Text(
                'Plan Meal',
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
          SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/stats');
              },
              icon: Icon(
                Icons.bar_chart,
                color: ColorTheme.textSecondary,
              ),
              label: Text(
                'View Stats',
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
        ],
      ),
    );
  }

  // Date
  static Center dateWidget(BuildContext context){
    final formattedDate = DateFormat('d MMMM y').format(DateTime.now());
    return Center(
      child: Column(
        children: [
          Text(
            'Today, $formattedDate',
            textAlign: TextAlign.values[5],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }


  // Meal Selection
  static Center mealSelection(BuildContext build){
      
    return Center(
      child: Column(
      spacing: 12,
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
            // SvgPicture.asset(
            //   'assets/images/breakfast-icon.svg',
            //   semanticsLabel: 'breakfast image',
            // ),
              Text('Breakfast'),
              ToggleFoodButton(
                initialValue: MealModel.mealStatus['breakfast']!,
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              spacing: 45,
              children: [
                Text('   Lunch'),
                ToggleFoodButton(initialValue: MealModel.mealStatus['lunch']!),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 25,
              children: [
                Text('Tea/Snacks'),
                ToggleFoodButton(
                  initialValue: MealModel.mealStatus['teaSnacks']!,
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 45,
              children: [
                Text('     Dinner'),
                ToggleFoodButton(initialValue: MealModel.mealStatus['dinner']!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Menu Title
  static Center todayMenuTitle(BuildContext context){
    return Center(
      child: Text(
        "Today's Menu",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
        ),
      ),
    );
  }

  // Today Menu
  static Expanded todayMenu(BuildContext context){
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Center(child: Text('Breakfast')),
          Center(child: Text('Lunch')),
          Center(child: Text('Tea/Snack')),
          Center(child: Text('Breakfast')),
        ],
      ),
    );
  }

  
}