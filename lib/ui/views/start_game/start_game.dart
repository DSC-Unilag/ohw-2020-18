import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questionbrain.dart';
import '../addplayer_view.dart' as APTeen;

// Creating an instance of the class TeenTruthBrain
TeenTruthBrain teenTruthBrain = TeenTruthBrain();
// Creating an instance of the class TeenDareBrain
TeenDareBrain teenDareBrain = TeenDareBrain();

class StartGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Random _random = Random();
    int _randomName = _random.nextInt(APTeen.players.length).toInt();
    print(_randomName);

    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
        image: new AssetImage("assets/header.jpg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 150.sp,
                    ),
                    Center(
                      child: Text(
                        'Truth or Dare',
                        style: TextStyle(
                          fontFamily: 'DancingScript',
                          fontSize: 40.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Center(
                      //TODO: Show added player name here
                      child: Text(
                        APTeen.players[_randomName],
                        style: TextStyle(
                          fontFamily: 'DancingScript',
                          fontSize: 40.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(50.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondRoute()),
                          );
                        },
                        color: Colors.lightBlueAccent,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Truth',
                            style: TextStyle(
                              fontFamily: 'DancingScript',
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontFamily: 'DancingScript',
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(50.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThirdRoute()),
                          );
                        },
                        color: Colors.blue[900],
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Dare',
                            style: TextStyle(
                              fontFamily: 'DancingScript',
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
    When user clicks on Truth in Truth or Dare for Teens

    SecondRoute is activated
*/
class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  // To check if the user completes the task
  void checkCompleted(bool userPickedAnswer) {
    bool correctAnswer = teenTruthBrain.getCorrectAnswer();

    setState(()  {
      if (teenTruthBrain.isFinished() == true) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StartGame()));
        // Alert(
        //         context: context,
        //         title: "QUIZ FINISHED",
        //         desc: "Flutter is awesome.")
        //     .show();
        teenTruthBrain.reset();
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StartGame()));
      teenTruthBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
        image: new AssetImage("assets/header.jpg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'Truth',
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 50.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  height: 300,
                  width: double.maxFinite,
                  child: Card(
                    elevation: 9,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        teenTruthBrain.getQuestionText(),
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      checkCompleted(false);
                    },
                    color: Colors.lightBlueAccent,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'FORFEIT',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      checkCompleted(true);
                    },
                    color: Colors.blue[900],
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'DONE',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
    When user clicks on Dare in Truth or Dare for Teens.

    ThirdRoute is activated
*/

class ThirdRoute extends StatefulWidget {
  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  void checkCompleted(bool userPickedAnswer) {
    bool correctAnswer = teenDareBrain.getCorrectAnswer();

    setState(() {
      if (teenDareBrain.isFinished() == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StartGame()));
        // Alert(
        //         context: context,
        //         title: "QUIZ FINISHED",
        //         desc: "Flutter is awesome.")
        //     .show();
        teenDareBrain.reset();
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StartGame()));
      teenDareBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
        image: new AssetImage("assets/header.jpg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'Dare',
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 50.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  height: 300,
                  width: double.maxFinite,
                  child: Card(
                    elevation: 9,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        teenDareBrain.getQuestionText(),
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      checkCompleted(false);
                    },
                    color: Colors.lightBlueAccent,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'FORFEIT',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      checkCompleted(true);
                    },
                    color: Colors.blue[900],
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'DONE',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
