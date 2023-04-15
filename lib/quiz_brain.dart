import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  // ignore: prefer_final_fields
  List<Question> _questionBank = [
    //making the question bank private is one method of encapsulation
    //in which making it to work on its own and do its work without interference of other
    Question(
      'Some cats are actually allergic to humans',
      true,
    ),
    Question(
      'You can lead a cow down stairs but not up stairs.',
      false,
    ),
    Question(
      'Approximately one quarter of human bones are in the feet.',
      true,
    ),
    Question(
      'A slug\'s blood is green.',
      true,
    ),
    Question(
      'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
      true,
    ),
    Question(
      'It is illegal to pee in the Ocean in Portugal.',
      true,
    ),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question(
      'Google was originally called "Backrub".',
      true,
    ),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionBank.length) {
      _questionNumber++;
    } else {}
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionBank.length - 1 <= _questionNumber) {
      return true;
    } else {
      return false;
    }
  }

  void resetTheQuiz() {
    _questionNumber = 0;
  }
}
