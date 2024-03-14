class AIModel {
  bool? historicalORNot;
  homeModelData? data;

  AIModel.fromJson(Map<String, dynamic> json) {
    historicalORNot = json['historicalORNot'];
    data = homeModelData.fromJson(json['data']);
  }
}

class homeModelData {
  List<CharacterModel> characters = [];
  List<DateModel> dates = [];
  String? title;

  homeModelData.fromJson(Map<String, dynamic> json) {
    json['characters'].forEach((element) {
      characters.add(CharacterModel.fromJson(element));
    });

    json['dates'].forEach((element) {
      dates.add(DateModel.fromJson(element));
    });

    title = json['Title'];
  }
}

class CharacterModel {

  String? nameOfCharacter;
  String? events;


  CharacterModel.fromJson(Map<String, dynamic> json) {
    nameOfCharacter = json['nameOfCharacter'];
    events=json['Events'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameOfCharacter'] = nameOfCharacter;
    data['Events'] = events;
    return data;
  }
}

class DateModel {
  String? date;
  String? event;


  DateModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['event'] = event;
    return data;
  }
}



