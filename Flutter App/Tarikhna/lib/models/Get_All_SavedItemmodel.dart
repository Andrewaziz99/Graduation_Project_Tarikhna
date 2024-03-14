class Get_All_SavedItem_Model {
  String? message;
  List<Data> data=[];

  // Get_All_SavedItem_Model({this.message, this.data});

  Get_All_SavedItem_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      // data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  List<CharactersModel> characters=[];
  List<DatesModel> dates=[];
  String? title;
  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['Title'];


    if (json['characters'] != null) {
      json['characters'].forEach((v) {
        characters.add(CharactersModel.fromJson(v));
      });
    }
    if (json['dates'] != null) {
      json['dates'].forEach((v) {
        dates.add(DatesModel.fromJson(v));
      });
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.characters != null) {
      data['characters'] = this.characters.map((v) => v.toJson()).toList();
    }
    if (this.dates != null) {
      data['dates'] = this.dates.map((v) => v.toJson()).toList();
    }
    data['Title'] = this.title;

    return data;
  }
}

class CharactersModel {
  String? nameOfCharacter;
  String? events;
  String? sId;



  CharactersModel.fromJson(Map<String, dynamic> json) {
    nameOfCharacter = json['nameOfCharacter'];
    events = json['Events'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameOfCharacter'] = this.nameOfCharacter;
    data['Events'] = this.events;
    data['_id'] = this.sId;
    return data;
  }
}

class DatesModel {
  String? date;
  String? event;
  String? sId;
DatesModel({this.sId,this.date,this.event});


  DatesModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    event = json['event'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['event'] = this.event;
    data['_id'] = this.sId;
    return data;
  }
}
