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
  final TextEditingController _controller = TextEditingController();
  int? number;
  

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
        child: SingleChildScrollView(
          child: Padding(
          padding: EdgeInsets.all(20),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Phone Number",style: TextStyle(fontSize: 10),),
                        Icon(Icons.star,color: ColorTheme.appTertiary,size: 6,)
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      width: 160,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical(y: -1),
                        controller: _controller,
                        onSaved: (newValue) => number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1,color: ColorTheme.textSecondary),
                            borderRadius: BorderRadius.circular(13)
                          )
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 40,),

                    SizedBox(
                      width: 100,
                      height: 40,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1,color: ColorTheme.textSecondary),
                            borderRadius: BorderRadius.circular(13)
                          )
                        ),
                        onPressed: (){}, 
                        child: Row(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sign Up",style: TextStyle(color: ColorTheme.textSecondary),),
                            Icon(Icons.chevron_right_outlined,color: Colors.black,size: 25,)
                          ]
                        )
                      ),
                    )
                  ],
                )
              )
            ],
          )
        ),
        )  
      ), 
    );
  }
}