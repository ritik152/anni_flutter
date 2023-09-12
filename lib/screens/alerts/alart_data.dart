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
        this.oldDepthOrder});

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
    return data;
  }
}