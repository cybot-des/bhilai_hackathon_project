import 'package:flutter/material.dart';
import "dart:io";
import "dart:math";

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {

  double my_height;
  double my_weight;
  double my_bmi;
  bool _ismale;
  bool _isfemale;
  bool _isEmpty;
  
  var msgBodyController = TextEditingController(text: '',);
  var msgBodyController2 = TextEditingController(text: '',);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2185B),
      body:ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top:5.0,left: 10.0),     //+++++++++++++++++++++++++++ Changes for lifting up (top)
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: (){
                    print("Icon pressed");
                    //Navigator.pop(context);
                  },
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon:Icon(Icons.filter_list_rounded),
                          color:Colors.white,
                          onPressed: (){print("Icon filter Pressed");},
                        ),
                        IconButton(
                            icon:Icon(Icons.translate),
                            color:Colors.white,
                            onPressed: (){print("Icon Menu Pressed");}
                        )
                      ],
                    )
                )
              ],
            ),
          ),
          SizedBox(height:2.0),                                 //+++++++++++++++++++++++++++ Changes for lifting up (height)
          Padding(
              padding: EdgeInsets.only(left:40.0),
              child: Row(
                children: [
                  Text("feedback...",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cursive',
                          fontWeight: FontWeight.bold,
                          fontSize: 45.0
                      ))
                ],
              )
          ),
          SizedBox(height: 20.0),
          Container(
            height: MediaQuery.of(context).size.height-155,     //+++++++++++++++++++++++++++ Changes for lifting up (155)
            decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(130.0)),
            ),
            child: ListView(

              padding: EdgeInsets.only(left:20.0,right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height-240.0, //+++++++++++++++++++++++++++ Changes for lifting up (260 se 240)
                      child:ListView(
                        //padding: EdgeInsets.
                        children: [
                          //*************************1st container****************************************
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0),),
                                child: Container(
                                        padding: EdgeInsets.all(13.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(color:Color(0xFFC2185B), spreadRadius: 2),
                                          ],
                                        ),
                                        child: Row(    // +++++++ Text Area Code starts from here ++++++
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                height: 70,
                                                width: MediaQuery.of(context).size.width-110,
                                                child: TextField(
                                                    style: TextStyle(fontSize: 20),
                                                    textAlign: TextAlign.center,
                                                    controller:msgBodyController,maxLines: null,
                                                    
                                                    decoration: InputDecoration(
                                                    hintText: "Type your Height(m)",
                                                    border: InputBorder.none,
                                                    //errorText: _validate ? null: 'Msg cannot be empty !',
                                                  ),
                                            ),)


                                          ],
                                        ), //+++++++++ Text Area for height ends here++++++++++++++

                                )
                              ),
                                // _______________________1st container ends here_______________________________

                                SizedBox(height: 25.5),


                        // -----------------------  2nd Container starts here ------------------------------------------

                                // +++++++++++++++++++++++  Weight ++++++++++++++++++++++++++++
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0),),
                                child: Container(
                                        padding: EdgeInsets.all(13.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(color:Color(0xFFC2185B), spreadRadius: 2),
                                          ],
                                        ),
                                        child: Row(    // +++++++ Text Area Code starts from here ++++++
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                height: 70,
                                                width: MediaQuery.of(context).size.width-110,
                                                child: TextField(
                                                    style: TextStyle(fontSize: 20),
                                                    textAlign: TextAlign.center,
                                                    controller:msgBodyController2,maxLines: null,
                                                    
                                                    decoration: InputDecoration(
                                                    hintText: "Type your Weight(kg)",
                                                    border: InputBorder.none,
                                                    //errorText: _validate ? null: 'Msg cannot be empty !',
                                                  ),
                                            ),)


                                          ],
                                        ), //+++++++++ Text Area for weight ends here++++++++++++++

                                )
                              ),

                    // ___________________________2nd container ends here______________________________________

                          SizedBox(height:25.5),



                    // -----------------------Button to invoke calculator function-------------------

                        FlatButton(
                          child: Icon(Icons.check_box, size: 70.0,color: Colors.pink),
                          //hoverColor: Colors.pink[50],
                          
                          
                          onPressed: (){
                          my_height = double.parse(msgBodyController.text);
                          my_weight = double.parse(msgBodyController2.text);
                          //double my_h = double.parse(my_height);
                          my_bmi = my_weight/(my_height*my_height);
                          print(my_bmi.toStringAsFixed(2));
                          //String my_string_bmi = my_bmi.toStringAsFixed(2);

                          if(my_bmi>=25)
                          {
                            Text("Your BMI is: ${my_bmi.toStringAsFixed(2)} and You are over weight",style: TextStyle(color: Colors.black,fontSize: 40.0));
                          }
                          else if(my_bmi>=18 && my_bmi<25)
                          {
                            Text("Your BMI is: ${my_bmi.toStringAsFixed(2)} and You have normal BMi",style: TextStyle(color: Colors.black,fontSize: 40.0));

                          }
                          else if(my_bmi<18)
                          {
                            Text("Your BMI is: ${my_bmi.toStringAsFixed(2)} and You are under weight",style: TextStyle(color: Colors.black,fontSize: 40.0));
                          }
                          
                        }),

                        

                        SizedBox(height:25.0),

                        





                        ],
                      )
                  ),
                )
              ],
            ),
          ),

        ],

      ),

    );
  }
}