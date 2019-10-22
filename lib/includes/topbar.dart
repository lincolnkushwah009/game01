import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("MyApp"),
       ),
       body: Container(
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          color: Colors.green,
      ),         
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/bhai.jpg'),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Hi, George",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    ),
    ); 
  }
}



