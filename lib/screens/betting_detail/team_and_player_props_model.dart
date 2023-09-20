class TeamAndPlayerPropsModel {
  int? bettingMarketID;
  int? bettingEventID;
  int? bettingMarketTypeID;
  String? bettingMarketType;
  int? bettingBetTypeID;
  String? bettingBetType;
  int? bettingPeriodTypeID;
  String? bettingPeriodType;
  var name;
  var teamID;
  var teamKey;
  var playerID;
  var playerName;
  String? created;
  String? updated;
  bool? anyBetsAvailable;
  List<AvailableSportsbooks>? availableSportsbooks;
  List<BettingOutcomes>? bettingOutcomes;
  var consensusOutcomes;

  TeamAndPlayerPropsModel(
      {this.bettingMarketID,
        this.bettingEventID,
        this.bettingMarketTypeID,
        this.bettingMarketType,
        this.bettingBetTypeID,
        this.bettingBetType,
        this.bettingPeriodTypeID,
        this.bettingPeriodType,
        this.name,
        this.teamID,
        this.teamKey,
        this.playerID,
        this.playerName,
        this.created,
        this.updated,
        this.anyBetsAvailable,
        this.availableSportsbooks,
        this.bettingOutcomes,
        this.consensusOutcomes});

  TeamAndPlayerPropsModel.fromJson(Map<String, dynamic> json) {
    bettingMarketID = json['BettingMarketID'];
    bettingEventID = json['BettingEventID'];
    bettingMarketTypeID = json['BettingMarketTypeID'];
    bettingMarketType = json['BettingMarketType'];
    bettingBetTypeID = json['BettingBetTypeID'];
    bettingBetType = json['BettingBetType'];
    bettingPeriodTypeID = json['BettingPeriodTypeID'];
    bettingPeriodType = json['BettingPeriodType'];
    name = json['Name'];
    teamID = json['TeamID'];
    teamKey = json['TeamKey'];
    playerID = json['PlayerID'];
    playerName = json['PlayerName'];
    created = json['Created'];
    updated = json['Updated'];
    anyBetsAvailable = json['AnyBetsAvailable'];
    if (json['AvailableSportsbooks'] != null) {
      availableSportsbooks = <AvailableSportsbooks>[];
      json['AvailableSportsbooks'].forEach((v) {
        availableSportsbooks!.add(new AvailableSportsbooks.fromJson(v));
      });
    }
    if (json['BettingOutcomes'] != null) {
      bettingOutcomes = <BettingOutcomes>[];
      json['BettingOutcomes'].forEach((v) {
        bettingOutcomes!.add(new BettingOutcomes.fromJson(v));
      });
    }
    consensusOutcomes = json['ConsensusOutcomes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BettingMarketID'] = this.bettingMarketID;
    data['BettingEventID'] = this.bettingEventID;
    data['BettingMarketTypeID'] = this.bettingMarketTypeID;
    data['BettingMarketType'] = this.bettingMarketType;
    data['BettingBetTypeID'] = this.bettingBetTypeID;
    data['BettingBetType'] = this.bettingBetType;
    data['BettingPeriodTypeID'] = this.bettingPeriodTypeID;
    data['BettingPeriodType'] = this.bettingPeriodType;
    data['Name'] = this.name;
    data['TeamID'] = this.teamID;
    data['TeamKey'] = this.teamKey;
    data['PlayerID'] = this.playerID;
    data['PlayerName'] = this.playerName;
    data['Created'] = this.created;
    data['Updated'] = this.updated;
    data['AnyBetsAvailable'] = this.anyBetsAvailable;
    if (this.availableSportsbooks != null) {
      data['AvailableSportsbooks'] =
          this.availableSportsbooks!.map((v) => v.toJson()).toList();
    }
    if (this.bettingOutcomes != null) {
      data['BettingOutcomes'] =
          this.bettingOutcomes!.map((v) => v.toJson()).toList();
    }
    data['ConsensusOutcomes'] = this.consensusOutcomes;
    return data;
  }
}

class AvailableSportsbooks {
  int? sportsbookID;
  String? name;

  AvailableSportsbooks({this.sportsbookID, this.name});

  AvailableSportsbooks.fromJson(Map<String, dynamic> json) {
    sportsbookID = json['SportsbookID'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SportsbookID'] = this.sportsbookID;
    data['Name'] = this.name;
    return data;
  }
}

class BettingOutcomes {
  int? bettingOutcomeID;
  int? bettingMarketID;
  int? bettingOutcomeTypeID;
  String? bettingOutcomeType;
  int? payoutAmerican;
  double? payoutDecimal;
  int? value;
  String? participant;
  bool? isAvailable;
  bool? isAlternate;
  String? created;
  String? updated;
  var unlisted;
  int? teamID;
  var playerID;
  int? globalTeamID;
  String? sportsbookUrl;
  bool? isInPlay;
  String? sportsbookMarketID;
  String? sportsbookOutcomeID;
  AvailableSportsbooks? sportsBook;

  BettingOutcomes(
      {this.bettingOutcomeID,
        this.bettingMarketID,
        this.bettingOutcomeTypeID,
        this.bettingOutcomeType,
        this.payoutAmerican,
        this.payoutDecimal,
        this.value,
        this.participant,
        this.isAvailable,
        this.isAlternate,
        this.created,
        this.updated,
        this.unlisted,
        this.teamID,
        this.playerID,
        this.globalTeamID,
        this.sportsbookUrl,
        this.isInPlay,
        this.sportsbookMarketID,
        this.sportsbookOutcomeID,
        this.sportsBook});

  BettingOutcomes.fromJson(Map<String, dynamic> json) {
    bettingOutcomeID = json['BettingOutcomeID'];
    bettingMarketID = json['BettingMarketID'];
    bettingOutcomeTypeID = json['BettingOutcomeTypeID'];
    bettingOutcomeType = json['BettingOutcomeType'];
    payoutAmerican = json['PayoutAmerican'];
    payoutDecimal = json['PayoutDecimal'];
    value = json['Value'];
    participant = json['Participant'];
    isAvailable = json['IsAvailable'];
    isAlternate = json['IsAlternate'];
    created = json['Created'];
    updated = json['Updated'];
    unlisted = json['Unlisted'];
    teamID = json['TeamID'];
    playerID = json['PlayerID'];
    globalTeamID = json['GlobalTeamID'];
    sportsbookUrl = json['SportsbookUrl'];
    isInPlay = json['IsInPlay'];
    sportsbookMarketID = json['SportsbookMarketID'];
    sportsbookOutcomeID = json['SportsbookOutcomeID'];
    sportsBook = json['SportsBook'] != null
        ? new AvailableSportsbooks.fromJson(json['SportsBook'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BettingOutcomeID'] = this.bettingOutcomeID;
    data['BettingMarketID'] = this.bettingMarketID;
    data['BettingOutcomeTypeID'] = this.bettingOutcomeTypeID;
    data['BettingOutcomeType'] = this.bettingOutcomeType;
    data['PayoutAmerican'] = this.payoutAmerican;
    data['PayoutDecimal'] = this.payoutDecimal;
    data['Value'] = this.value;
    data['Participant'] = this.participant;
    data['IsAvailable'] = this.isAvailable;
    data['IsAlternate'] = this.isAlternate;
    data['Created'] = this.created;
    data['Updated'] = this.updated;
    data['Unlisted'] = this.unlisted;
    data['TeamID'] = this.teamID;
    data['PlayerID'] = this.playerID;
    data['GlobalTeamID'] = this.globalTeamID;
    data['SportsbookUrl'] = this.sportsbookUrl;
    data['IsInPlay'] = this.isInPlay;
    data['SportsbookMarketID'] = this.sportsbookMarketID;
    data['SportsbookOutcomeID'] = this.sportsbookOutcomeID;
    if (this.sportsBook != null) {
      data['SportsBook'] = this.sportsBook!.toJson();
    }
    return data;
  }
}