import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  static const routeName = '/categories';
  final List<Widget> categoryList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(75, 0, 180, 100),
      appBar: AppBar(
        backgroundColor:Colors.black,
        title: Text("Categories"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Container(

            margin: EdgeInsets.all(10),

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                  border:Border.all(color:Colors.yellow)),
            child: Card(
              margin: EdgeInsets.all(0),
              color: Color.fromRGBO(31, 0, 65, 100),
              elevation: 8,
              child: Column(children: <Widget>[
                SizedBox(height: 30,),
                Icon(
                  Icons.graphic_eq,
                  color: Colors.white,
                  size: 70,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Item $index',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ]),
            ),
          );
        }),
      ),
    );
  }
}
