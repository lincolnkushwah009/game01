import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Container(
                height: 80,
                child: Card(
                    elevation: 5,
                    color: Colors.blue,
                    margin: EdgeInsets.only(top: 5),
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text(
                        "George Micheal",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "George.Micheal",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Container(
                height: 80,
                child: Card(
                    elevation: 5,
                    color: Colors.blue,
                    margin: EdgeInsets.only(top: 5),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              child: Text(
                            "234",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          )),
                          Container(
                              child: Text(
                            "234",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ))
                        ],
                      ),
                    )),
              ),
            ),
            Container(
              child: Column(
                children: List.generate(4, (index) {
                  return Card(
                    margin: EdgeInsets.all(0),
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text("data"),
                      subtitle: Text("SDFSDF"),
                      trailing: Icon(Icons.add_alert),
                    ),
                  );
                }),
              ),
            ),
            Divider(thickness: 1.0,),
            Container(
              child: Column(
                children: List.generate(4, (index) {
                  return Card(
                    margin: EdgeInsets.all(0),
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text("data"),
                      subtitle: Text("SDFSDF"),
                      trailing: Icon(Icons.add_alert),
                    ),
                  );
                }),
              ),
            ),
          ]),
        ));
  }
}
