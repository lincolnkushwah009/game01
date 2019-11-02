import 'package:flutter/material.dart';
import '../screens/user_account.detail.screen.dart';

class Profile extends StatelessWidget {
  static const routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(15, 0, 30, 100),
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Container(
                height: 70,
                child: Card(
                    elevation: 5,
                    color: Color.fromRGBO(50, 0, 74, 100),
                    margin: EdgeInsets.only(top: 0),
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
                      trailing: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(UserAccountDetail.routeName);
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    )),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.greenAccent)),
                child: Card(
                    elevation: 1,
                    color: Color.fromRGBO(50, 0, 74, 100),
                    margin:
                        EdgeInsets.only(top: 0, bottom: 0, right: 0, left: 0),
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
                            "694",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ))
                        ],
                      ),
                    )),
              ),
            ),
//        ListView(
//          children: <Widget>[
//            ListTile(
//              leading: Icon(Icons.map),
//              title: Text('Map'),
//            ),
//            ListTile(
//              leading: Icon(Icons.photo_album),
//              title: Text('Album'),
//            ),
//            ListTile(
//              leading: Icon(Icons.phone),
//              title: Text('Phone'),
//            ),
//          ],
//        ),

            Container(
              child: Card(
                  elevation: 5,
                  color: Color.fromRGBO(50, 0, 74, 100),
                  margin: EdgeInsets.only(top: 0),
                  child: ListTile(
                    leading: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/cash.png")),
                    title: Text(
                      "Total Coins Earned",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        onPressed: (){

                        },

                        icon: Icon(
                          Icons.monetization_on,
                          color: Colors.yellowAccent,


                        ),
                      ),
                    ),
                  )),

            ),
            Divider(
              height: 5,
            ),
            Container(
              child: Column(
                children: List.generate(4, (index) {
                  return Card(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 2),
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
