class Paper {
  num userId; //user_id
  String title; //paper_name
  String description; //paper_comment
  num startTime; //start_time
  num endTime; //end_time
  int type; //paper_type
  num timeLimit; //time_limit
  int needCheck; //need_check
  PaperQuestion questions; //questions
  int random; //random
  int times; //times
  int star; //star
  Paper({
    this.userId,
    this.title,
    this.type,
    this.timeLimit,
    this.needCheck,
    this.questions,
    this.random,
    this.times,
    this.star,
    this.description,
    this.startTime,
    this.endTime,
  });
}

class PaperQuestion {
  List<Single> single; //single
  List<Multi> multi; //multiple
  List<Blank> blank; //blank
  PaperQuestion({
    this.single,
    this.multi,
    this.blank,
  });
}

//TODO:sign和signed部分还没有做
class Single {
  String title; //question
  bool necessary; //necessary
  int score; //score
  List<String> options; //options
  int correctAnswer; //right_answer
  Single({
    this.title,
    this.necessary,
    this.score,
    this.options,
    this.correctAnswer,
  });
}

class Multi {
  String title; //question
  bool necessary; //necessary
  int score; //score
  List<String> options; //options
  List<int> correctAnswer; //right_answer
  Multi({
    this.title,
    this.necessary,
    this.score,
    this.options,
    this.correctAnswer,
  });
}

class Blank {
  String title; //question
  int necessary; //necessary
  int score; //score
  String correctAnswer; //right_answer
  Blank({
    this.title,
    this.necessary,
    this.score,
    this.correctAnswer,
  });
}
