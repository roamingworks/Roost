// Package
import 'package:flutter/material.dart';

// Widgets
import 'package:frontend/Screens/Widgets/SignPage/signin_widget.dart';

// Colors
import 'package:frontend/Constants/colors.dart';

// Components
//import 'package:frontend/Components/bottom_nav.dart';


class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                // Sign In
                SizedBox(height: 60,),
                Text("Sign In",style: TextStyle(color: ColorTheme.appTertiary,fontSize: 40),),

                // Log 
                SizedBox(height: 40,),
                Text("Log in with the credentials",style: TextStyle(color: Colors.black,fontSize: 20),),
                Text("that admin gave you!",style: TextStyle(color: Colors.black,fontSize: 20),),

                // Form
                SizedBox(height: 40,),
                SignInWidget.formRegister(context),

              ],
            ),
          ), 
        ) 
      ), 
    );
  }
}