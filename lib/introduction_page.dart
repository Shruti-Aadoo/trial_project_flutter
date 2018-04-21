import 'package:flutter/material.dart';
import 'package:circle_indicator/circle_indicator.dart';
import 'package:trial_project/login_screen.dart';



class IntroductionPage extends StatelessWidget{

  final PageController controller = new PageController();

  @override
  Widget build(BuildContext context) {
    var pageList = [

      new PageItem("https://i.pinimg.com/originals/2e/c6/b5/2ec6b5e14fe0cba0cb0aa5d2caeeccc6.jpg"),
      new PageItem("https://i.imgur.com/BOBnmUH.jpg"),
      new PageItem("https://i.pinimg.com/originals/03/11/26/03112633794c2b258420b2bf7e5856e6.jpg"),
      new PageItem("https://i.pinimg.com/originals/72/75/38/727538673ef8a884113e5c134e9bf228.jpg"),
      new PageItem("http://7-themes.com/data_images/collection/7/4489851-phone-wallpapers.jpg"),

    ];

    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.only(top: 16.0),
        decoration: new BoxDecoration(
          color: Colors.transparent,
        ),
        child: new Stack(
          alignment: FractionalOffset.bottomCenter,
          children: <Widget>[
            new PageView.builder( controller: controller,
              itemCount: pageList.length,
              itemBuilder: (_, int i) => pageList[i],),
            new Container(
              child: new CircleIndicator(controller, pageList.length, 3.0, Colors.white70, Colors.white),
            ),

          ],

        ),
      ),
    );
  }

}

class PageItem extends StatelessWidget{
  final String imageAsset;


  PageItem(
      this.imageAsset
      );

  @override
  Widget build(BuildContext context) {
     return new Container(
       decoration: new BoxDecoration(
         image: new DecorationImage(
             image: new NetworkImage(
               imageAsset
             ),
           fit: BoxFit.cover
         ),

       ),
       child: new Padding(
         padding: const EdgeInsets.all(20.0),
         child: new Container(
           alignment: Alignment.bottomLeft,
           child: new RaisedButton(
               onPressed: (){
                 Navigator.push(
                       context,
                       new MaterialPageRoute(
                           maintainState: false, builder: (context) => new LoginScreen())
                 );
                  },
             colorBrightness: Brightness.light,
             splashColor: Colors.yellowAccent,
             elevation: 10.0,
             child: new Text("Skip ",
             style: new TextStyle(
               color: Colors.white,
               fontSize: 15.0
             ),),
             color: Colors.black45,
           ),
         ),
       ),
     );
  }
}


