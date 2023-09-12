class AlertsModel {
  int? success;
  int? code;
  String? message;
  List<AlartData>? body;

  AlertsModel({this.success, this.code, this.message, this.body});

  AlertsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['body'] != null) {
      body = <AlartData>[];
      json['body'].forEach((v) {
        body!.add(new AlartData.fromJson(v));
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

class AlartData {
  int? id;
  int? type;
  JsonData? jsonData;
  String? updatedDate;
  int? weekNo;
  String? createdAt;
  String? updatedAt;

  AlartData(
      {this.id,
        this.type,
        this.jsonData,
        this.updatedDate,
        this.weekNo,
        this.createdAt,
        this.updatedAt});

  AlartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    jsonData = json['json_data'] != null
        ? new JsonData.fromJson(json['json_data'])
        : null;
    updatedDate = json['updated_date'];
    weekNo = json['week_no'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.jsonData != null) {
      data['json_data'] = this.jsonData!.toJson();
    }
    data['updated_date'] = this.updatedDate;
    data['week_no'] = this.weekNo;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class JsonData {
  String? name;
  String? positionCategory;
  String? position;
  int? depthOrder;
  String? updated;
  int? isPromoted;
  int? isDemoted;
  int? teamChange;
  int? oldTeam;
  int? oldDepthOrder;
  int? newsID;
  String? source;
  String? timeAgo;
  String? title;
  String? content;
  String? url;
  String? termsOfUse;
  String? author;
  String? categories;
  int? playerID;
  int? teamID;
  String? team;
  Null? playerID2;
  Null? teamID2;
  Null? team2;
  String? originalSource;
  String? originalSourceUrl;
  int? injuryID;
  int? seasonType;
  int? season;
  int? week;
  int? number;
  String? opponent;
  String? bodyPart;
  String? status;
  String? practice;
  String? practiceDescription;
  bool? declaredInactive;
  int? opponentID;

  JsonData(
      {this.name,
        this.positionCategory,
        this.position,
        this.depthOrder,
        this.updated,
        this.isPromoted,
        this.isDemoted,
        this.teamChange,
        this.oldTeam,
        this.oldDepthOrder,
        this.newsID,
        this.source,
        this.timeAgo,
        this.title,
        this.content,
        this.url,
        this.termsOfUse,
        this.author,
        this.categories,
        this.playerID,
        this.teamID,
        this.team,
        this.playerID2,
        this.teamID2,
        this.team2,
        this.originalSource,
        this.originalSourceUrl,
        this.injuryID,
        this.seasonType,
        this.season,
        this.week,
        this.number,
        this.opponent,
        this.bodyPart,
        this.status,
        this.practice,
        this.practiceDescription,
        this.declaredInactive,
        this.opponentID});

  JsonData.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    positionCategory = json['PositionCategory'];
    position = json['Position'];
    depthOrder = json['DepthOrder'];
    updated = json['Updated'];
    isPromoted = json['isPromoted'];
    isDemoted = json['isDemoted'];
    teamChange = json['teamChange'];
    oldTeam = json['oldTeam'];
    oldDepthOrder = json['oldDepthOrder'];
    newsID = json['NewsID'];
    source = json['Source'];
    timeAgo = json['TimeAgo'];
    title = json['Title'];
    content = json['Content'];
    url = json['Url'];
    termsOfUse = json['TermsOfUse'];
    author = json['Author'];
    categories = json['Categories'];
    playerID = json['PlayerID'];
    teamID = json['TeamID'];
    team = json['Team'];
    playerID2 = json['PlayerID2'];
    teamID2 = json['TeamID2'];
    team2 = json['Team2'];
    originalSource = json['OriginalSource'];
    originalSourceUrl = json['OriginalSourceUrl'];
    injuryID = json['InjuryID'];
    seasonType = json['SeasonType'];
    season = json['Season'];
    week = json['Week'];
    number = json['Number'];
    opponent = json['Opponent'];
    bodyPart = json['BodyPart'];
    status = json['Status'];
    practice = json['Practice'];
    practiceDescription = json['PracticeDescription'];
    declaredInactive = json['DeclaredInactive'];
    opponentID = json['OpponentID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['PositionCategory'] = this.positionCategory;
    data['Position'] = this.position;
    data['DepthOrder'] = this.depthOrder;
    data['Updated'] = this.updated;
    data['isPromoted'] = this.isPromoted;
    data['isDemoted'] = this.isDemoted;
    data['teamChange'] = this.teamChange;
    data['oldTeam'] = this.oldTeam;
    data['oldDepthOrder'] = this.oldDepthOrder;
    data['NewsID'] = this.newsID;
    data['Source'] = this.source;
    data['TimeAgo'] = this.timeAgo;
    data['Title'] = this.title;
    data['Content'] = this.content;
    data['Url'] = this.url;
    data['TermsOfUse'] = this.termsOfUse;
    data['Author'] = this.author;
    data['Categories'] = this.categories;
    data['PlayerID'] = this.playerID;
    data['TeamID'] = this.teamID;
    data['Team'] = this.team;
    data['PlayerID2'] = this.playerID2;
    data['TeamID2'] = this.teamID2;
    data['Team2'] = this.team2;
    data['OriginalSource'] = this.originalSource;
    data['OriginalSourceUrl'] = this.originalSourceUrl;
    data['InjuryID'] = this.injuryID;
    data['SeasonType'] = this.seasonType;
    data['Season'] = this.season;
    data['Week'] = this.week;
    data['Number'] = this.number;
    data['Opponent'] = this.opponent;
    data['BodyPart'] = this.bodyPart;
    data['Status'] = this.status;
    data['Practice'] = this.practice;
    data['PracticeDescription'] = this.practiceDescription;
    data['DeclaredInactive'] = this.declaredInactive;
    data['OpponentID'] = this.opponentID;
    return data;
  }
}