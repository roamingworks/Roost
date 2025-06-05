import 'package:flutter/material.dart';
import 'screens/dashboard.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final colorScheme = ColorScheme.fromSeed(
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
        colorScheme: colorScheme,
        useMaterial3: true,
        fontFamily: 'BriColage',
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  int _currentIndex = 1;

  final List<Widget> _pages = [
    Center(child: Text('Home Page')),
    MealPlannerDashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ], 
      ),
    );
  }

}