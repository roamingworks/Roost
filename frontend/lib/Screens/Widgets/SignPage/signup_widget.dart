
import 'package:frontend/Constants/colors.dart';
import 'package:flutter/material.dart';

class SignupWidget {
  static Row signupTopBar(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorTheme.appTertiary
          ),
          child: Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_add_alt_1,color: Colors.white,size: 30,),
              Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 25),)
            ],
          ),
        ),
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorTheme.appSecondary
          ),
          child: Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login,color: ColorTheme.textSecondary,size: 30,),
              Text("Sign In",style: TextStyle(color: ColorTheme.textSecondary,fontSize: 25),)
            ],
          ),
        )
      ],
    );
  }


}