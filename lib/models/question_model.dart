class QuestionModel {
  String? question;
  Map<String, bool>? answer;

  // Creating the constructor
  QuestionModel(this.question, this.answer);
}

class FinalResult {
  int score;

  FinalResult(this.score);
}
