import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_sms/flutter_sms.dart';


class feedbackScreen extends StatefulWidget {
  @override
  _feedbackScreenState createState() => _feedbackScreenState();
}

class _feedbackScreenState extends State<feedbackScreen> {
  double _ratingValue;
  var msgBodyController = TextEditingController(text: '',);
  bool _validated;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffcdd2),
      body:ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top:5.0,left: 10.0),     //+++++++++++++++++++++++++++ Changes for lifting up (top)
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
          SizedBox(height:2.0),                                 //+++++++++++++++++++++++++++ Changes for lifting up (height)
          Padding(
              padding: EdgeInsets.only(left:40.0),
              child: Row(
                children: [
                  Text("feedback...",
                      style: TextStyle(
                          color: Colors.black,
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


                          Column(  //********Column Container for star rating starts here*******
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child:Text("Rate Us ?",
                                    style:TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,)),
                              ),
                              SizedBox(height: 15.0,),
                              Center(child:RatingBar(

                                  allowHalfRating: true,
                                  initialRating: 0,
                                  itemCount: 5,
                                  ratingWidget: RatingWidget(
                                    full:Icon(Icons.star,),
                                    half: Icon(Icons.star_half),
                                    empty: Icon(Icons.star_outline)
                                  ),
                                  onRatingUpdate: (value){
                                    setState(() {
                                      _ratingValue=value;
                                    });
                                    print(_ratingValue);
                                  })),

                            ],
                          ),
                          //********Column Container for star rating ends here*******

                          SizedBox(height:40.0),

                          Column(
                            children: [
                              // child 1 for Text Area with Decoration
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
                                                height: 200,
                                                width: MediaQuery.of(context).size.width-110,
                                                child: TextField(
                                                    style: TextStyle(fontSize: 19),
                                                    textAlign: TextAlign.center,
                                                    controller:msgBodyController,maxLines: null,
                                                    maxLength: 1000,
                                                    decoration: InputDecoration(
                                                    hintText: "Type your Queries here...",
                                                    border: InputBorder.none,
                                                    //errorText: _validate ? null: 'Msg cannot be empty !',
                                                  ),
                                            ),)


                                          ],
                                        ), //+++++++++ Text Area Code ends here++++++++++++++

                                )
                              ),
                              // 1st Child container of Text Area with decoration ends here

                              SizedBox(height: 90.0,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  RaisedButton(  // ************* Mailing Function starts here *****************
                                      color: Color(0xFFC2185B),
                                      elevation: 2,
                                      onPressed: (){
                                        msgBodyController.text.isEmpty?_validated = false : _validated=true;
                                        if(_validated==false)
                                          {
                                            print("Text Area is empty");
                                            Flushbar(
                                              title:  "Hey there !",
                                              message:  "Message Feild cannot be empty !",
                                              duration:  Duration(seconds: 3),
                                            )..show(context);
                                          }
                                        else{
                                          String msgbody = msgBodyController.text+'\n Rating : $_ratingValue';
                                          print("Button is pressed");
                                          //launch(_emailLaunchUri.toString());

                                          _sendMail(String toMailId, String subject, String body) async {
                                            var url = 'mailto:$toMailId?subject=$subject&body=$body';
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            }
                                            else {
                                              throw 'Could not launch $url';
                                            }
                                          }
                                          _sendMail('testprojectmail33@gmail.com', 'Feedback',msgbody);

                                        }
                                        },
                                      child: Text('Mail Here',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),),
                                  ),
                                  // ************* Mailing Function ends here *****************

                                  SizedBox(height: 20,),

                                  RaisedButton // ***************** SMS function starts here ***********************
                                    (
                                    color: Color(0xFFC2185B),
                                    elevation: 2,
                                    onPressed: (){
                                      msgBodyController.text.isEmpty?_validated = false : _validated=true;
                                      if(_validated==false)
                                      {
                                        print("Text Area is empty");
                                        Flushbar(
                                          title:  "Hey there !",
                                          message:  "Message Field cannot be empty !",
                                          duration:  Duration(seconds: 3),
                                        )..show(context);
                                      }
                                      else{
                                        String msgbody = msgBodyController.text+'\n Rating : $_ratingValue';
                                        print("Button is pressed");
                                        //launch(_emailLaunchUri.toString());

                                        _sendMessage(String message, List<String> recipents) async {
                                          await sendSMS(message: message, recipients: recipents)
                                              .catchError((onError) {
                                            print(onError);
                                          });

                                        }

                                        _sendMessage(msgbody,['9137248628']);

                                      }
                                    },
                                    child: Text('SMS Here',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),),
                                      ),
                                ],
                              )
                              // ***************** SMS function ends here ***********************


                            ],
                          )






                          //****************************** 1rd container ends here***********************************

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
