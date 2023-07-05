import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

Quizbrain quizbrain=Quizbrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();


}

class _QuizPageState extends State<QuizPage> {
  List <Icon>Scorekeeper=[];
  void checkAnswer(bool pickedAnswer){

    // if (quizbrain.isFinished()) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Quiz Finished'),
    //         content: Text('You have reached the end of the quiz.'),
    //         actions: [
    //           TextButton(
    //             child: Text('OK'),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }


    bool correctAnswer= quizbrain.getAnswer();
    setState(() {
    if (pickedAnswer == correctAnswer){
        Scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
    }else{
      Scorekeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
      quizbrain.nextQuestion();
    });
  }



// List<String> questions=[
//   'You can lead a cow down stairs but not up stairs.',
//    'Approximately one quarter of human bones are in the feet.',
//   'A slug\'s blood is green.',
// ];
//   List<bool> answers=[false, true, true];

//now create a new question object from the question constructor of 'question.dart'
//   List<Question> questionBank=[
//     Question(q:'you can lead a cow down stairs but not up stairs' , a:false ),
//     Question(q: 'Approximately one quarter of human bones are in the feet.' , a: true),
//     Question(q:'A slug\'s blood is green.', a: true),
//   ];


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
             checkAnswer(true);

              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
               checkAnswer(false);

              },
            ),
          ),
        ),
        Row(
          children: Scorekeeper
        )
      ],
    );
  }

}
//TODO: Add a Row here as your score keeper

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/



