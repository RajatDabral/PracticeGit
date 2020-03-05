//import 'package:first_app/quiz.dart';
import 'package:flutter/material.dart';

import './result.dart';

//import './question.dart';
/*  TO import our own Class/Package "./" refers to look into the same directory*/
//import './answer.dart';
import './quiz.dart';

void main() => runApp(MyApp());

//STATELESS_WIDGET

/*

 class MyApp extends StatelessWidget {

int questionIndex = 0;
void answerQuestion()
{
  questionIndex = questionIndex + 1;
  print('questionIndex $questionIndex');
}


  Widget build(BuildContext context) {
    // return MaterialApp(home: Text('Hi Dude, Lets become awesome'));

   var questions = ['Who is your fav. person?','who is the cutest?'];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: Column
          (
            children: [
              Text(questions[questionIndex]),
              RaisedButton(
                child: Text('Rajat'),
                onPressed: answerQuestion,
              ),
              RaisedButton(
                child: Text('Dabbu'),
                onPressed: answerQuestion,
              ),
              RaisedButton(
                child: Text('Mai toh nahi hoon'),
                onPressed: answerQuestion,
              )
            ],
          )),
    );
  }
  
} 
*/

//STATEFUL_WIDGET

/* Starts here  */

class MyApp extends StatefulWidget {
  @override // Create State takes no argument but return state object
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState(); //COnnected the two classes.
  }
}

class _MyAppState extends State<MyApp> {
  //state is a generic class, State<MyApp> is a connection to the main MyApp class.

   final _questions = const [
    {
      'questionText': 'Who is your favorite person?',
      'answers': [
        {'text': 'Rajat', 'score': 10},
        {'text': 'Papa', 'score': 5},
        {'text': 'Mummy', 'score': 3},
        {'text': 'Sheru', 'score': 1},
      ],
    },
    {
      'questionText': 'Who is the cutest person?',
      'answers': [
        {'text': 'Rajat', 'score': 3},
        {'text': 'Papa', 'score': 11},
        {'text': 'Mummy', 'score': 5},
        {'text': 'Sheru', 'score': 9},
      ],
    },
    {
      'questionText': 'Who is Batameez?',
      'answers': [
        {'text': 'Rajat', 'score': 1},
        {'text': 'Papa', 'score': 1},
        {'text': 'Mummy', 'score': 1},
        {'text': 'Sheru', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
