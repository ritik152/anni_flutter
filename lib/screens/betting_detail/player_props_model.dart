class PlayerPropsByWeekModel {
  int? playerID;
  int? scoreID;
  String? name;
  String? opponent;
  String? team;
  String? teamImg;
  String? playerImg;
  String? dateTime;
  String? description;
  double? overUnder;
  int? overPayout;
  int? underPayout;
  String? betResult;
  double? statResult;

  PlayerPropsByWeekModel(
      {this.playerID,
        this.scoreID,
        this.name,
        this.opponent,
        this.team,
        this.dateTime,
        this.description,
        this.overUnder,
        this.overPayout,
        this.underPayout,
        this.betResult,
        this.statResult});

  PlayerPropsByWeekModel.fromJson(Map<String, dynamic> json) {
    playerID = json['PlayerID'];
    scoreID = json['ScoreID'];
    name = json['Name'];
    opponent = json['Opponent'];
    team = json['Team'];
    dateTime = json['DateTime'];
    description = json['Description'];
    overUnder = json['OverUnder'];
    overPayout = json['OverPayout'];
    underPayout = json['UnderPayout'];
    betResult = json['BetResult'];
    statResult = json['StatResult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlayerID'] = this.playerID;
    data['ScoreID'] = this.scoreID;
    data['Name'] = this.name;
    data['Opponent'] = this.opponent;
    data['Team'] = this.team;
    data['DateTime'] = this.dateTime;
    data['Description'] = this.description;
    data['OverUnder'] = this.overUnder;
    data['OverPayout'] = this.overPayout;
    data['UnderPayout'] = this.underPayout;
    data['BetResult'] = this.betResult;
    data['StatResult'] = this.statResult;
    return data;
  }
}