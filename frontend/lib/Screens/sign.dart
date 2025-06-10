// Package
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Colors
import 'package:frontend/Constants/colors.dart';

class SignPage extends StatefulWidget {
  @override
  State<SignPage> createState() => _SignPage();
}

class _SignPage extends State<SignPage> {
  File? _imageFile;

  Future<void> _pickImage() async{
    final pickedPhoto = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(pickedPhoto != null){
      setState(() {
        _imageFile = File(pickedPhoto.path);
      });
    }
    else{
      print("No Image Selected");
    }
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            children: [
              Row(
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
              ),
              SizedBox(height: 100,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: ColorTheme.appTertiary,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: (_imageFile != null) ? Image.file(_imageFile!, fit: BoxFit.cover,) : Center(child: Icon(Icons.person,size: 170,),),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 40,
                      width: 160,
                      child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: ColorTheme.textSecondary, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)
                        )
                      ),
                      onPressed: _pickImage,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (_imageFile != null) ? Text("Upload Another Photo",style: TextStyle(color: ColorTheme.textSecondary),) : Text("Upload Photo",style: TextStyle(color: ColorTheme.textSecondary)),
                          Icon(Icons.add,color: ColorTheme.textSecondary,)
                        ],
                      ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child:Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Phone Number",style: TextStyle(fontSize: 10),),
                        Icon(Icons.star,color: ColorTheme.appTertiary,size: 6,)
                      ],
                    ),
                    TextFormField(
                      
                    )
                  ],
                )
              )
            ],
          )
        ), 
      ), 
    );
  }
}