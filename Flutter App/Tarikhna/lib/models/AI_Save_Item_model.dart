class SavedItem {
  String? message;
  Data? data;

  SavedItem({this.message, this.data});

  SavedItem.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    // if (this.data != null) {
    //   data['data'] = this.data.toJson();
    // }
    return data;
  }
}

class Data {
  List<Characters>? characters;
  List<Dates>? dates;
  String? title;
  String? userID;

  Data({this.characters, this.dates, this.title, this.userID});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['characters'] != null) {
      // characters = new List<Characters>();
      json['characters'].forEach((v) {
        characters?.add(new Characters.fromJson(v));
      });
    }
    if (json['dates'] != null) {
      // dates = new List<Dates>();
      json['dates'].forEach((v) {
        dates?.add(new Dates.fromJson(v));
      });
    }
    title = json['Title'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.characters != null) {
    //   data['characters'] = this.characters.map((v) => v.toJson()).toList();
    // }
    // if (this.dates != null) {
    //   data['dates'] = this.dates.map((v) => v.toJson()).toList();
    // }
    data['Title'] = this.title;
    data['userID'] = this.userID;
    return data;
  }
}

class Characters {
  String? nameOfCharacter;
  List<String>? events;

  Characters({this.nameOfCharacter, this.events});

  Characters.fromJson(Map<String, dynamic> json) {
    nameOfCharacter = json['nameOfCharacter'];
    events = json['Events'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameOfCharacter'] = this.nameOfCharacter;
    data['Events'] = this.events;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['event'] = this.event;
    return data;
  }
}
