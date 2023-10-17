class SeasonList {
  int? success;
  int? code;
  String? message;
  List<Body>? body;

  SeasonList({this.success, this.code, this.message, this.body});

  SeasonList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Body {
  int? playerID;
  int? season;

  Body({this.playerID, this.season});

  Body.fromJson(Map<String, dynamic> json) {
    playerID = json['PlayerID'];
    season = json['Season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlayerID'] = this.playerID;
    data['Season'] = this.season;
    return data;
  }
}