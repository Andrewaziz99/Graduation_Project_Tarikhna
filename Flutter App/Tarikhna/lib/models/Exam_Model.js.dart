class ExamModel {
  bool status;
  String message;
  List<Data> data;

  ExamModel({required this.status, required this.message, required this.data});

  ExamModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] ?? false,
        message = json['message'] ?? '',
        data = (json['data'] as List<dynamic>?)
            ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
            .toList() ??
            [];

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class Data {
  String sId;
  String questions;
  List<String> choices;
  int correctAns;
  int level;
  String lessonID;

  Data({
    required this.sId,
    required this.questions,
    required this.choices,
    required this.correctAns,
    required this.level,
    required this.lessonID,
  });

  Data.fromJson(Map<String, dynamic> json)
      : sId = json['_id'] ?? '',
        questions = json['question'] ?? '',
        choices = (json['choices'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
            [],
        correctAns = json['correctAns'] ?? 0,
        level = json['level'] ?? 0,
        lessonID = json['lessonID'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'questions': questions,
      'choices': choices,
      'correctAns': correctAns,
      'level': level,
      'lessonID': lessonID,
    };
  }
}
