import 'package:flutter/material.dart';
import 'screens/dashboard.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final Colorscheme = ColorScheme.fromSeed(
      seedColor: Color(0xFFFFFFFF),
      primary: Color(0xFFFFEFE7),    
      secondary: Color(0xFFC00013),  
      tertiary: Color(0xFF292929),
      onTertiary: Color(0xFF999999),
      brightness: Brightness.light, 
    );

    return MaterialApp(
      title: 'Hostelapp',
      theme: ThemeData(
        colorScheme: Colorscheme,
        useMaterial3: true,
        fontFamily: 'BriColage',
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MealPlannerDashboard(),
      },
    );
  }
}