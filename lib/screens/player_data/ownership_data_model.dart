class OwnershipDataModel {
  var playerID;
  var season;
  var seasonType;
  var week;
  String? name;
  String? position;
  String? team;
  var teamID;
  double? ownershipPercentage;
  var deltaOwnershipPercentage;
  double? startPercentage;
  var deltaStartPercentage;

  OwnershipDataModel(
      {this.playerID,
        this.season,
        this.seasonType,
        this.week,
        this.name,
        this.position,
        this.team,
        this.teamID,
        this.ownershipPercentage,
        this.deltaOwnershipPercentage,
        this.startPercentage,
        this.deltaStartPercentage});

  OwnershipDataModel.fromJson(Map<String, dynamic> json) {
    playerID = json['PlayerID'];
    season = json['Season'];
    seasonType = json['SeasonType'];
    week = json['Week'];
    name = json['Name'];
    position = json['Position'];
    team = json['Team'];
    teamID = json['TeamID'];
    ownershipPercentage = json['OwnershipPercentage'];
    deltaOwnershipPercentage = json['DeltaOwnershipPercentage'];
    startPercentage = json['StartPercentage'];
    deltaStartPercentage = json['DeltaStartPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlayerID'] = this.playerID;
    data['Season'] = this.season;
    data['SeasonType'] = this.seasonType;
    data['Week'] = this.week;
    data['Name'] = this.name;
    data['Position'] = this.position;
    data['Team'] = this.team;
    data['TeamID'] = this.teamID;
    data['OwnershipPercentage'] = this.ownershipPercentage;
    data['DeltaOwnershipPercentage'] = this.deltaOwnershipPercentage;
    data['StartPercentage'] = this.startPercentage;
    data['DeltaStartPercentage'] = this.deltaStartPercentage;
    return data;
  }
}