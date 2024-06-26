// class lessonModel {
//   bool? status;
//   String? message;
//   lessonModelData? data;
//
//   lessonModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = lessonModelData.fromJson(json['data']);
//   }
// }
//
// class lessonModelData {
//   List<CharacterModel> characters = [];
//   List<DateModel> dates = [];
//   String? title;
//   String? unit;
//   String? year;
//
//   lessonModelData.fromJson(Map<String, dynamic> json) {
//     json['characters'].forEach((element) {
//       characters.add(CharacterModel.fromJson(element));
//     });
//
//     json['dates'].forEach((element) {
//       dates.add(DateModel.fromJson(element));
//     });
//
//     title = json['Title'];
//     unit = json['unit'];
//     year = json['year'];
//   }
// }
//
// class CharacterModel {
//
//   String? nameOfCharacter;
//   String? events;
//
//
//   CharacterModel.fromJson(Map<String, dynamic> json) {
//     nameOfCharacter = json['nameOfCharacter'];
//     events=json['Events'];
//   }
// }
//
// class DateModel {
//   String? date;
//   String? event;
//
//
//   DateModel.fromJson(Map<String, dynamic> json) {
//     date = json['date'];
//     event = json['event'];
//   }
// }


import 'package:tarikhna/models/Get_All_SavedItemmodel.dart';

class LessonModel {
  bool? status;
  List<Data>? data;
  String? message;

  LessonModel({this.status, this.data, this.message});

  LessonModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  List<CharacterModel>? Characters;
  List<DateModel>? Dates;
  String? title;
  String? AR_Text;
  int? unit;
  int? year;

  Data(
      {this.sId,
        this.Characters,
        this.Dates,
        this.title,
        this.AR_Text,
        this.unit,
        this.year});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['characters'] != null) {
      Characters = <CharacterModel>[];
      json['characters'].forEach((v) {
        Characters!.add(CharacterModel.fromJson(v)); // Updated this line
      });
    }
    if (json['dates'] != null) {
      Dates = <DateModel>[];
      json['dates'].forEach((v) {
        Dates!.add(DateModel.fromJson(v));// Updated this line
      });
    }
    title = json['Title'];
    AR_Text = json['AR_Text'];
    unit = json['unit'];
    year = json['year'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.Characters != null) {
      data['characters'] = this.Characters!.map((v) => v.toJson()).toList();
    }
    if (this.Dates != null) {
      // data['dates'] = this.dates!.map((v) => v.toJson()).toList();
    }
    data['Title'] = this.title;
    data['AR_Text'] = this.AR_Text;
    data['unit'] = this.unit;
    data['year'] = this.year;
    return data;
  }
}

class CharacterModel {
  String? sId;
  String? nameOfCharacter;
  List<String>? events;

  CharacterModel({this.sId, this.nameOfCharacter, this.events});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    nameOfCharacter = json['nameOfCharacter'];
    events = json['Events'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameOfCharacter'] = nameOfCharacter;
    data['Events'] = events;
    return data;
  }
}

class DateModel {
  String? sId;
  String? date;
  List<String>? event;

  DateModel({this.sId, this.date, this.event});

  DateModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    event = json['event'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['event'] = event;
    return data;
  }
}
