import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  static const routeName = "/playScreen";
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int total = 0;
  List<dynamic> _question = [
    {
      'question': 'Who\'s Yours Favoirte Animal.',
      'ans': [
        {'point': 12, 'ans': 'Elephant'},
        {'point': 34, 'ans': 'Tiger'},
        {'point': 45, 'ans': 'Dog'},
        {'point': 78, 'ans': 'Cat'}
      ]
    },
    {
      'question': 'Who\'s Yours Favoirte Season.',
      'ans': [
        {'point': 12, 'ans': 'Rainy'},
        {'point': 34, 'ans': 'Summer'},
        {'point': 45, 'ans': 'Winter'},
        {'point': 78, 'ans': 'Spring'}
      ]
    },
    {
      'question': 'What\'s Yours Favoirte Job.',
      'ans': [
        {'point': 12, 'ans': 'Backend Developer'},
        {'point': 34, 'ans': 'frontend Developer'},
        {'point': 45, 'ans': 'FullStack Developer'},
        {'point': 78, 'ans': 'BlockChain Developer'}
      ]
    },
    {
      'question': 'Who\'s Yours Favoirte Programing Language.',
      'ans': [
        {'point': 12, 'ans': 'C'},
        {'point': 34, 'ans': 'C++'},
        {'point': 45, 'ans': 'JAVA'},
        {'point': 78, 'ans': 'Python'}
      ]
    },
    {
      'question': 'Who\'s Your Favoirte OS',
      'ans': [
        {'point': 12, 'ans': 'IOS'},
        {'point': 34, 'ans': 'Android'},
        {'point': 45, 'ans': 'Linux'},
        {'point': 78, 'ans': 'Flusy'}
      ]
    },
  ];
  int _selectedQuestion = 0;

  void setTotal(int point) {
    total += point;
  }

  List get getAnswers {
    List answer = _question[_selectedQuestion]['ans'];
    return answer.map((item) {
      return Container(
        margin: EdgeInsets.all(5),
        child: RaisedButton(
          color: Colors.blue,
          onPressed: () {
            setState(() {
              _selectedQuestion++;
              setTotal(item['point']);
            });
          },
          child: Container(
            height: 50,
            width: double.infinity,
            child: Center(
              child: Text(
                item['ans'],
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play"),
      ),
      body: _selectedQuestion < _question.length
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          _question[_selectedQuestion]['question'],
                          style: TextStyle(fontSize: 20, letterSpacing: 1.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: getAnswers),
                  )
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "You Did It. Your Total Point is " + total.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        total = 0;
                        _selectedQuestion = 0;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      child: Center(
                        child: Text(
                          "Play Again!",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
