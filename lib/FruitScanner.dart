import 'package:flutter/material.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class FruitScanner extends StatefulWidget {
  @override
  _FruitScannerState createState() => _FruitScannerState();
}

class _FruitScannerState extends State<FruitScanner> {
  File _image;
  List _results;
  int ctr=1;
  @override
  void initState()
  {
    super.initState();
    loadModel();
  }

  @override
  void dispose()
  {
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFffcdd2),
        body:ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:15.0,left: 10.0),
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
            SizedBox(height:25.0),
            Padding(
                padding: EdgeInsets.only(left:40.0),
                child: Row(
                  children: [
                    Text("& your fruit has...",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Cursive',
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0
                        ))
                  ],
                )
            ),
            SizedBox(height: 40.0),
            Container(
              height: MediaQuery.of(context).size.height-185,
              decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(130.0)),
              ),
              child: ListView(

                padding: EdgeInsets.only(left:25.0,right: 20.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height-430.0,
                        child:ListView(
                          //padding: EdgeInsets.
                          children: [


                            Column(
                              children: [
                                if (_image != null)
                                  Container(margin: EdgeInsets.all(10), child: Image.file(_image),height: 270,width: 270,)
                                else
                                  Container(
                                    margin: EdgeInsets.all(40),
                                    child: Opacity(
                                      opacity: 0.6,
                                      child: Center(
                                        child: Text('No Image Selected!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),
                                      ),
                                    ),
                                  ),

                                SingleChildScrollView(
                                  child: Column(

                                    children: _results != null
                                        ? _results.map((result) {
                                      return Container(
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(color:Color(0xFFb71c1c), spreadRadius: 2),
                                          ],
                                        ),
                                        child: GestureDetector(child:Container(

                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                            "${result["label"]} - ${result["confidence"].toStringAsFixed(2)}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                          onTap: (){
                                            print(result["label"].toString());
                                            //print(type)
                                            if(result["index"]==0)
                                            {
                                              print("yes");
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => Apple()));
                                            }
                                            else if (result["index"]==1)
                                            {
                                              print("yes");
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => Banana()));
                                            }
                                            else if (result["index"]==2)
                                            {
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => Orange()));
                                              print("yes");
                                            }
                                            else
                                            {
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => Watermelon()));
                                            }
                                          },
                                        )
                                      );
                                    }).toList()
                                        : [],
                                  ),
                                ),

                                SizedBox(height:20),


                              ],
                            )


                          ],
                        )
                    ),
                  ),
                  Column(

                    children: [
                      FloatingActionButton(
                        onPressed: pickGalleryImage,
                        tooltip: 'Select Image From Gallery',
                        child:Icon(Icons.image_rounded),
                        heroTag: null,
                        splashColor: Colors.yellowAccent,
                        elevation: 10,
                        backgroundColor: Color(0xFFb71c1c),
                      ),

                      SizedBox(height:20),

                      FloatingActionButton(
                        onPressed: pickCameraImage,
                        tooltip: 'Capture Image Using Camera',
                        child:Icon(Icons.camera),
                        heroTag: null,
                        splashColor: Colors.yellowAccent,
                        elevation: 10,
                        backgroundColor: Color(0xFFb71c1c),

                      ),
                    ],
                  ),

                ],
              ),
            ),

          ],

        )
    );
  }
  Future loadModel() async {
    Tflite.close();
    String res;
    res = await Tflite.loadModel(
      model: "assets/fruits/model_unquant.tflite",
      labels: "assets/fruits/labels.txt",
    );
    print(res);
  }

  Future pickGalleryImage() async {
    // pick image and...
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    // Perform image classification on the selected image.
    imageClassification(image);
  }

  Future pickCameraImage() async
  {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    imageClassification(image);
  }

  Future imageClassification(File image) async {
    // Run tensorflowlite image classification model on the image
    final List results = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = results;
      _image = image;
    });
  }}



