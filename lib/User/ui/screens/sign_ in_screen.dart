import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';


class SignInScreen extends StatefulWidget{
  
  @override 
  State createState(){
   return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen>{
  
  UserBloc userBloc;
  
  @override
  Widget build(BuildContext context) {    
    // TODO: implement build
    userBloc =BlocProvider.of(context);
    return signInGoogleUI();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext contex, AsyncSnapshot snapshot){
        //snapshot- data -object User
       if (snapshot.hasData || snapshot.hasError){
         return signInGoogleUI();
       } 
       else{
         return PlatziTripsCupertino();
         
       }
       },
      );
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Bienvenidos \n hola mundo", 
                style: TextStyle(
                  fontSize: 37.0,
                  fontFamily:"lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              ButtonGreen(text: "Login with gmail", 
              onPressed: (){
                userBloc.signOut(); 
                userBloc.singIn().then((FirebaseUser user) => print("ella usuarioes ${user.displayName}"));
              },
              width: 300.0,
              height: 50.0,

              )

            ],
          )
        ],
      ),
      );
  }
  
}