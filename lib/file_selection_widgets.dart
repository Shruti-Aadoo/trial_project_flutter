import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:crypto/crypto.dart';

class fileSelectionRoute extends MaterialPageRoute<String>{
  fileSelectionRoute(File imageFile)
  :super(
    fullscreenDialog:true,
    builder: (BuildContext context){
      return new fileSelectionDialog(imageFile: imageFile);
    }
  );

}

class fileSelectionDialog extends StatefulWidget{
  final File imageFile;

  fileSelectionDialog({this.imageFile});

  @override
  State<StatefulWidget> createState() => new fileSelectionDialogState();
}

class fileSelectionDialogState extends State<fileSelectionDialog>{
  static const platform = const MethodChannel('samples.flutter.io/aws_upload');

  Future<String> aws_upload(File imageFile) async {

    String path = imageFile.absolute.path.toString();

    print("filename"+path.toString());
    var sendmap = <String,dynamic>{
      "file": path,

    };
    print(sendmap);
    String value;
    try {
      value = await platform.invokeMethod('upload_aws',sendmap);
    }catch(e){
      print(e);
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Confirm!"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Flexible(child:
                new SingleChildScrollView(
                  child: new Stack(

                    children: <Widget>[
                      new Image.file(widget.imageFile,width: 250.0,),
                      ],
                      alignment: FractionalOffset.topCenter,
                    ),
                  )
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 16.0),
              child: new MaterialButton(onPressed: (){
                aws_upload(widget.imageFile).then((String response){
                  if(response == "sucess"){
                    Navigator.pop(context);
                  }
                });
              },
                child: new Text("Done"),
                textColor: Colors.white,
                highlightColor: Colors.teal,
                splashColor: Colors.yellowAccent,
                color: Colors.teal,
                minWidth: 500.0,
                elevation: 20.0,
              )
            )
          ],
        ),
      ),
    );
  }
}