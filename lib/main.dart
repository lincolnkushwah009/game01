import 'package:flutter/material.dart';
import './components/categories.dart';
import './components/dashboard.dart';
import './signup.dart';
import './login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      routes: <String, WidgetBuilder>{
        LoginPage.routeName:(BuildContext context)=>new LoginPage(),
        SignupPage.routeName: (BuildContext context) => new SignupPage(),
        Dashboard.routeName: (BuildContext context) => new Dashboard(),
        Categories.routeName:(BuildContext context)=>new Categories()
      },
      home: new MyHomePage(),
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
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body:LoginPage()
    );
  }
}
