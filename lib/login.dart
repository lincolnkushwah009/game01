import 'package:flutter/material.dart';
import './components/dashboard.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  static var uri = "http://192.168.1.21:3000";
  bool isLoading = false;
  static BaseOptions options = BaseOptions(
      baseUrl: uri,
      responseType: ResponseType.plain,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      validateStatus: (code) {
        if (code >= 200) {
          return true;
        }
        return false;
      });

  static Dio dio = Dio(options);


  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  Future<dynamic> loginUser(String name, String email, String password) async {
    try {
      Options options = Options(
//        contentType: ContentType.parse('application/json'),
          );

      Response response = await dio.post('/trivia/users/login',
          data: {"name": name, "email": email, "password": password},
          options: options);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.data);
        return responseJson;
      } else if (response.statusCode == 401) {
        throw Exception("Incorrect Email/Password");
      } else
        throw Exception('Authentication Error');
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        throw Exception("Network Error");
      } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
          exception.type == DioErrorType.CONNECT_TIMEOUT) {
        throw Exception(
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
                  child: Text('Hello',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 145.0, 0.0, 0.0),
                  child: Text('There',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(220.0, 145.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  GestureDetector(
                    onTap:() {
                       Navigator.of(context).pushNamedAndRemoveUntil(
                          Dashboard.routeName, (Route<dynamic> route) => false);
                    // onTap: () async {
                      // setState(() => isLoading = true);
                      // var res = await _loginUser(_nameController.text,
                      //     _emailController.text, _passwordController.text);
                      // setState(() => isLoading = false);

                      // JsonUser user = JsonUser.fromJson(res);

                      // if (user != null) {
                      //   Navigator.of(context).push(new MaterialPageRoute(
                      //       builder: (context) => new Dashboard()));
                      // } else {
                      //   Scaffold.of(context).showSnackBar(
                      //       SnackBar(content: Text("incorrect email")));
                      // }
                    },
                    child: Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: ImageIcon(AssetImage('assets/facebook.png')),
                          ),
                          SizedBox(width: 10.0),
                          Center(
                            child: Text('Log in with facebook',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: ImageIcon(AssetImage('assets/google.png')),
                          ),
                          SizedBox(width: 10.0),
                          Center(
                            child: Text('Log in with Google',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'New to this App ?',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
