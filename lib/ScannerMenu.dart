import 'package:flutter/material.dart';
import 'package:bhilai_hackathon_project/FruitScanner.dart';
import 'package:bhilai_hackathon_project/VegieScanner.dart';


class ScannerMenu extends StatefulWidget {
  @override
  _ScannerMenuState createState() => _ScannerMenuState();
}

class _ScannerMenuState extends State<ScannerMenu> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xFFFffcdd2),
        body:ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:5.0,left: 10.0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_sharp),
                    color: Colors.black,
                    onPressed: (){
                      print("Icon pressed");
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                      width: 125.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                        ],
                      )
                  )
                ],
              ),
            ),
            SizedBox(height:2.0),
            Padding(
                padding: EdgeInsets.only(left:40.0),
                child: Row(
                  children: [
                    Text("Choose scan",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Cursive',
                            fontWeight: FontWeight.bold,
                            fontSize: 50.0
                        ))
                  ],
                )
            ),
            SizedBox(height: 20.0),
            Container(
              height: MediaQuery.of(context).size.height-155,
              decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(110.0)),
              ),
              child: ListView(

                padding: EdgeInsets.only(top:40,left:20.0,right: 20.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height-240,
                        child:ListView(
                          padding: EdgeInsets.all(10),
                          children: [

                            Container( //**********1st container starts***********
                              //color: Colors.teal,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0),

                                ),
                                child: Container(
                                    padding: EdgeInsets.all(15.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(color:Color(0xFFe57373), spreadRadius: 2),
                                      ],
                                    ),
                                    child:GestureDetector(child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(

                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.circular(180.0),
                                            ),
                                            child: ImageIcon(
                                                AssetImage('assets/harvest.png'),
                                                size:120.0,
                                                color:Colors.black
                                            )
                                        ),
                                        Text("Fruits",style:TextStyle(fontFamily: 'Calibri',fontSize: 30,fontWeight:FontWeight.bold))
                                      ],
                                    ),
                                      onTap: (){
                                        print("Tapped row container");
                                        Navigator.push(context,MaterialPageRoute(builder:  (context) => FruitScanner()));
                                      },)
                                )
                            ), //**********1st container ends here**********

                            SizedBox(height:25.5),

                            // ******************2nd Container starts here**************
                            Container( //Main list container starts here
                          //color: Colors.teal,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),

                            ),
                            child: Container(
                              padding: EdgeInsets.all(13.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color:Color(0xFFe57373), spreadRadius: 2),
                                ],
                              ),
                              child:GestureDetector(child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(

                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(180.0),
                                      ),
                                      child: ImageIcon(
                                          AssetImage('assets/vegetable.png'),
                                          size:120.0,
                                          color:Colors.black
                                      )
                                  ),
                                  Text("Vegies",style:TextStyle(fontFamily: 'Calibri',fontSize: 30,fontWeight:FontWeight.bold))
                                ],
                              ),
                              onTap: (){
                                print("Tapped Maize container");
                                Navigator.push(context,MaterialPageRoute(builder:  (context) => VegieScanner()));
                              },
                              )
                            )
                        ),
                        //*****************2nd container ends here***************
                         SizedBox(height: 25.5,),

                        
                          ],
                        )
                    ),
                  )
                ],
              ),
            ),

          ],

        )
    );
  }
}
