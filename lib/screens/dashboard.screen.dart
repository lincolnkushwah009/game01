import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/painting.dart';
import '../screens/categories.screen.dart';
import '../screens/profile.screen.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 0, 74, 100),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: <Widget>[
            GestureDetector(
              child: CircleAvatar(),
              onTap: () {
                Navigator.of(context).pushNamed(Profile.routeName);
              },
            ),
            SizedBox(
              width: 5,
            ),
            Text(" Hi, George")
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SizedBox(
                height: 200.0,
                width: 300.0,
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.green)),
                  child: Carousel(
                    images: [
                      NetworkImage(
                          'https://cdn3.movieweb.com/i/article/evkgjS87YJyxAttm7AW0s2V6c6Wqj5/738:50/How-To-Train-Your-Dragon-3-Movie-Review.jpg'),
                      NetworkImage(
                          'https://images7.alphacoders.com/994/994868.jpg'),
                      NetworkImage(
                          'http://freefiremobile-a.akamaihd.net/ffwebsite/images/wallpaper/pop/067.jpg'),
                      NetworkImage(
                          'http://freefiremobile-a.akamaihd.net/ffwebsite/images/wallpaper/pop/019.jpg'),
                      NetworkImage(
                          'http://freefiremobile-a.akamaihd.net/ffwebsite/images/wallpaper/pop/004.jpg'),
                      ExactAssetImage("assets/game_img/game03.png")
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              color: Color.fromRGBO(67, 0, 100, 100),
              padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
              height: 180.0,
              child: ListView(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Image.asset('assets/game_img/game01.jpeg')),
                  SizedBox(width: 15.0),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Image.asset('assets/game_img/game02.jpg')),
                  SizedBox(width: 15.0),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Image.asset('assets/game_img/game03.png')),
                  SizedBox(width: 15.0),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Image.asset('assets/game_img/game04.jpg')),
                  SizedBox(width: 15.0),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Image.asset('assets/game_img/game05.jpg')),
                  SizedBox(width: 15.0),
                ],
              )),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 10),
            child: Center(
              child: RaisedButton(
                  color: Colors.green,
                  child: Container(
                      height: 50,
                      width: 100,
                      child: Center(
                          child: Text(
                        "Play",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ))),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Categories.routeName);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0))),
            ),
          )
        ],
      ),
    );
  }
}
