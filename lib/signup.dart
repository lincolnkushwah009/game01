import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'json_user.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  static var uri = "http://192.168.1.21:3000";

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

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  Future<dynamic> _loginUser(String name, String email, String password) async {
    try {
      Options options = Options(
//        contentType: ContentType.parse('application/json'),
          );

      Response response = await dio.post('/trivia/users/signup',
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
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 90.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                )
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'NAME',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (val) => !EmailValidator.validate(val, true)
                          ? 'please provide a valid email'
                          : null,
                      decoration: InputDecoration(
                          labelText: 'EMAIL ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _passwordController,
                      validator: (val) =>
                          val.length < 8 ? 'your password is too short' : null,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 50.0),
                    Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => isLoading = true);
                                var res = await _loginUser(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text);
                                setState(() => isLoading = false);

                                JsonUser user = JsonUser.fromJson(res);

                                if (user != null) {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new LoginPage()));
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("incorrect email")));
                                }
                              }
                            },
                            child: Center(
                              child: Text(
                                'SIGNUP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
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
                              child:
                                  ImageIcon(AssetImage('assets/facebook.png')),
                            ),
                            SizedBox(width: 10.0),
                            Center(
                              child: Text('Sign Up with Facebook',
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
                              child: Text('Sign Up with Google',
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
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop('./main.dart');
                          },
                          child: Center(
                            child: Text('Go Back',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ]));
  }
}
