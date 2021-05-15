import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:bhilai_hackathon_project/MenuPage.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'package:animated_splash_screen/animated_splash_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlashScreen(),
    );
  }
}

class FlashScreen extends StatefulWidget
{
  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {

  @override
  /*void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MenuPage()))
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      // app screen laoding time

      seconds: 2,
      navigateAfterSeconds: MenuPage(),
      //title:Text("Agro Culture",style: TextStyle(fontSize: 45,fontFamily: 'Cursive'),),
      loadingText: Text("Please Wait...",style: TextStyle(fontSize: 25,fontFamily: 'Cursive'),),
      // image for screen
      image: Image.asset('assets/NutriFoodz.png'),
      // screen background color
      backgroundColor: Colors.white,
      // image size on screen
      photoSize:200,
      loaderColor: Color(0xFFe57373),
    );

      /*Container(
      color: Colors.white,
      child:FlutterLogo(size: MediaQuery.of(context).size.height),
    );*/
  }
}

