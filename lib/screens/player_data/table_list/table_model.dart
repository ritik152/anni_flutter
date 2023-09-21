class TableModel {
  var success;
  var code;
  String? message;
  List<Body>? body;

  TableModel({this.success, this.code, this.message, this.body});

  TableModel.fromJson(Map<String, dynamic> json) {
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
  var id;
  var playerID;
  var season;
  var week;
  String? gameKey;
  JsonData? jsonData;

  Body(
      {this.id,
        this.playerID,
        this.season,
        this.week,
        this.gameKey,
        this.jsonData});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerID = json['PlayerID'];
    season = json['Season'];
    week = json['Week'];
    gameKey = json['GameKey'];
    jsonData = json['jsonData'] != null
        ? new JsonData.fromJson(json['jsonData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['PlayerID'] = this.playerID;
    data['Season'] = this.season;
    data['Week'] = this.week;
    data['GameKey'] = this.gameKey;
    if (this.jsonData != null) {
      data['jsonData'] = this.jsonData!.toJson();
    }
    return data;
  }
}

class JsonData {
  String? day;
  String? name;
  String? team;
  var week;
  var punts;
  var sacks;
  var number;
  var played;
  var season;
  var teamID;
  var fumbles;
  String? gameKey;
  var scoreID;
  var stadium;
  var started;
  var tackles;
  String? dateTime;
  String? gameDate;
  var humidity;
  String? opponent;
  var playerID;
  String? position;
  var puntLong;
  var safeties;
  var activated;
  var puntYards;
  var sackYards;
  String? shortName;
  var windSpeed;
  String? homeOrAway;
  bool? isGameOver;
  var opponentID;
  var receptions;
  var seasonType;
  var touchdowns;
  var fumblesLost;
  var injuryNotes;
  var kickReturns;
  var passingLong;
  var puntAverage;
  var puntReturns;
  var rushingLong;
  var soloTackles;
  var temperature;
  var yahooSalary;
  var blockedKicks;
  var globalGameID;
  var globalTeamID;
  var injuryStatus;
  var opponentRank;
  var passingSacks;
  var passingYards;
  var playerGameID;
  var puntInside20;
  var puntNetYards;
  var rushingYards;
  var victivSalary;
  var fanDuelSalary;
  var fantasyPoints;
  var fumblesForced;
  var interceptions;
  var passingRating;
  var receivingLong;
  var yahooPosition;
  var fieldGoalsMade;
  var injuryBodyPart;
  var injuryPractice;
  var kickReturnLong;
  var passesDefended;
  String? playingSurface;
  var puntNetAverage;
  var puntReturnLong;
  var puntTouchbacks;
  var receivingYards;
  var tacklesForLoss;
  var assistedTackles;
  var extraPointsMade;
  var fanDuelPosition;
  String? fantasyPosition;
  var injuryStartDate;
  var kickReturnYards;
  var miscSoloTackles;
  var passingAttempts;
  var puntReturnYards;
  var puntsHadBlocked;
  var quarterbackHits;
  var rushingAttempts;
  var safetiesAllowed;
  bool? declaredInactive;
  var draftKingsSalary;
  var fantasyPointsPPR;
  var fumblesRecovered;
  var globalOpponentID;
  var passingSackYards;
  String? positionCategory;
  var receivingTargets;
  var fantasyDataSalary;
  var fumbleReturnYards;
  var miscFumblesForced;
  var passingTouchdowns;
  var rushingTouchdowns;
  var defensiveTeamSnaps;
  var draftKingsPosition;
  var fantasyDraftSalary;
  var fantasyPointsYahoo;
  var fumblesOutOfBounds;
  var offensiveTeamSnaps;
  var passingCompletions;
  var defensiveTouchdowns;
  var fieldGoalPercentage;
  var fieldGoalsAttempted;
  var fieldGoalsMade0to19;
  var miscAssistedTackles;
  var offensiveTouchdowns;
  var receivingTouchdowns;
  var receptionPercentage;
  var snapCountsConfirmed;
  var defensiveSnapsPlayed;
  var extraPointsAttempted;
  var fantasyDraftPosition;
  var fantasyPointsFanDuel;
  var fieldGoalReturnYards;
  var fieldGoalsHadBlocked;
  var fieldGoalsMade20to29;
  var fieldGoalsMade30to39;
  var fieldGoalsMade40to49;
  var fieldGoalsMade50Plus;
  var fumblesOwnRecoveries;
  var kickReturnTouchdowns;
  var miscFumblesRecovered;
  var offensiveSnapsPlayed;
  var opponentPositionRank;
  var passingInterceptions;
  var puntReturnTouchdowns;
  var extraPointsHadBlocked;
  var fieldGoalsLongestMade;
  var kickReturnFairCatches;
  var puntReturnFairCatches;
  var specialTeamsTeamSnaps;
  var blockedKickReturnYards;
  var fumbleReturnTouchdowns;
  var passingYardsPerAttempt;
  var rushingYardsPerAttempt;
  var specialTeamsTouchdowns;
  var twoPointConversionRuns;
  var fantasyPointsDraftKings;
  var interceptionReturnYards;
  var receivingYardsPerTarget;
  var specialTeamsSnapsPlayed;
  var specialTeamsSoloTackles;
  var twoPointConversionPasses;
  var fantasyPointsFantasyDraft;
  var fieldGoalReturnTouchdowns;
  var injuryPracticeDescription;
  var kickReturnYardsPerAttempt;
  var passingYardsPerCompletion;
  var puntReturnYardsPerAttempt;
  var specialTeamsFumblesForced;
  var twoPointConversionReturns;
  var receivingYardsPerReception;
  var blockedKickReturnTouchdowns;
  var passingCompletionPercentage;
  var specialTeamsAssistedTackles;
  var interceptionReturnTouchdowns;
  var specialTeamsFumblesRecovered;
  var twoPointConversionReceptions;
  var offensiveFumbleRecoveryTouchdowns;

  JsonData(
      {this.day,
        this.name,
        this.team,
        this.week,
        this.punts,
        this.sacks,
        this.number,
        this.played,
        this.season,
        this.teamID,
        this.fumbles,
        this.gameKey,
        this.scoreID,
        this.stadium,
        this.started,
        this.tackles,
        this.dateTime,
        this.gameDate,
        this.humidity,
        this.opponent,
        this.playerID,
        this.position,
        this.puntLong,
        this.safeties,
        this.activated,
        this.puntYards,
        this.sackYards,
        this.shortName,
        this.windSpeed,
        this.homeOrAway,
        this.isGameOver,
        this.opponentID,
        this.receptions,
        this.seasonType,
        this.touchdowns,
        this.fumblesLost,
        this.injuryNotes,
        this.kickReturns,
        this.passingLong,
        this.puntAverage,
        this.puntReturns,
        this.rushingLong,
        this.soloTackles,
        this.temperature,
        this.yahooSalary,
        this.blockedKicks,
        this.globalGameID,
        this.globalTeamID,
        this.injuryStatus,
        this.opponentRank,
        this.passingSacks,
        this.passingYards,
        this.playerGameID,
        this.puntInside20,
        this.puntNetYards,
        this.rushingYards,
        this.victivSalary,
        this.fanDuelSalary,
        this.fantasyPoints,
        this.fumblesForced,
        this.interceptions,
        this.passingRating,
        this.receivingLong,
        this.yahooPosition,
        this.fieldGoalsMade,
        this.injuryBodyPart,
        this.injuryPractice,
        this.kickReturnLong,
        this.passesDefended,
        this.playingSurface,
        this.puntNetAverage,
        this.puntReturnLong,
        this.puntTouchbacks,
        this.receivingYards,
        this.tacklesForLoss,
        this.assistedTackles,
        this.extraPointsMade,
        this.fanDuelPosition,
        this.fantasyPosition,
        this.injuryStartDate,
        this.kickReturnYards,
        this.miscSoloTackles,
        this.passingAttempts,
        this.puntReturnYards,
        this.puntsHadBlocked,
        this.quarterbackHits,
        this.rushingAttempts,
        this.safetiesAllowed,
        this.declaredInactive,
        this.draftKingsSalary,
        this.fantasyPointsPPR,
        this.fumblesRecovered,
        this.globalOpponentID,
        this.passingSackYards,
        this.positionCategory,
        this.receivingTargets,
        this.fantasyDataSalary,
        this.fumbleReturnYards,
        this.miscFumblesForced,
        this.passingTouchdowns,
        this.rushingTouchdowns,
        this.defensiveTeamSnaps,
        this.draftKingsPosition,
        this.fantasyDraftSalary,
        this.fantasyPointsYahoo,
        this.fumblesOutOfBounds,
        this.offensiveTeamSnaps,
        this.passingCompletions,
        this.defensiveTouchdowns,
        this.fieldGoalPercentage,
        this.fieldGoalsAttempted,
        this.fieldGoalsMade0to19,
        this.miscAssistedTackles,
        this.offensiveTouchdowns,
        this.receivingTouchdowns,
        this.receptionPercentage,
        this.snapCountsConfirmed,
        this.defensiveSnapsPlayed,
        this.extraPointsAttempted,
        this.fantasyDraftPosition,
        this.fantasyPointsFanDuel,
        this.fieldGoalReturnYards,
        this.fieldGoalsHadBlocked,
        this.fieldGoalsMade20to29,
        this.fieldGoalsMade30to39,
        this.fieldGoalsMade40to49,
        this.fieldGoalsMade50Plus,
        this.fumblesOwnRecoveries,
        this.kickReturnTouchdowns,
        this.miscFumblesRecovered,
        this.offensiveSnapsPlayed,
        this.opponentPositionRank,
        this.passingInterceptions,
        this.puntReturnTouchdowns,
        this.extraPointsHadBlocked,
        this.fieldGoalsLongestMade,
        this.kickReturnFairCatches,
        this.puntReturnFairCatches,
        this.specialTeamsTeamSnaps,
        this.blockedKickReturnYards,
        this.fumbleReturnTouchdowns,
        this.passingYardsPerAttempt,
        this.rushingYardsPerAttempt,
        this.specialTeamsTouchdowns,
        this.twoPointConversionRuns,
        this.fantasyPointsDraftKings,
        this.interceptionReturnYards,
        this.receivingYardsPerTarget,
        this.specialTeamsSnapsPlayed,
        this.specialTeamsSoloTackles,
        this.twoPointConversionPasses,
        this.fantasyPointsFantasyDraft,
        this.fieldGoalReturnTouchdowns,
        this.injuryPracticeDescription,
        this.kickReturnYardsPerAttempt,
        this.passingYardsPerCompletion,
        this.puntReturnYardsPerAttempt,
        this.specialTeamsFumblesForced,
        this.twoPointConversionReturns,
        this.receivingYardsPerReception,
        this.blockedKickReturnTouchdowns,
        this.passingCompletionPercentage,
        this.specialTeamsAssistedTackles,
        this.interceptionReturnTouchdowns,
        this.specialTeamsFumblesRecovered,
        this.twoPointConversionReceptions,
        this.offensiveFumbleRecoveryTouchdowns});

  JsonData.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    name = json['Name'];
    team = json['Team'];
    week = json['Week'];
    punts = json['Punts'];
    sacks = json['Sacks'];
    number = json['Number'];
    played = json['Played'];
    season = json['Season'];
    teamID = json['TeamID'];
    fumbles = json['Fumbles'];
    gameKey = json['GameKey'];
    scoreID = json['ScoreID'];
    stadium = json['Stadium'];
    started = json['Started'];
    tackles = json['Tackles'];
    dateTime = json['DateTime'];
    gameDate = json['GameDate'];
    humidity = json['Humidity'];
    opponent = json['Opponent'];
    playerID = json['PlayerID'];
    position = json['Position'];
    puntLong = json['PuntLong'];
    safeties = json['Safeties'];
    activated = json['Activated'];
    puntYards = json['PuntYards'];
    sackYards = json['SackYards'];
    shortName = json['ShortName'];
    windSpeed = json['WindSpeed'];
    homeOrAway = json['HomeOrAway'];
    isGameOver = json['IsGameOver'];
    opponentID = json['OpponentID'];
    receptions = json['Receptions'];
    seasonType = json['SeasonType'];
    touchdowns = json['Touchdowns'];
    fumblesLost = json['FumblesLost'];
    injuryNotes = json['InjuryNotes'];
    kickReturns = json['KickReturns'];
    passingLong = json['PassingLong'];
    puntAverage = json['PuntAverage'];
    puntReturns = json['PuntReturns'];
    rushingLong = json['RushingLong'];
    soloTackles = json['SoloTackles'];
    temperature = json['Temperature'];
    yahooSalary = json['YahooSalary'];
    blockedKicks = json['BlockedKicks'];
    globalGameID = json['GlobalGameID'];
    globalTeamID = json['GlobalTeamID'];
    injuryStatus = json['InjuryStatus'];
    opponentRank = json['OpponentRank'];
    passingSacks = json['PassingSacks'];
    passingYards = json['PassingYards'];
    playerGameID = json['PlayerGameID'];
    puntInside20 = json['PuntInside20'];
    puntNetYards = json['PuntNetYards'];
    rushingYards = json['RushingYards'];
    victivSalary = json['VictivSalary'];
    fanDuelSalary = json['FanDuelSalary'];
    fantasyPoints = json['FantasyPoints'];
    fumblesForced = json['FumblesForced'];
    interceptions = json['Interceptions'];
    passingRating = json['PassingRating'];
    receivingLong = json['ReceivingLong'];
    yahooPosition = json['YahooPosition'];
    fieldGoalsMade = json['FieldGoalsMade'];
    injuryBodyPart = json['InjuryBodyPart'];
    injuryPractice = json['InjuryPractice'];
    kickReturnLong = json['KickReturnLong'];
    passesDefended = json['PassesDefended'];
    playingSurface = json['PlayingSurface'];
    puntNetAverage = json['PuntNetAverage'];
    puntReturnLong = json['PuntReturnLong'];
    puntTouchbacks = json['PuntTouchbacks'];
    receivingYards = json['ReceivingYards'];
    tacklesForLoss = json['TacklesForLoss'];
    assistedTackles = json['AssistedTackles'];
    extraPointsMade = json['ExtraPointsMade'];
    fanDuelPosition = json['FanDuelPosition'];
    fantasyPosition = json['FantasyPosition'];
    injuryStartDate = json['InjuryStartDate'];
    kickReturnYards = json['KickReturnYards'];
    miscSoloTackles = json['MiscSoloTackles'];
    passingAttempts = json['PassingAttempts'];
    puntReturnYards = json['PuntReturnYards'];
    puntsHadBlocked = json['PuntsHadBlocked'];
    quarterbackHits = json['QuarterbackHits'];
    rushingAttempts = json['RushingAttempts'];
    safetiesAllowed = json['SafetiesAllowed'];
    declaredInactive = json['DeclaredInactive'];
    draftKingsSalary = json['DraftKingsSalary'];
    fantasyPointsPPR = json['FantasyPointsPPR'];
    fumblesRecovered = json['FumblesRecovered'];
    globalOpponentID = json['GlobalOpponentID'];
    passingSackYards = json['PassingSackYards'];
    positionCategory = json['PositionCategory'];
    receivingTargets = json['ReceivingTargets'];
    fantasyDataSalary = json['FantasyDataSalary'];
    fumbleReturnYards = json['FumbleReturnYards'];
    miscFumblesForced = json['MiscFumblesForced'];
    passingTouchdowns = json['PassingTouchdowns'];
    rushingTouchdowns = json['RushingTouchdowns'];
    defensiveTeamSnaps = json['DefensiveTeamSnaps'];
    draftKingsPosition = json['DraftKingsPosition'];
    fantasyDraftSalary = json['FantasyDraftSalary'];
    fantasyPointsYahoo = json['FantasyPointsYahoo'];
    fumblesOutOfBounds = json['FumblesOutOfBounds'];
    offensiveTeamSnaps = json['OffensiveTeamSnaps'];
    passingCompletions = json['PassingCompletions'];
    defensiveTouchdowns = json['DefensiveTouchdowns'];
    fieldGoalPercentage = json['FieldGoalPercentage'];
    fieldGoalsAttempted = json['FieldGoalsAttempted'];
    fieldGoalsMade0to19 = json['FieldGoalsMade0to19'];
    miscAssistedTackles = json['MiscAssistedTackles'];
    offensiveTouchdowns = json['OffensiveTouchdowns'];
    receivingTouchdowns = json['ReceivingTouchdowns'];
    receptionPercentage = json['ReceptionPercentage'];
    snapCountsConfirmed = json['SnapCountsConfirmed'];
    defensiveSnapsPlayed = json['DefensiveSnapsPlayed'];
    extraPointsAttempted = json['ExtraPointsAttempted'];
    fantasyDraftPosition = json['FantasyDraftPosition'];
    fantasyPointsFanDuel = json['FantasyPointsFanDuel'];
    fieldGoalReturnYards = json['FieldGoalReturnYards'];
    fieldGoalsHadBlocked = json['FieldGoalsHadBlocked'];
    fieldGoalsMade20to29 = json['FieldGoalsMade20to29'];
    fieldGoalsMade30to39 = json['FieldGoalsMade30to39'];
    fieldGoalsMade40to49 = json['FieldGoalsMade40to49'];
    fieldGoalsMade50Plus = json['FieldGoalsMade50Plus'];
    fumblesOwnRecoveries = json['FumblesOwnRecoveries'];
    kickReturnTouchdowns = json['KickReturnTouchdowns'];
    miscFumblesRecovered = json['MiscFumblesRecovered'];
    offensiveSnapsPlayed = json['OffensiveSnapsPlayed'];
    opponentPositionRank = json['OpponentPositionRank'];
    passingInterceptions = json['PassingInterceptions'];
    puntReturnTouchdowns = json['PuntReturnTouchdowns'];
    extraPointsHadBlocked = json['ExtraPointsHadBlocked'];
    fieldGoalsLongestMade = json['FieldGoalsLongestMade'];
    kickReturnFairCatches = json['KickReturnFairCatches'];
    puntReturnFairCatches = json['PuntReturnFairCatches'];
    specialTeamsTeamSnaps = json['SpecialTeamsTeamSnaps'];
    blockedKickReturnYards = json['BlockedKickReturnYards'];
    fumbleReturnTouchdowns = json['FumbleReturnTouchdowns'];
    passingYardsPerAttempt = json['PassingYardsPerAttempt'];
    rushingYardsPerAttempt = json['RushingYardsPerAttempt'];
    specialTeamsTouchdowns = json['SpecialTeamsTouchdowns'];
    twoPointConversionRuns = json['TwoPointConversionRuns'];
    fantasyPointsDraftKings = json['FantasyPointsDraftKings'];
    interceptionReturnYards = json['InterceptionReturnYards'];
    receivingYardsPerTarget = json['ReceivingYardsPerTarget'];
    specialTeamsSnapsPlayed = json['SpecialTeamsSnapsPlayed'];
    specialTeamsSoloTackles = json['SpecialTeamsSoloTackles'];
    twoPointConversionPasses = json['TwoPointConversionPasses'];
    fantasyPointsFantasyDraft = json['FantasyPointsFantasyDraft'];
    fieldGoalReturnTouchdowns = json['FieldGoalReturnTouchdowns'];
    injuryPracticeDescription = json['InjuryPracticeDescription'];
    kickReturnYardsPerAttempt = json['KickReturnYardsPerAttempt'];
    passingYardsPerCompletion = json['PassingYardsPerCompletion'];
    puntReturnYardsPerAttempt = json['PuntReturnYardsPerAttempt'];
    specialTeamsFumblesForced = json['SpecialTeamsFumblesForced'];
    twoPointConversionReturns = json['TwoPointConversionReturns'];
    receivingYardsPerReception = json['ReceivingYardsPerReception'];
    blockedKickReturnTouchdowns = json['BlockedKickReturnTouchdowns'];
    passingCompletionPercentage = json['PassingCompletionPercentage'];
    specialTeamsAssistedTackles = json['SpecialTeamsAssistedTackles'];
    interceptionReturnTouchdowns = json['InterceptionReturnTouchdowns'];
    specialTeamsFumblesRecovered = json['SpecialTeamsFumblesRecovered'];
    twoPointConversionReceptions = json['TwoPointConversionReceptions'];
    offensiveFumbleRecoveryTouchdowns =
    json['OffensiveFumbleRecoveryTouchdowns'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Day'] = this.day;
    data['Name'] = this.name;
    data['Team'] = this.team;
    data['Week'] = this.week;
    data['Punts'] = this.punts;
    data['Sacks'] = this.sacks;
    data['Number'] = this.number;
    data['Played'] = this.played;
    data['Season'] = this.season;
    data['TeamID'] = this.teamID;
    data['Fumbles'] = this.fumbles;
    data['GameKey'] = this.gameKey;
    data['ScoreID'] = this.scoreID;
    data['Stadium'] = this.stadium;
    data['Started'] = this.started;
    data['Tackles'] = this.tackles;
    data['DateTime'] = this.dateTime;
    data['GameDate'] = this.gameDate;
    data['Humidity'] = this.humidity;
    data['Opponent'] = this.opponent;
    data['PlayerID'] = this.playerID;
    data['Position'] = this.position;
    data['PuntLong'] = this.puntLong;
    data['Safeties'] = this.safeties;
    data['Activated'] = this.activated;
    data['PuntYards'] = this.puntYards;
    data['SackYards'] = this.sackYards;
    data['ShortName'] = this.shortName;
    data['WindSpeed'] = this.windSpeed;
    data['HomeOrAway'] = this.homeOrAway;
    data['IsGameOver'] = this.isGameOver;
    data['OpponentID'] = this.opponentID;
    data['Receptions'] = this.receptions;
    data['SeasonType'] = this.seasonType;
    data['Touchdowns'] = this.touchdowns;
    data['FumblesLost'] = this.fumblesLost;
    data['InjuryNotes'] = this.injuryNotes;
    data['KickReturns'] = this.kickReturns;
    data['PassingLong'] = this.passingLong;
    data['PuntAverage'] = this.puntAverage;
    data['PuntReturns'] = this.puntReturns;
    data['RushingLong'] = this.rushingLong;
    data['SoloTackles'] = this.soloTackles;
    data['Temperature'] = this.temperature;
    data['YahooSalary'] = this.yahooSalary;
    data['BlockedKicks'] = this.blockedKicks;
    data['GlobalGameID'] = this.globalGameID;
    data['GlobalTeamID'] = this.globalTeamID;
    data['InjuryStatus'] = this.injuryStatus;
    data['OpponentRank'] = this.opponentRank;
    data['PassingSacks'] = this.passingSacks;
    data['PassingYards'] = this.passingYards;
    data['PlayerGameID'] = this.playerGameID;
    data['PuntInside20'] = this.puntInside20;
    data['PuntNetYards'] = this.puntNetYards;
    data['RushingYards'] = this.rushingYards;
    data['VictivSalary'] = this.victivSalary;
    data['FanDuelSalary'] = this.fanDuelSalary;
    data['FantasyPoints'] = this.fantasyPoints;
    data['FumblesForced'] = this.fumblesForced;
    data['Interceptions'] = this.interceptions;
    data['PassingRating'] = this.passingRating;
    data['ReceivingLong'] = this.receivingLong;
    data['YahooPosition'] = this.yahooPosition;
    data['FieldGoalsMade'] = this.fieldGoalsMade;
    data['InjuryBodyPart'] = this.injuryBodyPart;
    data['InjuryPractice'] = this.injuryPractice;
    data['KickReturnLong'] = this.kickReturnLong;
    data['PassesDefended'] = this.passesDefended;
    data['PlayingSurface'] = this.playingSurface;
    data['PuntNetAverage'] = this.puntNetAverage;
    data['PuntReturnLong'] = this.puntReturnLong;
    data['PuntTouchbacks'] = this.puntTouchbacks;
    data['ReceivingYards'] = this.receivingYards;
    data['TacklesForLoss'] = this.tacklesForLoss;
    data['AssistedTackles'] = this.assistedTackles;
    data['ExtraPointsMade'] = this.extraPointsMade;
    data['FanDuelPosition'] = this.fanDuelPosition;
    data['FantasyPosition'] = this.fantasyPosition;
    data['InjuryStartDate'] = this.injuryStartDate;
    data['KickReturnYards'] = this.kickReturnYards;
    data['MiscSoloTackles'] = this.miscSoloTackles;
    data['PassingAttempts'] = this.passingAttempts;
    data['PuntReturnYards'] = this.puntReturnYards;
    data['PuntsHadBlocked'] = this.puntsHadBlocked;
    data['QuarterbackHits'] = this.quarterbackHits;
    data['RushingAttempts'] = this.rushingAttempts;
    data['SafetiesAllowed'] = this.safetiesAllowed;
    data['DeclaredInactive'] = this.declaredInactive;
    data['DraftKingsSalary'] = this.draftKingsSalary;
    data['FantasyPointsPPR'] = this.fantasyPointsPPR;
    data['FumblesRecovered'] = this.fumblesRecovered;
    data['GlobalOpponentID'] = this.globalOpponentID;
    data['PassingSackYards'] = this.passingSackYards;
    data['PositionCategory'] = this.positionCategory;
    data['ReceivingTargets'] = this.receivingTargets;
    data['FantasyDataSalary'] = this.fantasyDataSalary;
    data['FumbleReturnYards'] = this.fumbleReturnYards;
    data['MiscFumblesForced'] = this.miscFumblesForced;
    data['PassingTouchdowns'] = this.passingTouchdowns;
    data['RushingTouchdowns'] = this.rushingTouchdowns;
    data['DefensiveTeamSnaps'] = this.defensiveTeamSnaps;
    data['DraftKingsPosition'] = this.draftKingsPosition;
    data['FantasyDraftSalary'] = this.fantasyDraftSalary;
    data['FantasyPointsYahoo'] = this.fantasyPointsYahoo;
    data['FumblesOutOfBounds'] = this.fumblesOutOfBounds;
    data['OffensiveTeamSnaps'] = this.offensiveTeamSnaps;
    data['PassingCompletions'] = this.passingCompletions;
    data['DefensiveTouchdowns'] = this.defensiveTouchdowns;
    data['FieldGoalPercentage'] = this.fieldGoalPercentage;
    data['FieldGoalsAttempted'] = this.fieldGoalsAttempted;
    data['FieldGoalsMade0to19'] = this.fieldGoalsMade0to19;
    data['MiscAssistedTackles'] = this.miscAssistedTackles;
    data['OffensiveTouchdowns'] = this.offensiveTouchdowns;
    data['ReceivingTouchdowns'] = this.receivingTouchdowns;
    data['ReceptionPercentage'] = this.receptionPercentage;
    data['SnapCountsConfirmed'] = this.snapCountsConfirmed;
    data['DefensiveSnapsPlayed'] = this.defensiveSnapsPlayed;
    data['ExtraPointsAttempted'] = this.extraPointsAttempted;
    data['FantasyDraftPosition'] = this.fantasyDraftPosition;
    data['FantasyPointsFanDuel'] = this.fantasyPointsFanDuel;
    data['FieldGoalReturnYards'] = this.fieldGoalReturnYards;
    data['FieldGoalsHadBlocked'] = this.fieldGoalsHadBlocked;
    data['FieldGoalsMade20to29'] = this.fieldGoalsMade20to29;
    data['FieldGoalsMade30to39'] = this.fieldGoalsMade30to39;
    data['FieldGoalsMade40to49'] = this.fieldGoalsMade40to49;
    data['FieldGoalsMade50Plus'] = this.fieldGoalsMade50Plus;
    data['FumblesOwnRecoveries'] = this.fumblesOwnRecoveries;
    data['KickReturnTouchdowns'] = this.kickReturnTouchdowns;
    data['MiscFumblesRecovered'] = this.miscFumblesRecovered;
    data['OffensiveSnapsPlayed'] = this.offensiveSnapsPlayed;
    data['OpponentPositionRank'] = this.opponentPositionRank;
    data['PassingInterceptions'] = this.passingInterceptions;
    data['PuntReturnTouchdowns'] = this.puntReturnTouchdowns;
    data['ExtraPointsHadBlocked'] = this.extraPointsHadBlocked;
    data['FieldGoalsLongestMade'] = this.fieldGoalsLongestMade;
    data['KickReturnFairCatches'] = this.kickReturnFairCatches;
    data['PuntReturnFairCatches'] = this.puntReturnFairCatches;
    data['SpecialTeamsTeamSnaps'] = this.specialTeamsTeamSnaps;
    data['BlockedKickReturnYards'] = this.blockedKickReturnYards;
    data['FumbleReturnTouchdowns'] = this.fumbleReturnTouchdowns;
    data['PassingYardsPerAttempt'] = this.passingYardsPerAttempt;
    data['RushingYardsPerAttempt'] = this.rushingYardsPerAttempt;
    data['SpecialTeamsTouchdowns'] = this.specialTeamsTouchdowns;
    data['TwoPointConversionRuns'] = this.twoPointConversionRuns;
    data['FantasyPointsDraftKings'] = this.fantasyPointsDraftKings;
    data['InterceptionReturnYards'] = this.interceptionReturnYards;
    data['ReceivingYardsPerTarget'] = this.receivingYardsPerTarget;
    data['SpecialTeamsSnapsPlayed'] = this.specialTeamsSnapsPlayed;
    data['SpecialTeamsSoloTackles'] = this.specialTeamsSoloTackles;
    data['TwoPointConversionPasses'] = this.twoPointConversionPasses;
    data['FantasyPointsFantasyDraft'] = this.fantasyPointsFantasyDraft;
    data['FieldGoalReturnTouchdowns'] = this.fieldGoalReturnTouchdowns;
    data['InjuryPracticeDescription'] = this.injuryPracticeDescription;
    data['KickReturnYardsPerAttempt'] = this.kickReturnYardsPerAttempt;
    data['PassingYardsPerCompletion'] = this.passingYardsPerCompletion;
    data['PuntReturnYardsPerAttempt'] = this.puntReturnYardsPerAttempt;
    data['SpecialTeamsFumblesForced'] = this.specialTeamsFumblesForced;
    data['TwoPointConversionReturns'] = this.twoPointConversionReturns;
    data['ReceivingYardsPerReception'] = this.receivingYardsPerReception;
    data['BlockedKickReturnTouchdowns'] = this.blockedKickReturnTouchdowns;
    data['PassingCompletionPercentage'] = this.passingCompletionPercentage;
    data['SpecialTeamsAssistedTackles'] = this.specialTeamsAssistedTackles;
    data['InterceptionReturnTouchdowns'] = this.interceptionReturnTouchdowns;
    data['SpecialTeamsFumblesRecovered'] = this.specialTeamsFumblesRecovered;
    data['TwoPointConversionReceptions'] = this.twoPointConversionReceptions;
    data['OffensiveFumbleRecoveryTouchdowns'] =
        this.offensiveFumbleRecoveryTouchdowns;
    return data;
  }
}