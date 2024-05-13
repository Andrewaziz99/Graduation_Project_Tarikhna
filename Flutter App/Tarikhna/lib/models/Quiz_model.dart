class QuizModel {
  bool? status;
  String? message;
  Data? data;

  QuizModel({this.status, this.message, this.data});

  QuizModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? levelOfQuiz;
  int? numberOfQuestions;
  List<Questions>? questions;

  Data({this.levelOfQuiz, this.numberOfQuestions, this.questions});

  Data.fromJson(Map<String, dynamic> json) {
    levelOfQuiz = json['levelOfQuiz'];
    numberOfQuestions = json['numberOfQuestions'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['levelOfQuiz'] = this.levelOfQuiz;
    data['numberOfQuestions'] = this.numberOfQuestions;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? sId;
  String? questions;
  List<String>? choices;
  int? correctAns;
  int? level;
  String? lessonID;

  Questions(
      {this.sId,
        this.questions,
        this.choices,
        this.correctAns,
        this.level,
        this.lessonID});

  Questions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    questions = json['questions'];
    choices = json['choices'].cast<String>();
    correctAns = json['correctAns'];
    level = json['level'];
    lessonID = json['lessonID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['questions'] = this.questions;
    data['choices'] = this.choices;
    data['correctAns'] = this.correctAns;
    data['level'] = this.level;
    data['lessonID'] = this.lessonID;
    return data;
  }
}
