class AIModel {
  String? historicalORNot;
  DataM? data;

  AIModel({this.historicalORNot, this.data});

  AIModel.fromJson(Map<String, dynamic> json) {
    historicalORNot = json['historicalORNot'];
    data = json['data'] != null ? DataM.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['historicalORNot'] = this.historicalORNot;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class DataM {
  List<CharactersModel>? characters;
  List<Dates>? dates;
  String? title;

  DataM({this.characters, this.dates, this.title});

  DataM.fromJson(Map<String, dynamic> json) {
    if (json['characters'] != null) {
      characters = <CharactersModel>[];
      json['characters'].forEach((v) {
        characters?.add(CharactersModel.fromJson(v));
      });
    }
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates?.add(Dates.fromJson(v));
      });
    }
    title = json['Title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (characters != null) {
      data['characters'] = characters?.map((v) => v.toJson()).toList();
    }
    if (dates != null) {
      data['dates'] = dates?.map((v) => v.toJson()).toList();
    }
    data['Title'] = title;
    return data;
  }
}

class CharactersModel {
  String? nameOfCharacter;
  List<String>? events;

  CharactersModel({this.nameOfCharacter, this.events});

  CharactersModel.fromJson(Map<String, dynamic> json) {
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

class Dates {
  String? date;
  List<String>? event;

  Dates({this.date, this.event});

  Dates.fromJson(Map<String, dynamic> json) {
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
