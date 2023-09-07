class BettingDataModel {
  int? scoreId;
  int? season;
  int? seasonType;
  int? week;
  String? day;
  String? dateTime;
  String? status;
  int? awayTeamId;
  int? homeTeamId;
  String? awayTeamName;
  String? homeTeamName;
  int? globalGameId;
  int? globalAwayTeamId;
  int? globalHomeTeamId;
  var homeTeamScore;
  var awayTeamScore;
  int? totalScore;
  var homeRotationNumber;
  var awayRotationNumber;
  String? homeTeamImg;
  String? awayTeamImg;
  String? name;
  List<PregameOdds>? pregameOdds;

  BettingDataModel({
    this.scoreId,
    this.season,
    this.seasonType,
    this.week,
    this.day,
    this.dateTime,
    this.status,
    this.awayTeamId,
    this.homeTeamId,
    this.awayTeamName,
    this.homeTeamName,
    this.globalGameId,
    this.globalAwayTeamId,
    this.globalHomeTeamId,
    this.homeTeamScore,
    this.awayTeamScore,
    this.totalScore,
    this.homeRotationNumber,
    this.awayRotationNumber,
    this.pregameOdds,
  });

  BettingDataModel.fromJson(Map<String, dynamic> json) {
    scoreId = json['ScoreId'];
    season = json['Season'];
    seasonType = json['SeasonType'];
    week = json['Week'];
    day = json['Day'];
    dateTime = json['DateTime'];
    status = json['Status'];
    awayTeamId = json['AwayTeamId'];
    homeTeamId = json['HomeTeamId'];
    awayTeamName = json['AwayTeamName'];
    homeTeamName = json['HomeTeamName'];
    globalGameId = json['GlobalGameId'];
    globalAwayTeamId = json['GlobalAwayTeamId'];
    globalHomeTeamId = json['GlobalHomeTeamId'];
    homeTeamScore = json['HomeTeamScore'];
    awayTeamScore = json['AwayTeamScore'];
    totalScore = json['TotalScore'];
    homeRotationNumber = json['HomeRotationNumber'];
    awayRotationNumber = json['AwayRotationNumber'];
    if (json['PregameOdds'] != null) {
      pregameOdds = <PregameOdds>[];
      json['PregameOdds'].forEach((v) {
        pregameOdds!.add(new PregameOdds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ScoreId'] = this.scoreId;
    data['Season'] = this.season;
    data['SeasonType'] = this.seasonType;
    data['Week'] = this.week;
    data['Day'] = this.day;
    data['DateTime'] = this.dateTime;
    data['Status'] = this.status;
    data['AwayTeamId'] = this.awayTeamId;
    data['HomeTeamId'] = this.homeTeamId;
    data['AwayTeamName'] = this.awayTeamName;
    data['HomeTeamName'] = this.homeTeamName;
    data['GlobalGameId'] = this.globalGameId;
    data['GlobalAwayTeamId'] = this.globalAwayTeamId;
    data['GlobalHomeTeamId'] = this.globalHomeTeamId;
    data['HomeTeamScore'] = this.homeTeamScore;
    data['AwayTeamScore'] = this.awayTeamScore;
    data['TotalScore'] = this.totalScore;
    data['HomeRotationNumber'] = this.homeRotationNumber;
    data['AwayRotationNumber'] = this.awayRotationNumber;
    if (this.pregameOdds != null) {
      data['PregameOdds'] = this.pregameOdds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PregameOdds {
  int? gameOddId;
  String? sportsbook;
  int? scoreId;
  String? created;
  String? updated;
  int? homeMoneyLine;
  int? awayMoneyLine;
  Null? drawMoneyLine;
  double? homePointSpread;
  double? awayPointSpread;
  int? homePointSpreadPayout;
  int? awayPointSpreadPayout;
  double? overUnder;
  int? overPayout;
  int? underPayout;
  int? sportsbookId;
  String? oddType;
  String? sportsbookUrl;

  PregameOdds(
      {this.gameOddId,
      this.sportsbook,
      this.scoreId,
      this.created,
      this.updated,
      this.homeMoneyLine,
      this.awayMoneyLine,
      this.drawMoneyLine,
      this.homePointSpread,
      this.awayPointSpread,
      this.homePointSpreadPayout,
      this.awayPointSpreadPayout,
      this.overUnder,
      this.overPayout,
      this.underPayout,
      this.sportsbookId,
      this.oddType,
      this.sportsbookUrl});

  PregameOdds.fromJson(Map<String, dynamic> json) {
    gameOddId = json['GameOddId'];
    sportsbook = json['Sportsbook'];
    scoreId = json['ScoreId'];
    created = json['Created'];
    updated = json['Updated'];
    homeMoneyLine = json['HomeMoneyLine'];
    awayMoneyLine = json['AwayMoneyLine'];
    drawMoneyLine = json['DrawMoneyLine'];
    homePointSpread = json['HomePointSpread'];
    awayPointSpread = json['AwayPointSpread'];
    homePointSpreadPayout = json['HomePointSpreadPayout'];
    awayPointSpreadPayout = json['AwayPointSpreadPayout'];
    overUnder = json['OverUnder'];
    overPayout = json['OverPayout'];
    underPayout = json['UnderPayout'];
    sportsbookId = json['SportsbookId'];
    oddType = json['OddType'];
    sportsbookUrl = json['SportsbookUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GameOddId'] = this.gameOddId;
    data['Sportsbook'] = this.sportsbook;
    data['ScoreId'] = this.scoreId;
    data['Created'] = this.created;
    data['Updated'] = this.updated;
    data['HomeMoneyLine'] = this.homeMoneyLine;
    data['AwayMoneyLine'] = this.awayMoneyLine;
    data['DrawMoneyLine'] = this.drawMoneyLine;
    data['HomePointSpread'] = this.homePointSpread;
    data['AwayPointSpread'] = this.awayPointSpread;
    data['HomePointSpreadPayout'] = this.homePointSpreadPayout;
    data['AwayPointSpreadPayout'] = this.awayPointSpreadPayout;
    data['OverUnder'] = this.overUnder;
    data['OverPayout'] = this.overPayout;
    data['UnderPayout'] = this.underPayout;
    data['SportsbookId'] = this.sportsbookId;
    data['OddType'] = this.oddType;
    data['SportsbookUrl'] = this.sportsbookUrl;
    return data;
  }
}
