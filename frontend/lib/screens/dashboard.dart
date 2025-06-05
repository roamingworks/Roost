// Packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Components
import 'package:frontend/components/togglehostel.dart';



class MealPlannerDashboard extends StatefulWidget {
  MealPlannerDashboard({super.key});
  @override
  _MealPlannerDashboardState createState() => _MealPlannerDashboardState();
}

class _MealPlannerDashboardState extends State<MealPlannerDashboard> {
  int selectedDay = 3;
  bool isInHostel = true;
  
  Map<String, bool> mealStatus = {
    'breakfast': false,
    'lunch': false,
    'teaSnacks': false,
    'dinner': true,
  };

  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<String> fullDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  final formattedDate = DateFormat('d MMMM y').format(DateTime.now());

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
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.restaurant, color: Theme.of(context).colorScheme.primary),
                      label: Text('Plan Meal', style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                      },
                      icon: Icon(Icons.bar_chart, color: Theme.of(context).colorScheme.onTertiary),
                      label: Text('View Stats', style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onTertiary)),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide.none
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 24),
              
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
                          color: isSelected ? Theme.of(context).colorScheme.secondary : Colors.transparent,
                          border: Border.all(
                            color: isSelected ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.onTertiary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          days[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onTertiary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              
              SizedBox(height: 24),
              
              Center(
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
                    )
                  ],
                ),
              ),
              
              SizedBox(height: 12),
              
              Center(child: Column(
                children: [
                  ToggleButton()
                ],
              ),)
            ],
          ),
        ),
      ),

      //bottomNavigationBar: ,
    );
  }
}