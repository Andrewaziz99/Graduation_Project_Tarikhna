class SavedItem {
  String? message;
  Data? data;

  SavedItem.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data =  Data.fromJson(json['data']) ;
  }

}

class Data {
  List<Characters> characters=[];
  List<Dates> dates=[];
  String? title;



  Data.fromJson(Map<String, dynamic> json) {

      json['characters'].forEach((v) {
        characters.add(new Characters.fromJson(v));
      });


      json['dates'].forEach((v) {
        dates.add(new Dates.fromJson(v));
      });

    title = json['Title'];
  }


}

class Characters {
  String? nameOfCharacter;
  String? events;



  Characters.fromJson(Map<String, dynamic> json) {
    nameOfCharacter = json['nameOfCharacter'];
    events = json['Events'];
  }


}

class Dates {
  String? date;
  String? event;



  Dates.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    event = json['event'];
  }

}
