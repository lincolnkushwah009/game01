import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../widgets/countDownTimer.dart';
import 'package:flutter/scheduler.dart';

class PlayScreen extends StatefulWidget {
  static const routeName = "/playScreen";
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> with TickerProviderStateMixin {
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
      'question':
          'Who\'s Yours Favoirte Programing Language.',
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
  AnimationController controller;
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
  }

  void setTotal(int point) {
    setState(() {
      SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
            controller.reverse(
                from: controller.value == 0.0 ? 1.0 : controller.value);
            _selectedQuestion++;
            total += point;
          }));
    });
  }

  void playAgain() {
    setState(() {
      SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
            controller.reverse(from: 1.0);
            total = 0;
            _selectedQuestion = 0;
          }));
    });
  }

  void changeQuestion() {
    print("change");
    SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
          controller.reverse(
              from: controller.value == 0.0 ? 1.0 : controller.value);
          return _selectedQuestion++;
        }));
  }

  List get getAnswers {
    List answer = _question[_selectedQuestion]['ans'];
    return answer.map((item) {
      return Container(
        margin: EdgeInsets.all(5),
        child: RaisedButton(
          color: Colors.green,
          onPressed: () {
            changeQuestion();
            setTotal(item['point']);
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            child: Text(
              item['ans'],
              style: TextStyle(fontSize: 25, color: Colors.white),
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
      body: Center(
        child: _selectedQuestion < _question.length
            ? SingleChildScrollView(
                child: Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: CountDownTimer(
                            questionNo: _selectedQuestion,
                            changeQuestion: changeQuestion,
                            controller: controller),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Q${_selectedQuestion + 1} ' +
                                _question[_selectedQuestion]['question'],
                            style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 1.0,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: getAnswers),
                      )
                    ],
                  ),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.greenAccent)),
                      child: Card(
                        color: Color.fromRGBO(92, 0, 125,100),
                        margin: EdgeInsets.all(0),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.yellowAccent, width: 5)),
                                  child: Center(
                                    child: Text(
                                      "5",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "You Did It. Your Total Point is " +
                                      total.toString(),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                RaisedButton(
                                  color: Colors.green,
                                  onPressed: () {
                                    playAgain();
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        "Play Again!",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}


//
//import 'package:flutter/material.dart';
//
//import 'package:frideos/frideos.dart';
//
//
//import '../widgets/answers_widget.dart';
//import '../widgets/countdown_widget.dart';
//import '../widgets/question_widget.dart';
//
//class TriviaPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final bloc = AppStateProvider.of<AppState>(context).triviaBloc;
//
//    return ValueBuilder<TriviaState>(
//        streamed: bloc.triviaState,
//        builder: (context, snapshotTrivia) {
//          return ValueBuilder<Question>(
//              streamed: bloc.currentQuestion,
//              builder: (context, snapshotQuestion) {
//                return Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height,
//                  padding: const EdgeInsets.only(top: 22),
//                  child: TriviaMain(
//                      triviaState: snapshotTrivia.data,
//                      question: snapshotQuestion.data),
//                );
//              });
//        });
//  }
//}
//
//class TriviaMain extends StatelessWidget {
//  const TriviaMain({this.triviaState, this.question});
//
//  final TriviaState triviaState;
//  final Question question;
//
//  @override
//  Widget build(BuildContext context) {
//    final bloc = AppStateProvider.of<AppState>(context).triviaBloc;
//
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.center,
//      children: <Widget>[
//        Container(
//          padding: const EdgeInsets.symmetric(horizontal: 22),
//          decoration: BoxDecoration(
//            color: const Color(0xff283593),
//            borderRadius: const BorderRadius.only(
//                bottomLeft: Radius.circular(25),
//                bottomRight: Radius.circular(25)),
//            boxShadow: [
//              BoxShadow(color: Colors.blue, blurRadius: 3.0, spreadRadius: 1.5),
//            ],
//          ),
//          child: Column(
//            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.all(16),
//                    child: Text(
//                      'SCORE: ${bloc.stats.score}',
//                      style: scoreHeaderStyle,
//                    ),
//                  ),
//                ],
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    'Corrects: ${bloc.stats.corrects.length}',
//                    style: questionsHeaderStyle,
//                  ),
//                  Text(
//                    'Wrongs: ${bloc.stats.wrongs.length}',
//                    style: questionsHeaderStyle,
//                  ),
//                  Text(
//                    'Not answered: ${bloc.stats.noAnswered.length}',
//                    style: questionsHeaderStyle,
//                  ),
//                ],
//              ),
//              const SizedBox(
//                height: 12,
//              )
//            ],
//          ),
//        ),
//        Container(
//          height: 12,
//        ),
//        Container(
//          padding: const EdgeInsets.all(8),
//          child: QuestionWidget(
//            bloc: bloc,
//            question: question,
//          ),
//        ),
//        Container(
//          height: 32,
//        ),
//        Expanded(
//          child: ValueBuilder<AnswerAnimation>(
//              streamed: bloc.answersAnimation,
//              builder: (context, snapshot) {
//                return Container(
//                    padding: const EdgeInsets.symmetric(horizontal: 22),
//                    child: AnswersWidget(
//                      bloc: bloc,
//                      question: question,
//                      answerAnimation: snapshot.data,
//                      isTriviaEnd: triviaState.isTriviaEnd,
//                    ));
//              }),
//        ),
//        ValueBuilder<int>(
//            streamed: bloc.currentTime,
//            builder: (context, snapshot) {
//              return Column(
//                children: <Widget>[
//                  Container(
//                    height: 24,
//                    padding: const EdgeInsets.all(22),
//                    child: Text(
//                      'Time left: ${((bloc.countdown - snapshot.data) / 1000)}',
//                      style: const TextStyle(
//                          color: Colors.white,
//                          fontSize: 12,
//                          fontStyle: FontStyle.italic),
//                    ),
//                  ),
//                ],
//              );
//            }),
//        Container(
//          height: 18,
//        ),
//        CountdownWidget(
//          width: MediaQuery.of(context).size.width,
//          duration: bloc.countdown,
//          triviaState: triviaState,
//        ),
//      ],
//    );
//  }
//}
