// ignore_for_file: library_private_types_in_public_api
import 'quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// import 'question.dart';
QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
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
  List<Icon> scoreKeeper = [
    // const Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ),
    // const Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
  ];
  void checkAnswer(bool userPickAnswer) {
    bool correctAnswer =
        // quizBrain.questionBank[questionNumber].questionAnswer;
        quizBrain.getQuestionAnswer();

    setState(
      () {
        if (quizBrain.isFinished() == true) {
          Alert(
            context: context,
            title: 'it\'s finished',
            desc: "you have reached the out of the quiz!",
          ).show();
          quizBrain.resetTheQuiz();
          scoreKeeper = [];
        } else {
          if (userPickAnswer == correctAnswer) {
            scoreKeeper.add(
              const Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          } else {
            scoreKeeper.add(
              const Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
        }

        // questionNumber++;
        quizBrain.nextQuestion();
      },
    );
  }

  // List<String> questions = [
  //   'you can lead a cow down stairs but not up stairs.',
  //   'Approximately one quaeter of human bones are in the feet',
  //   'A slug\'s blood is green',
  // ];
  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  // ];
  // Question q1 = Question(
  //     q: 'you can lead a cow down stairs but not up stairs.', a: false);
  // List<Question> questionBank = [
  //   Question(q: 'you can lead a cow down stairs but not up stairs.', a: false),
  //   Question(
  //       q: 'Approximately one quaeter of human bones are in the feet', a: true),
  //   Question(q: 'A slug\'s blood is green', a: true),
  // ];
  // int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(
                10,
              ),
              child: Center(
                child: Text(
                  // quizBrain.questionBank[questionNumber].questionText,
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              color: Colors.green,
              child: TextButton(
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                  // bool correctAnswer =
                  //     // quizBrain.questionBank[questionNumber].questionAnswer;
                  //     quizBrain.getQuestionAnswer();
                  // if (correctAnswer == true) {}
                  // setState(
                  //   () {
                  //     quizBrain.nextQuestion();
                  //   },
                  // );
                },
              ),
            ),
          ),
        ), //qustions
        //answer for true
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              color: Colors.red,
              child: TextButton(
                child: const Text(
                  'False',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  checkAnswer(false);
                  // bool correctAnswer =
                  //     // quizBrain.questionBank[questionNumber].questionAnswer;
                  //     quizBrain.getQuestionAnswer();
                  // if (correctAnswer == false) {}
                  // setState(
                  //   () {
                  //     // questionNumber++;
                  //     quizBrain.nextQuestion();
                  //   },
                  // );
                },
              ),
            ),
          ),
        ), //qusti //answer for false
        //add row for the result section to keep it
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
