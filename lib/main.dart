import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Icon>scoreKeeper = [
    /*
    const Icon(
    Icons.check,
    color: Colors.green,
  ),
    const Icon(
      Icons.close,
      color: Colors.red,
    ),
    */
    ];
/*
  List <String>questions = [
    'You can lead a cow down stairs but not stairs',
    'Approximately one quarter of human bones are in the feet',
    'A slug\'s blood is green'
  ];

  List<bool>answers = [
    false,
    true,
    true
  ];

  Question q1 = Question('You can lead a cow down stairs but not stairs', false);
*/


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //quizBrain.questionBank[questionNumber].questionText,
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white), // Text color
                backgroundColor: WidgetStateProperty.all<Color>(Colors.green), // Background color
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                //bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
                bool correctAnswer = quizBrain.getAnswer();
                if(correctAnswer == true){

                }else{

                }

                setState(() {
                  quizBrain.nextQuestion();
                });

              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
              ),
              child:const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                //bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
                bool correctAnswer = quizBrain.getAnswer();
                if(correctAnswer == false){

                }else{

                }

                setState(() {
                  quizBrain.nextQuestion();
                });

              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}