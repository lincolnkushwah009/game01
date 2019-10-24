import 'package:flutter/material.dart';
import './screens/categories.screen.dart';
import './screens/dashboard.screen.dart';
import './screens/profile.screen.dart';
import './screens/play.screen.dart';
import './screens/user_account.detail.screen.dart';
import './screens/signup.screen.dart';
import './screens/login.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.routeName,
      routes: <String, WidgetBuilder>{
        LoginPage.routeName: (BuildContext context) => LoginPage(),
        SignupPage.routeName: (BuildContext context) => SignupPage(),
        Dashboard.routeName: (BuildContext context) => Dashboard(),
        Categories.routeName: (BuildContext context) => Categories(),
        Profile.routeName: (BuildContext context) => Profile(),
        PlayScreen.routeName: (BuildContext context) => PlayScreen(),
        UserAccountDetail.routeName: (BuildContext context) =>
            UserAccountDetail()
      },
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.black),
          scaffoldBackgroundColor: Color.fromRGBO(75, 0, 180, 100),
          textTheme: TextTheme(
              title: TextStyle(color: Colors.white),
              body1: TextStyle(color: Colors.white))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomPadding: false, body: LoginPage());
  }
}
