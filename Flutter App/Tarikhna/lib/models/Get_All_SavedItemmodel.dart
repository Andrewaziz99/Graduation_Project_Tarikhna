class Get_All_SavedItem_Model {
  String? message;
  List<GetAllDataSaved>? data;

  Get_All_SavedItem_Model({this.message, this.data});

  Get_All_SavedItem_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data?.add(GetAllDataSaved.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((x) => x.toJson()).toList();
    }
    return data;
  }
}

class GetAllDataSaved {
  String? sId;
  List<SavedCharacters>? characters;
  List<Dates>? dates;
  String? title;
  int? iV;

  GetAllDataSaved({this.sId, this.characters, this.dates, this.title, this.iV});

  GetAllDataSaved.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['characters'] != null) {
      characters = List<SavedCharacters>.from(json['characters'].map((x) => SavedCharacters.fromJson(x)));
    }
    if (json['dates'] != null) {
      dates = List<Dates>.from(json['dates'].map((x) => Dates.fromJson(x)));
    }
    title = json['Title'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.characters != null) {
      data['characters'] = this.characters!.map((x) => x.toJson()).toList();
    }
    if (this.dates != null) {
      data['dates'] = this.dates!.map((x) => x.toJson()).toList();
    }
    data['Title'] = this.title;
    data['__v'] = this.iV;
    return data;
  }
}

class SavedCharacters {
  String? nameOfCharacter;
  List<String>? events;
  String? sId;

  SavedCharacters({this.nameOfCharacter, this.events, this.sId});

  SavedCharacters.fromJson(Map<String, dynamic> json) {
    nameOfCharacter = json['nameOfCharacter'];
    events = json['Events'].cast<String>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nameOfCharacter'] = this.nameOfCharacter;
    data['Events'] = this.events;
    data['_id'] = this.sId;
    return data;
  }
}

class Dates {
  String? date;
  List<String>? event;
  String? sId;

  Dates({this.date, this.event, this.sId});

  Dates.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    event = json['event'].cast<String>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = this.date;
    data['event'] = this.event;
    data['_id'] = this.sId;
    return data;
  }
}
