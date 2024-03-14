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
        data!.add(new Data.fromJson(v));
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
  List<Characters>? characters;
  List<Dates>? dates;
  String? title;
  int? unit;
  int? year;

  Data(
      {this.sId,
        this.characters,
        this.dates,
        this.title,
        this.unit,
        this.year});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['characters'] != null) {
      characters = <Characters>[];
      json['characters'].forEach((v) {
        characters!.add(new Characters.fromJson(v));
      });
    }
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(new Dates.fromJson(v));
      });
    }
    title = json['Title'];
    unit = json['unit'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.characters != null) {
      data['characters'] = this.characters!.map((v) => v.toJson()).toList();
    }
    if (this.dates != null) {
      data['dates'] = this.dates!.map((v) => v.toJson()).toList();
    }
    data['Title'] = this.title;
    data['unit'] = this.unit;
    data['year'] = this.year;
    return data;
  }
}

class Characters {
  String? sId;
  String? nameOfCharacter;
  String? events;

  Characters({this.sId, this.nameOfCharacter, this.events});

  Characters.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nameOfCharacter = json['nameOfCharacter'];
    events = json['Events'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nameOfCharacter'] = this.nameOfCharacter;
    data['Events'] = this.events;
    return data;
  }
}

class Dates {
  String? sId;
  String? date;
  String? event;

  Dates({this.sId, this.date, this.event});

  Dates.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['date'] = this.date;
    data['event'] = this.event;
    return data;
  }
}
