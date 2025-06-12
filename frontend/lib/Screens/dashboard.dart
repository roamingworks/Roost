// Packages
import 'package:flutter/material.dart';

// import 'package:flutter_svg/flutter_svg.dart';

// Components
import 'package:frontend/Components/togglehostel.dart';
import 'package:frontend/Components/bottom_nav.dart';

// Themes
import 'package:frontend/Constants/colors.dart';

//Widgets
import 'package:frontend/Screens/Widgets/Dashboard/dashboard_widget.dart';


class MealPlannerDashboard extends StatefulWidget {
  MealPlannerDashboard({super.key});
  @override
  _MealPlannerDashboardState createState() => _MealPlannerDashboardState();
}

class _MealPlannerDashboardState extends State<MealPlannerDashboard> {
  int selectedDay = 3;
  bool isInHostel = true;

  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<String> fullDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              DashboardWidgets.topBar(context),
              SizedBox(height: 28),

              Row(
                children: List.generate(7, (index) {
                  bool isSelected = index == selectedDay;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDay = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? ColorTheme.appTertiary
                                  : Colors.transparent,
                          border: Border.all(
                            color:
                                isSelected
                                    ? ColorTheme.appTertiary
                                    : ColorTheme.textSecondary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          days[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                isSelected
                                    ? ColorTheme.appSecondary
                                    : ColorTheme.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 24),

              // Date Widget
              DashboardWidgets.dateWidget(context),
              SizedBox(height: 14),

              // Hostel Toggle Button
              Center(child: Column(children: [ToggleHostelButton()])),
              SizedBox(height: 20),

              // Meal Selection
              DashboardWidgets.mealSelection(context),
              SizedBox(height: 20),

              // Today menu Title
              DashboardWidgets.todayMenuTitle(context),
              
              // Today's Menu
              DashboardWidgets.todayMenu(context),

              // Bottom bar
              Align(
                alignment: Alignment.bottomCenter,
                child: Nav(context,1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
