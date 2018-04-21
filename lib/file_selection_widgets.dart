import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

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

  Future<String> aws_upload(File imageFile) async {
      //TODO
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
                      new Container(alignment: Alignment.topCenter ,child: new Image.file(widget.imageFile,width: 250.0,)),
                      new Row(
                          verticalDirection: VerticalDirection.down,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[ new MaterialButton(onPressed: (){},
                            child: new Text("Done"),
                            textColor: Colors.white,
                            highlightColor: Colors.teal,
                            splashColor: Colors.yellowAccent,
                            color: Colors.teal,
                            minWidth: 500.0,
                            elevation: 20.0,
                          ),
                          ]
                        ),

                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}