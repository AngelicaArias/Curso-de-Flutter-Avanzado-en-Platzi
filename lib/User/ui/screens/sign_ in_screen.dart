import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget{
  
  @override 
  State createState(){
   return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen>{
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("title", null),
          Column(
            children: <Widget>[
              Text("Welcome \n this is your Traveln app", 
                style: TextStyle(
                  fontSize: 37.0,
                  fontFamily:"lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          )
        ],
      ),
      );
  }
  
}