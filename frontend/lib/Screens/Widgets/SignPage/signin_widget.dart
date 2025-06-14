
import 'package:frontend/Constants/colors.dart';
import 'package:flutter/material.dart';

// Model
import 'package:frontend/Models/user.dart';

class SignInWidget {
  // Form
  static Form formRegister(BuildContext context){

    String? username;
    String? password;
    final formKey = GlobalKey<FormState>();

    void _submitForm() async {
      if(formKey.currentState!.validate()){
        formKey.currentState!.save();
        User newUser = User(username: username!, password: password!);
      }
    }
    
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            width: 300,
            height: 50,
            child: TextFormField(
              style: TextStyle(color: ColorTheme.textSecondary),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled:true,
                fillColor: ColorTheme.appSecondary,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                labelText: "Username",
                labelStyle: TextStyle(color: ColorTheme.textSecondary)
              ),
              validator: (value) {
                if(value == null || value.trim().isEmpty){
                  return 'Username is Required';
                }
                return null;
              },
              onSaved: (value) => username = value!,
            ),
          ),
          
          SizedBox(height: 30,),
          SizedBox(
            width: 300,
            height: 50,
            child: TextFormField(
              obscureText: true,
              style: TextStyle(color: ColorTheme.textSecondary),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled:true,
                fillColor: ColorTheme.appSecondary,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                labelStyle: TextStyle(color: ColorTheme.textSecondary),
                labelText: "Password"
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "Password is required";
                }
                else if(value.length < 6){
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              onSaved: (value) => password = value!,
            ),
          ),
          SizedBox(height: 40,),
          Text("Forget Password or Username?",style: TextStyle(color: ColorTheme.appTertiary),),
          SizedBox(height: 20,),
          TextButton(
            style: TextButton.styleFrom(
              shadowColor: Colors.black,
              elevation: 10,
              backgroundColor: ColorTheme.appTertiary,
              foregroundColor: ColorTheme.appSecondary,
              minimumSize: Size(300, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            onPressed: ()=> _submitForm(), 
            child: Text("Sign in",style: TextStyle(fontSize: 20),),
          )
        ],
      )
    );
  }
}