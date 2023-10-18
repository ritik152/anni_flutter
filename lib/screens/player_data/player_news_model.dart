class PlayerNewsModel {
  int? success;
  int? code;
  String? message;
  List<Body>? body;

  PlayerNewsModel({this.success, this.code, this.message, this.body});

  PlayerNewsModel.fromJson(Map<String, dynamic> json) {
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
  int? playerID;
  String? rotoworldPlayerNewsLine;
  int? teamID;
  String? position;
  JsonData? jsonData;
  String? createdAt;
  String? updatedAt;

  Body(
      {this.id,
        this.playerID,
        this.rotoworldPlayerNewsLine,
        this.teamID,
        this.position,
        this.jsonData,
        this.createdAt,
        this.updatedAt});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerID = json['PlayerID'];
    rotoworldPlayerNewsLine = json['RotoworldPlayerNewsLine'];
    teamID = json['TeamID'];
    position = json['Position'];
    jsonData = json['jsonData'] != null
        ? new JsonData.fromJson(json['jsonData'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['PlayerID'] = this.playerID;
    data['RotoworldPlayerNewsLine'] = this.rotoworldPlayerNewsLine;
    data['TeamID'] = this.teamID;
    data['Position'] = this.position;
    if (this.jsonData != null) {
      data['jsonData'] = this.jsonData!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class JsonData {
  String? rotoworldPlayerNewsLine;
  String? headline;
  String? comment;
  String? impact;
  String? rotoworldCreated;
  String? rotoworldLastUpdated;
  bool? isTopNews;
  bool? isTransaction;
  bool? isRumor;
  var moreLink;
  var moreName;
  PlayerInfo? playerInfo;
  RotoworldPlayerMeta? rotoworldPlayerMeta;

  JsonData(
      {this.rotoworldPlayerNewsLine,
        this.headline,
        this.comment,
        this.impact,
        this.rotoworldCreated,
        this.rotoworldLastUpdated,
        this.isTopNews,
        this.isTransaction,
        this.isRumor,
        this.moreLink,
        this.moreName,
        this.playerInfo,
        this.rotoworldPlayerMeta});

  JsonData.fromJson(Map<String, dynamic> json) {
    rotoworldPlayerNewsLine = json['RotoworldPlayerNewsLine'];
    headline = json['Headline'];
    comment = json['Comment'];
    impact = json['Impact'];
    rotoworldCreated = json['RotoworldCreated'];
    rotoworldLastUpdated = json['RotoworldLastUpdated'];
    isTopNews = json['IsTopNews'];
    isTransaction = json['IsTransaction'];
    isRumor = json['IsRumor'];
    moreLink = json['MoreLink'];
    moreName = json['MoreName'];
    playerInfo = json['PlayerInfo'] != null
        ? new PlayerInfo.fromJson(json['PlayerInfo'])
        : null;
    rotoworldPlayerMeta = json['RotoworldPlayerMeta'] != null
        ? new RotoworldPlayerMeta.fromJson(json['RotoworldPlayerMeta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RotoworldPlayerNewsLine'] = this.rotoworldPlayerNewsLine;
    data['Headline'] = this.headline;
    data['Comment'] = this.comment;
    data['Impact'] = this.impact;
    data['RotoworldCreated'] = this.rotoworldCreated;
    data['RotoworldLastUpdated'] = this.rotoworldLastUpdated;
    data['IsTopNews'] = this.isTopNews;
    data['IsTransaction'] = this.isTransaction;
    data['IsRumor'] = this.isRumor;
    data['MoreLink'] = this.moreLink;
    data['MoreName'] = this.moreName;
    if (this.playerInfo != null) {
      data['PlayerInfo'] = this.playerInfo!.toJson();
    }
    if (this.rotoworldPlayerMeta != null) {
      data['RotoworldPlayerMeta'] = this.rotoworldPlayerMeta!.toJson();
    }
    return data;
  }
}

class PlayerInfo {
  int? playerID;
  String? name;
  int? teamID;
  String? team;
  String? position;

  PlayerInfo({this.playerID, this.name, this.teamID, this.team, this.position});

  PlayerInfo.fromJson(Map<String, dynamic> json) {
    playerID = json['PlayerID'];
    name = json['Name'];
    teamID = json['TeamID'];
    team = json['Team'];
    position = json['Position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlayerID'] = this.playerID;
    data['Name'] = this.name;
    data['TeamID'] = this.teamID;
    data['Team'] = this.team;
    data['Position'] = this.position;
    return data;
  }
}

class RotoworldPlayerMeta {
  String? playerFirstName;
  String? playerLastName;
  String? rotoworldPlayerId;
  int? statsPlayerID;
  var sportRadarPlayerID;
  String? playerStatus;
  String? teamKey;
  String? teamCity;
  String? teamName;
  String? teamColor;

  RotoworldPlayerMeta(
      {this.playerFirstName,
        this.playerLastName,
        this.rotoworldPlayerId,
        this.statsPlayerID,
        this.sportRadarPlayerID,
        this.playerStatus,
        this.teamKey,
        this.teamCity,
        this.teamName,
        this.teamColor});

  RotoworldPlayerMeta.fromJson(Map<String, dynamic> json) {
    playerFirstName = json['PlayerFirstName'];
    playerLastName = json['PlayerLastName'];
    rotoworldPlayerId = json['RotoworldPlayerId'];
    statsPlayerID = json['StatsPlayerID'];
    sportRadarPlayerID = json['SportRadarPlayerID'];
    playerStatus = json['PlayerStatus'];
    teamKey = json['TeamKey'];
    teamCity = json['TeamCity'];
    teamName = json['TeamName'];
    teamColor = json['TeamColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlayerFirstName'] = this.playerFirstName;
    data['PlayerLastName'] = this.playerLastName;
    data['RotoworldPlayerId'] = this.rotoworldPlayerId;
    data['StatsPlayerID'] = this.statsPlayerID;
    data['SportRadarPlayerID'] = this.sportRadarPlayerID;
    data['PlayerStatus'] = this.playerStatus;
    data['TeamKey'] = this.teamKey;
    data['TeamCity'] = this.teamCity;
    data['TeamName'] = this.teamName;
    data['TeamColor'] = this.teamColor;
    return data;
  }
}