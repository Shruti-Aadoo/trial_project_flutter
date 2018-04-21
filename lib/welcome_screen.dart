import 'package:flutter/material.dart';
//import 'package:barcode_scan/barcode_scan.dart'; for bar code scanning
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:trial_project/file_selection_widgets.dart';

class WelcomeScreen extends StatefulWidget{

  WelcomeScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  WelcomeScreenState createState() => new WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>{

  Future<Null> _handlePhotoButtonPressed() async{
    var ImageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    var uploadOnS3 = await Navigator.push(context, new fileSelectionRoute(ImageFile));
  }

  //String barcode = "Hello";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome!"),
        elevation: 30.0,
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: new Center(
        child: new Text("Hello"),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: _handlePhotoButtonPressed,child: new Icon(Icons.camera_alt),backgroundColor: Colors.teal,),

    );
  }





//for Bar code Scanning

//  Future scan() async {
//    try {
//      print("Inside try");
//      String barcode = await BarcodeScanner.scan();
//      setState(() => this.barcode = barcode);
//    } on PlatformException catch (e) {
//      print("Inside");
//      if (e.code == BarcodeScanner.CameraAccessDenied) {
//        print("Inside if");
//        setState(() {
//          this.barcode = 'The user did not grant the camera permission!';
//        });
//      } else {
//        print("Inside else...."+e.toString());
//        setState(() => this.barcode = 'Unknown error: $e');
//      }
//    } on FormatException{
//      print("Inside formal");
//      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
//    } catch (e) {
//      print("Inside catch");
//      setState(() => this.barcode = 'Unknown error: $e');
//    }
//  }
}



