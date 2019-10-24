import 'package:flutter/material.dart';
import '../widgets/customTimerPainter.dart';


class CountDownTimer  extends StatelessWidget{
// TickerProviderStateMixin
  final int questionNo;
  final Function changeQuestion;
  final AnimationController controller;
  CountDownTimer({this.questionNo, this.changeQuestion,this.controller});
  
  String get timerString {
    Duration duration = controller.duration * controller.value;
    if (controller.value == 0.0) {
      changeQuestion();          
    }
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white10,
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    // color: Colors.amber,
                    height:
                        controller.value * MediaQuery.of(context).size.height,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: Container(
                            height: 100,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: CustomPaint(
                                        painter: CustomTimerPainter(
                                      animation: controller,
                                      backgroundColor: Colors.white,
                                      color: themeData.indicatorColor,
                                    )),
                                  ),
                                  Align(
                                    alignment: FractionalOffset.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        // Text(
                                        //   "Timer",
                                        //   style: TextStyle(
                                        //       fontSize: 20.0,
                                        //       color: Colors.red),
                                        // ),
                                        Text(
                                          timerString,
                                          style: TextStyle(
                                              fontSize: 35.0,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // AnimatedBuilder(
                      //     animation: controller,
                      //     builder: (context, child) {
                      //       return FloatingActionButton.extended(
                      //           onPressed: () {
                      //             if (controller.isAnimating)
                      //               controller.stop();
                      //             else {
                      //               controller.reverse(
                      //                   from: controller.value == 0.0
                      //                       ? 1.0
                      //                       : controller.value);
                      //             }
                      //           },
                      //           icon: Icon(controller.isAnimating
                      //               ? Icons.pause
                      //               : Icons.play_arrow),
                      //           label: Text(
                      //               controller.isAnimating ? "Pause" : "Play"));
                      //     }),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
