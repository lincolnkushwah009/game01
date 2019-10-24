import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screens/play.screen.dart';

class Categories extends StatefulWidget {
  static const routeName = '/categories';
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Categories> {
  List categoryList;
  Map data;

  getQuestions() async {
    http.Response response =
        await http.get('http://192.168.1.21:3000/trivia/get/category');
    data = json.decode(response.body);
    print(data);
    setState(() {
      categoryList = data['category'];
    });
    debugPrint(response.body);
  }

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(75, 0, 180, 100),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Categories"),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 8,
        // itemCount: categoryList == null ? 0 : categoryList.length,

        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(PlayScreen.routeName);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.yellow)),
              child: Card(
                margin: EdgeInsets.all(0),
                color: Color.fromRGBO(31, 0, 65, 100),
                elevation: 8,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Icon(
                    Icons.graphic_eq,
                    color: Colors.white,
                    size: 70,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Cat" + index.toString(),
                      // "${categoryList[index]["name"]}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
