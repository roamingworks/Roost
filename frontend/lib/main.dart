import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/constants/colors.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      title: 'Hostelapp',
      theme: ThemeData(
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
    Container(child: Text('Home'))
  ];

  void _onTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBarItem customNavItem(String icon, int index){

    bool isSelected = _currentIndex == index;

    return BottomNavigationBarItem(
      icon: Container(
        padding: isSelected ? EdgeInsets.all(12) : EdgeInsets.zero,
        decoration: BoxDecoration(
          color: isSelected ? ColorTheme.appTertiary : Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        
        child: SvgPicture.asset(icon,color: isSelected ? ColorTheme.appSecondary : ColorTheme.appTertiary,),
      ),
      label: "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex < _pages.length ? _pages[_currentIndex] : _pages[0],
      bottomNavigationBar: Padding(

        padding: EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentIndex,
            onTap: _onTapped,
            backgroundColor: ColorTheme.appSecondary,
            type: BottomNavigationBarType.fixed,
            items: [
            customNavItem("assets/icons/go.svg", 0),
            customNavItem("assets/icons/calen.svg", 1),
            customNavItem("assets/icons/profile.svg", 2),
            ],
          ),
        )
      ), 
    );
  }
}