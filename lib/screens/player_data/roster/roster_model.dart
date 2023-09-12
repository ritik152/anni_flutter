class RostedData {
  int? success;
  int? code;
  String? message;
  List<Body>? body;

  RostedData({this.success, this.code, this.message, this.body});

  RostedData.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? playerID;
  String? name;
  String? position;
  String? date;
  String? teamID;
  String? teamImg;
  String? playerImg;
  String? depthOrder;
  var depthChartID;

  Body(
      {this.id,
        this.playerID,
        this.name,
        this.position,
        this.date,
        this.teamID,
        this.depthOrder,
        this.depthChartID});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerID = json['playerID'];
    name = json['name'];
    position = json['position'];
    date = json['date'];
    teamID = json['teamID'];
    depthOrder = json['depthOrder'];
    depthChartID = json['depthChartID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['playerID'] = this.playerID;
    data['name'] = this.name;
    data['position'] = this.position;
    data['date'] = this.date;
    data['teamID'] = this.teamID;
    data['depthOrder'] = this.depthOrder;
    data['depthChartID'] = this.depthChartID;
    return data;
  }
}