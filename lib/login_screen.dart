import 'package:flutter/material.dart';
import 'package:trial_project/welcome_screen.dart';

class LoginScreen extends StatelessWidget{
  final TextBox1 = new TextField(
    keyboardType: TextInputType.text,
    autofocus: false,
    decoration: new InputDecoration(
        hintText: "Username",
        hintStyle: new TextStyle(
          color: Colors.white,
        ),
        contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
    ),
  );

  final TextBox2 = new TextField(
    keyboardType: TextInputType.text,
    autofocus: false,
    decoration: new InputDecoration(
        hintText: "Phone Number",
        hintStyle: new TextStyle(
          color: Colors.white,
        ),
        contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
    ),
  );



  @override
  Widget build(BuildContext context) {
      return new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new NetworkImage(
                "http://vitrinebr.info/wp-content/uploads/2017/12/cool-unique-backgrounds-118-best-mobile-wallpapers-images-on-pinterest-mobile-wallpaper-download.jpg"
              ),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
        child: new Scaffold(
          backgroundColor: Colors.transparent,
          body: new Padding(
            padding: const EdgeInsets.only(top: 50.0,bottom: 40.0,left: 10.0,right: 10.0),
            child: new Container(
              color: Colors.black45,
              child: new Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "Welcome!",
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                      ),
                    ),
                    TextBox1,
                    TextBox2,
                    new MaterialButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  maintainState: true, builder: (context) => new WelcomeScreen())
                          );
                        },
                        color: Colors.white,
                        elevation: 20.0,
                        padding: new EdgeInsets.all(10.0),
                        textColor: Colors.black,
                        splashColor: Colors.yellowAccent,
                        child: new Text(
                            "Login"
                        )
                    )
                  ],
                ),
            ),
          ),

        ),
      );
  }

}