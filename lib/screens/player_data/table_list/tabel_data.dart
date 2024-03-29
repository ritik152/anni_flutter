class TableData {
  String? gameKey;
  int? playerID;
  int? seasonType;
  int? season;
  String? gameDate;
  int? week;
  String? team;
  String? opponent;
  String? homeOrAway;
  int? number;
  String? name;
  String? position;
  String? positionCategory;
  int? activated;
  int? played;
  int? started;
  int? passingAttempts;
  int? passingCompletions;
  int? passingYards;
  int? passingCompletionPercentage;
  int? passingYardsPerAttempt;
  int? passingYardsPerCompletion;
  int? passingTouchdowns;
  int? passingInterceptions;
  int? passingRating;
  int? passingLong;
  int? passingSacks;
  int? passingSackYards;
  int? rushingAttempts;
  int? rushingYards;
  int? rushingYardsPerAttempt;
  int? rushingTouchdowns;
  int? rushingLong;
  int? receivingTargets;
  int? receptions;
  int? receivingYards;
  int? receivingYardsPerReception;
  int? receivingTouchdowns;
  int? receivingLong;
  int? fumbles;
  int? fumblesLost;
  int? puntReturns;
  int? puntReturnYards;
  int? puntReturnYardsPerAttempt;
  int? puntReturnTouchdowns;
  int? puntReturnLong;
  int? kickReturns;
  int? kickReturnYards;
  int? kickReturnYardsPerAttempt;
  int? kickReturnTouchdowns;
  int? kickReturnLong;
  double? soloTackles;
  double? assistedTackles;
  double? tacklesForLoss;
  double? sacks;
  double? sackYards;
  double? quarterbackHits;
  double? passesDefended;
  int? fumblesForced;
  int? fumblesRecovered;
  double? fumbleReturnYards;
  int? fumbleReturnTouchdowns;
  int? interceptions;
  double? interceptionReturnYards;
  int? interceptionReturnTouchdowns;
  int? blockedKicks;
  int? specialTeamsSoloTackles;
  int? specialTeamsAssistedTackles;
  int? miscSoloTackles;
  int? miscAssistedTackles;
  int? punts;
  int? puntYards;
  int? puntAverage;
  int? fieldGoalsAttempted;
  int? fieldGoalsMade;
  int? fieldGoalsLongestMade;
  int? extraPointsMade;
  int? twoPointConversionPasses;
  int? twoPointConversionRuns;
  int? twoPointConversionReceptions;
  double? fantasyPoints;
  double? fantasyPointsPPR;
  int? receptionPercentage;
  int? receivingYardsPerTarget;
  double? tackles;
  int? offensiveTouchdowns;
  int? defensiveTouchdowns;
  int? specialTeamsTouchdowns;
  int? touchdowns;
  String? fantasyPosition;
  int? fieldGoalPercentage;
  int? playerGameID;
  int? fumblesOwnRecoveries;
  int? fumblesOutOfBounds;
  int? kickReturnFairCatches;
  int? puntReturnFairCatches;
  int? puntTouchbacks;
  int? puntInside20;
  int? puntNetAverage;
  int? extraPointsAttempted;
  int? blockedKickReturnTouchdowns;
  int? fieldGoalReturnTouchdowns;
  int? safeties;
  int? fieldGoalsHadBlocked;
  int? puntsHadBlocked;
  int? extraPointsHadBlocked;
  int? puntLong;
  int? blockedKickReturnYards;
  int? fieldGoalReturnYards;
  int? puntNetYards;
  int? specialTeamsFumblesForced;
  int? specialTeamsFumblesRecovered;
  int? miscFumblesForced;
  int? miscFumblesRecovered;
  String? shortName;
  String? playingSurface;
  bool? isGameOver;
  int? safetiesAllowed;
  var stadium;
  var temperature;
  var humidity;
  var windSpeed;
  var fanDuelSalary;
  var draftKingsSalary;
  var fantasyDataSalary;
  var offensiveSnapsPlayed;
  int? defensiveSnapsPlayed;
  var specialTeamsSnapsPlayed;
  var offensiveTeamSnaps;
  var defensiveTeamSnaps;
  var specialTeamsTeamSnaps;
  var victivSalary;
  int? twoPointConversionReturns;
  int? fantasyPointsFanDuel;
  int? fieldGoalsMade0to19;
  int? fieldGoalsMade20to29;
  int? fieldGoalsMade30to39;
  int? fieldGoalsMade40to49;
  int? fieldGoalsMade50Plus;
  int? fantasyPointsDraftKings;
  var yahooSalary;
  int? fantasyPointsYahoo;
  String? injuryStatus;
  String? injuryBodyPart;
  var injuryStartDate;
  String? injuryNotes;
  String? fanDuelPosition;
  String? draftKingsPosition;
  String? yahooPosition;
  int? opponentRank;
  var opponentPositionRank;
  String? injuryPractice;
  String? injuryPracticeDescription;
  bool? declaredInactive;
  var fantasyDraftSalary;
  var fantasyDraftPosition;
  int? teamID;
  int? opponentID;
  String? day;
  String? dateTime;
  int? globalGameID;
  int? globalTeamID;
  int? globalOpponentID;
  int? scoreID;
  int? fantasyPointsFantasyDraft;
  var offensiveFumbleRecoveryTouchdowns;
  var snapCountsConfirmed;

  TableData(
      {this.gameKey,
        this.playerID,
        this.seasonType,
        this.season,
        this.gameDate,
        this.week,
        this.team,
        this.opponent,
        this.homeOrAway,
        this.number,
        this.name,
        this.position,
        this.positionCategory,
        this.activated,
        this.played,
        this.started,
        this.passingAttempts,
        this.passingCompletions,
        this.passingYards,
        this.passingCompletionPercentage,
        this.passingYardsPerAttempt,
        this.passingYardsPerCompletion,
        this.passingTouchdowns,
        this.passingInterceptions,
        this.passingRating,
        this.passingLong,
        this.passingSacks,
        this.passingSackYards,
        this.rushingAttempts,
        this.rushingYards,
        this.rushingYardsPerAttempt,
        this.rushingTouchdowns,
        this.rushingLong,
        this.receivingTargets,
        this.receptions,
        this.receivingYards,
        this.receivingYardsPerReception,
        this.receivingTouchdowns,
        this.receivingLong,
        this.fumbles,
        this.fumblesLost,
        this.puntReturns,
        this.puntReturnYards,
        this.puntReturnYardsPerAttempt,
        this.puntReturnTouchdowns,
        this.puntReturnLong,
        this.kickReturns,
        this.kickReturnYards,
        this.kickReturnYardsPerAttempt,
        this.kickReturnTouchdowns,
        this.kickReturnLong,
        this.soloTackles,
        this.assistedTackles,
        this.tacklesForLoss,
        this.sacks,
        this.sackYards,
        this.quarterbackHits,
        this.passesDefended,
        this.fumblesForced,
        this.fumblesRecovered,
        this.fumbleReturnYards,
        this.fumbleReturnTouchdowns,
        this.interceptions,
        this.interceptionReturnYards,
        this.interceptionReturnTouchdowns,
        this.blockedKicks,
        this.specialTeamsSoloTackles,
        this.specialTeamsAssistedTackles,
        this.miscSoloTackles,
        this.miscAssistedTackles,
        this.punts,
        this.puntYards,
        this.puntAverage,
        this.fieldGoalsAttempted,
        this.fieldGoalsMade,
        this.fieldGoalsLongestMade,
        this.extraPointsMade,
        this.twoPointConversionPasses,
        this.twoPointConversionRuns,
        this.twoPointConversionReceptions,
        this.fantasyPoints,
        this.fantasyPointsPPR,
        this.receptionPercentage,
        this.receivingYardsPerTarget,
        this.tackles,
        this.offensiveTouchdowns,
        this.defensiveTouchdowns,
        this.specialTeamsTouchdowns,
        this.touchdowns,
        this.fantasyPosition,
        this.fieldGoalPercentage,
        this.playerGameID,
        this.fumblesOwnRecoveries,
        this.fumblesOutOfBounds,
        this.kickReturnFairCatches,
        this.puntReturnFairCatches,
        this.puntTouchbacks,
        this.puntInside20,
        this.puntNetAverage,
        this.extraPointsAttempted,
        this.blockedKickReturnTouchdowns,
        this.fieldGoalReturnTouchdowns,
        this.safeties,
        this.fieldGoalsHadBlocked,
        this.puntsHadBlocked,
        this.extraPointsHadBlocked,
        this.puntLong,
        this.blockedKickReturnYards,
        this.fieldGoalReturnYards,
        this.puntNetYards,
        this.specialTeamsFumblesForced,
        this.specialTeamsFumblesRecovered,
        this.miscFumblesForced,
        this.miscFumblesRecovered,
        this.shortName,
        this.playingSurface,
        this.isGameOver,
        this.safetiesAllowed,
        this.stadium,
        this.temperature,
        this.humidity,
        this.windSpeed,
        this.fanDuelSalary,
        this.draftKingsSalary,
        this.fantasyDataSalary,
        this.offensiveSnapsPlayed,
        this.defensiveSnapsPlayed,
        this.specialTeamsSnapsPlayed,
        this.offensiveTeamSnaps,
        this.defensiveTeamSnaps,
        this.specialTeamsTeamSnaps,
        this.victivSalary,
        this.twoPointConversionReturns,
        this.fantasyPointsFanDuel,
        this.fieldGoalsMade0to19,
        this.fieldGoalsMade20to29,
        this.fieldGoalsMade30to39,
        this.fieldGoalsMade40to49,
        this.fieldGoalsMade50Plus,
        this.fantasyPointsDraftKings,
        this.yahooSalary,
        this.fantasyPointsYahoo,
        this.injuryStatus,
        this.injuryBodyPart,
        this.injuryStartDate,
        this.injuryNotes,
        this.fanDuelPosition,
        this.draftKingsPosition,
        this.yahooPosition,
        this.opponentRank,
        this.opponentPositionRank,
        this.injuryPractice,
        this.injuryPracticeDescription,
        this.declaredInactive,
        this.fantasyDraftSalary,
        this.fantasyDraftPosition,
        this.teamID,
        this.opponentID,
        this.day,
        this.dateTime,
        this.globalGameID,
        this.globalTeamID,
        this.globalOpponentID,
        this.scoreID,
        this.fantasyPointsFantasyDraft,
        this.offensiveFumbleRecoveryTouchdowns,
        this.snapCountsConfirmed});

  TableData.fromJson(Map<String, dynamic> json) {
    gameKey = json['GameKey'];
    playerID = json['PlayerID'];
    seasonType = json['SeasonType'];
    season = json['Season'];
    gameDate = json['GameDate'];
    week = json['Week'];
    team = json['Team'];
    opponent = json['Opponent'];
    homeOrAway = json['HomeOrAway'];
    number = json['Number'];
    name = json['Name'];
    position = json['Position'];
    positionCategory = json['PositionCategory'];
    activated = json['Activated'];
    played = json['Played'];
    started = json['Started'];
    passingAttempts = json['PassingAttempts'];
    passingCompletions = json['PassingCompletions'];
    passingYards = json['PassingYards'];
    passingCompletionPercentage = json['PassingCompletionPercentage'];
    passingYardsPerAttempt = json['PassingYardsPerAttempt'];
    passingYardsPerCompletion = json['PassingYardsPerCompletion'];
    passingTouchdowns = json['PassingTouchdowns'];
    passingInterceptions = json['PassingInterceptions'];
    passingRating = json['PassingRating'];
    passingLong = json['PassingLong'];
    passingSacks = json['PassingSacks'];
    passingSackYards = json['PassingSackYards'];
    rushingAttempts = json['RushingAttempts'];
    rushingYards = json['RushingYards'];
    rushingYardsPerAttempt = json['RushingYardsPerAttempt'];
    rushingTouchdowns = json['RushingTouchdowns'];
    rushingLong = json['RushingLong'];
    receivingTargets = json['ReceivingTargets'];
    receptions = json['Receptions'];
    receivingYards = json['ReceivingYards'];
    receivingYardsPerReception = json['ReceivingYardsPerReception'];
    receivingTouchdowns = json['ReceivingTouchdowns'];
    receivingLong = json['ReceivingLong'];
    fumbles = json['Fumbles'];
    fumblesLost = json['FumblesLost'];
    puntReturns = json['PuntReturns'];
    puntReturnYards = json['PuntReturnYards'];
    puntReturnYardsPerAttempt = json['PuntReturnYardsPerAttempt'];
    puntReturnTouchdowns = json['PuntReturnTouchdowns'];
    puntReturnLong = json['PuntReturnLong'];
    kickReturns = json['KickReturns'];
    kickReturnYards = json['KickReturnYards'];
    kickReturnYardsPerAttempt = json['KickReturnYardsPerAttempt'];
    kickReturnTouchdowns = json['KickReturnTouchdowns'];
    kickReturnLong = json['KickReturnLong'];
    soloTackles = json['SoloTackles'];
    assistedTackles = json['AssistedTackles'];
    tacklesForLoss = json['TacklesForLoss'];
    sacks = json['Sacks'];
    sackYards = json['SackYards'];
    quarterbackHits = json['QuarterbackHits'];
    passesDefended = json['PassesDefended'];
    fumblesForced = json['FumblesForced'];
    fumblesRecovered = json['FumblesRecovered'];
    fumbleReturnYards = json['FumbleReturnYards'];
    fumbleReturnTouchdowns = json['FumbleReturnTouchdowns'];
    interceptions = json['Interceptions'];
    interceptionReturnYards = json['InterceptionReturnYards'];
    interceptionReturnTouchdowns = json['InterceptionReturnTouchdowns'];
    blockedKicks = json['BlockedKicks'];
    specialTeamsSoloTackles = json['SpecialTeamsSoloTackles'];
    specialTeamsAssistedTackles = json['SpecialTeamsAssistedTackles'];
    miscSoloTackles = json['MiscSoloTackles'];
    miscAssistedTackles = json['MiscAssistedTackles'];
    punts = json['Punts'];
    puntYards = json['PuntYards'];
    puntAverage = json['PuntAverage'];
    fieldGoalsAttempted = json['FieldGoalsAttempted'];
    fieldGoalsMade = json['FieldGoalsMade'];
    fieldGoalsLongestMade = json['FieldGoalsLongestMade'];
    extraPointsMade = json['ExtraPointsMade'];
    twoPointConversionPasses = json['TwoPointConversionPasses'];
    twoPointConversionRuns = json['TwoPointConversionRuns'];
    twoPointConversionReceptions = json['TwoPointConversionReceptions'];
    fantasyPoints = json['FantasyPoints'];
    fantasyPointsPPR = json['FantasyPointsPPR'];
    receptionPercentage = json['ReceptionPercentage'];
    receivingYardsPerTarget = json['ReceivingYardsPerTarget'];
    tackles = json['Tackles'];
    offensiveTouchdowns = json['OffensiveTouchdowns'];
    defensiveTouchdowns = json['DefensiveTouchdowns'];
    specialTeamsTouchdowns = json['SpecialTeamsTouchdowns'];
    touchdowns = json['Touchdowns'];
    fantasyPosition = json['FantasyPosition'];
    fieldGoalPercentage = json['FieldGoalPercentage'];
    playerGameID = json['PlayerGameID'];
    fumblesOwnRecoveries = json['FumblesOwnRecoveries'];
    fumblesOutOfBounds = json['FumblesOutOfBounds'];
    kickReturnFairCatches = json['KickReturnFairCatches'];
    puntReturnFairCatches = json['PuntReturnFairCatches'];
    puntTouchbacks = json['PuntTouchbacks'];
    puntInside20 = json['PuntInside20'];
    puntNetAverage = json['PuntNetAverage'];
    extraPointsAttempted = json['ExtraPointsAttempted'];
    blockedKickReturnTouchdowns = json['BlockedKickReturnTouchdowns'];
    fieldGoalReturnTouchdowns = json['FieldGoalReturnTouchdowns'];
    safeties = json['Safeties'];
    fieldGoalsHadBlocked = json['FieldGoalsHadBlocked'];
    puntsHadBlocked = json['PuntsHadBlocked'];
    extraPointsHadBlocked = json['ExtraPointsHadBlocked'];
    puntLong = json['PuntLong'];
    blockedKickReturnYards = json['BlockedKickReturnYards'];
    fieldGoalReturnYards = json['FieldGoalReturnYards'];
    puntNetYards = json['PuntNetYards'];
    specialTeamsFumblesForced = json['SpecialTeamsFumblesForced'];
    specialTeamsFumblesRecovered = json['SpecialTeamsFumblesRecovered'];
    miscFumblesForced = json['MiscFumblesForced'];
    miscFumblesRecovered = json['MiscFumblesRecovered'];
    shortName = json['ShortName'];
    playingSurface = json['PlayingSurface'];
    isGameOver = json['IsGameOver'];
    safetiesAllowed = json['SafetiesAllowed'];
    stadium = json['Stadium'];
    temperature = json['Temperature'];
    humidity = json['Humidity'];
    windSpeed = json['WindSpeed'];
    fanDuelSalary = json['FanDuelSalary'];
    draftKingsSalary = json['DraftKingsSalary'];
    fantasyDataSalary = json['FantasyDataSalary'];
    offensiveSnapsPlayed = json['OffensiveSnapsPlayed'];
    defensiveSnapsPlayed = json['DefensiveSnapsPlayed'];
    specialTeamsSnapsPlayed = json['SpecialTeamsSnapsPlayed'];
    offensiveTeamSnaps = json['OffensiveTeamSnaps'];
    defensiveTeamSnaps = json['DefensiveTeamSnaps'];
    specialTeamsTeamSnaps = json['SpecialTeamsTeamSnaps'];
    victivSalary = json['VictivSalary'];
    twoPointConversionReturns = json['TwoPointConversionReturns'];
    fantasyPointsFanDuel = json['FantasyPointsFanDuel'];
    fieldGoalsMade0to19 = json['FieldGoalsMade0to19'];
    fieldGoalsMade20to29 = json['FieldGoalsMade20to29'];
    fieldGoalsMade30to39 = json['FieldGoalsMade30to39'];
    fieldGoalsMade40to49 = json['FieldGoalsMade40to49'];
    fieldGoalsMade50Plus = json['FieldGoalsMade50Plus'];
    fantasyPointsDraftKings = json['FantasyPointsDraftKings'];
    yahooSalary = json['YahooSalary'];
    fantasyPointsYahoo = json['FantasyPointsYahoo'];
    injuryStatus = json['InjuryStatus'];
    injuryBodyPart = json['InjuryBodyPart'];
    injuryStartDate = json['InjuryStartDate'];
    injuryNotes = json['InjuryNotes'];
    fanDuelPosition = json['FanDuelPosition'];
    draftKingsPosition = json['DraftKingsPosition'];
    yahooPosition = json['YahooPosition'];
    opponentRank = json['OpponentRank'];
    opponentPositionRank = json['OpponentPositionRank'];
    injuryPractice = json['InjuryPractice'];
    injuryPracticeDescription = json['InjuryPracticeDescription'];
    declaredInactive = json['DeclaredInactive'];
    fantasyDraftSalary = json['FantasyDraftSalary'];
    fantasyDraftPosition = json['FantasyDraftPosition'];
    teamID = json['TeamID'];
    opponentID = json['OpponentID'];
    day = json['Day'];
    dateTime = json['DateTime'];
    globalGameID = json['GlobalGameID'];
    globalTeamID = json['GlobalTeamID'];
    globalOpponentID = json['GlobalOpponentID'];
    scoreID = json['ScoreID'];
    fantasyPointsFantasyDraft = json['FantasyPointsFantasyDraft'];
    offensiveFumbleRecoveryTouchdowns =
    json['OffensiveFumbleRecoveryTouchdowns'];
    snapCountsConfirmed = json['SnapCountsConfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GameKey'] = this.gameKey;
    data['PlayerID'] = this.playerID;
    data['SeasonType'] = this.seasonType;
    data['Season'] = this.season;
    data['GameDate'] = this.gameDate;
    data['Week'] = this.week;
    data['Team'] = this.team;
    data['Opponent'] = this.opponent;
    data['HomeOrAway'] = this.homeOrAway;
    data['Number'] = this.number;
    data['Name'] = this.name;
    data['Position'] = this.position;
    data['PositionCategory'] = this.positionCategory;
    data['Activated'] = this.activated;
    data['Played'] = this.played;
    data['Started'] = this.started;
    data['PassingAttempts'] = this.passingAttempts;
    data['PassingCompletions'] = this.passingCompletions;
    data['PassingYards'] = this.passingYards;
    data['PassingCompletionPercentage'] = this.passingCompletionPercentage;
    data['PassingYardsPerAttempt'] = this.passingYardsPerAttempt;
    data['PassingYardsPerCompletion'] = this.passingYardsPerCompletion;
    data['PassingTouchdowns'] = this.passingTouchdowns;
    data['PassingInterceptions'] = this.passingInterceptions;
    data['PassingRating'] = this.passingRating;
    data['PassingLong'] = this.passingLong;
    data['PassingSacks'] = this.passingSacks;
    data['PassingSackYards'] = this.passingSackYards;
    data['RushingAttempts'] = this.rushingAttempts;
    data['RushingYards'] = this.rushingYards;
    data['RushingYardsPerAttempt'] = this.rushingYardsPerAttempt;
    data['RushingTouchdowns'] = this.rushingTouchdowns;
    data['RushingLong'] = this.rushingLong;
    data['ReceivingTargets'] = this.receivingTargets;
    data['Receptions'] = this.receptions;
    data['ReceivingYards'] = this.receivingYards;
    data['ReceivingYardsPerReception'] = this.receivingYardsPerReception;
    data['ReceivingTouchdowns'] = this.receivingTouchdowns;
    data['ReceivingLong'] = this.receivingLong;
    data['Fumbles'] = this.fumbles;
    data['FumblesLost'] = this.fumblesLost;
    data['PuntReturns'] = this.puntReturns;
    data['PuntReturnYards'] = this.puntReturnYards;
    data['PuntReturnYardsPerAttempt'] = this.puntReturnYardsPerAttempt;
    data['PuntReturnTouchdowns'] = this.puntReturnTouchdowns;
    data['PuntReturnLong'] = this.puntReturnLong;
    data['KickReturns'] = this.kickReturns;
    data['KickReturnYards'] = this.kickReturnYards;
    data['KickReturnYardsPerAttempt'] = this.kickReturnYardsPerAttempt;
    data['KickReturnTouchdowns'] = this.kickReturnTouchdowns;
    data['KickReturnLong'] = this.kickReturnLong;
    data['SoloTackles'] = this.soloTackles;
    data['AssistedTackles'] = this.assistedTackles;
    data['TacklesForLoss'] = this.tacklesForLoss;
    data['Sacks'] = this.sacks;
    data['SackYards'] = this.sackYards;
    data['QuarterbackHits'] = this.quarterbackHits;
    data['PassesDefended'] = this.passesDefended;
    data['FumblesForced'] = this.fumblesForced;
    data['FumblesRecovered'] = this.fumblesRecovered;
    data['FumbleReturnYards'] = this.fumbleReturnYards;
    data['FumbleReturnTouchdowns'] = this.fumbleReturnTouchdowns;
    data['Interceptions'] = this.interceptions;
    data['InterceptionReturnYards'] = this.interceptionReturnYards;
    data['InterceptionReturnTouchdowns'] = this.interceptionReturnTouchdowns;
    data['BlockedKicks'] = this.blockedKicks;
    data['SpecialTeamsSoloTackles'] = this.specialTeamsSoloTackles;
    data['SpecialTeamsAssistedTackles'] = this.specialTeamsAssistedTackles;
    data['MiscSoloTackles'] = this.miscSoloTackles;
    data['MiscAssistedTackles'] = this.miscAssistedTackles;
    data['Punts'] = this.punts;
    data['PuntYards'] = this.puntYards;
    data['PuntAverage'] = this.puntAverage;
    data['FieldGoalsAttempted'] = this.fieldGoalsAttempted;
    data['FieldGoalsMade'] = this.fieldGoalsMade;
    data['FieldGoalsLongestMade'] = this.fieldGoalsLongestMade;
    data['ExtraPointsMade'] = this.extraPointsMade;
    data['TwoPointConversionPasses'] = this.twoPointConversionPasses;
    data['TwoPointConversionRuns'] = this.twoPointConversionRuns;
    data['TwoPointConversionReceptions'] = this.twoPointConversionReceptions;
    data['FantasyPoints'] = this.fantasyPoints;
    data['FantasyPointsPPR'] = this.fantasyPointsPPR;
    data['ReceptionPercentage'] = this.receptionPercentage;
    data['ReceivingYardsPerTarget'] = this.receivingYardsPerTarget;
    data['Tackles'] = this.tackles;
    data['OffensiveTouchdowns'] = this.offensiveTouchdowns;
    data['DefensiveTouchdowns'] = this.defensiveTouchdowns;
    data['SpecialTeamsTouchdowns'] = this.specialTeamsTouchdowns;
    data['Touchdowns'] = this.touchdowns;
    data['FantasyPosition'] = this.fantasyPosition;
    data['FieldGoalPercentage'] = this.fieldGoalPercentage;
    data['PlayerGameID'] = this.playerGameID;
    data['FumblesOwnRecoveries'] = this.fumblesOwnRecoveries;
    data['FumblesOutOfBounds'] = this.fumblesOutOfBounds;
    data['KickReturnFairCatches'] = this.kickReturnFairCatches;
    data['PuntReturnFairCatches'] = this.puntReturnFairCatches;
    data['PuntTouchbacks'] = this.puntTouchbacks;
    data['PuntInside20'] = this.puntInside20;
    data['PuntNetAverage'] = this.puntNetAverage;
    data['ExtraPointsAttempted'] = this.extraPointsAttempted;
    data['BlockedKickReturnTouchdowns'] = this.blockedKickReturnTouchdowns;
    data['FieldGoalReturnTouchdowns'] = this.fieldGoalReturnTouchdowns;
    data['Safeties'] = this.safeties;
    data['FieldGoalsHadBlocked'] = this.fieldGoalsHadBlocked;
    data['PuntsHadBlocked'] = this.puntsHadBlocked;
    data['ExtraPointsHadBlocked'] = this.extraPointsHadBlocked;
    data['PuntLong'] = this.puntLong;
    data['BlockedKickReturnYards'] = this.blockedKickReturnYards;
    data['FieldGoalReturnYards'] = this.fieldGoalReturnYards;
    data['PuntNetYards'] = this.puntNetYards;
    data['SpecialTeamsFumblesForced'] = this.specialTeamsFumblesForced;
    data['SpecialTeamsFumblesRecovered'] = this.specialTeamsFumblesRecovered;
    data['MiscFumblesForced'] = this.miscFumblesForced;
    data['MiscFumblesRecovered'] = this.miscFumblesRecovered;
    data['ShortName'] = this.shortName;
    data['PlayingSurface'] = this.playingSurface;
    data['IsGameOver'] = this.isGameOver;
    data['SafetiesAllowed'] = this.safetiesAllowed;
    data['Stadium'] = this.stadium;
    data['Temperature'] = this.temperature;
    data['Humidity'] = this.humidity;
    data['WindSpeed'] = this.windSpeed;
    data['FanDuelSalary'] = this.fanDuelSalary;
    data['DraftKingsSalary'] = this.draftKingsSalary;
    data['FantasyDataSalary'] = this.fantasyDataSalary;
    data['OffensiveSnapsPlayed'] = this.offensiveSnapsPlayed;
    data['DefensiveSnapsPlayed'] = this.defensiveSnapsPlayed;
    data['SpecialTeamsSnapsPlayed'] = this.specialTeamsSnapsPlayed;
    data['OffensiveTeamSnaps'] = this.offensiveTeamSnaps;
    data['DefensiveTeamSnaps'] = this.defensiveTeamSnaps;
    data['SpecialTeamsTeamSnaps'] = this.specialTeamsTeamSnaps;
    data['VictivSalary'] = this.victivSalary;
    data['TwoPointConversionReturns'] = this.twoPointConversionReturns;
    data['FantasyPointsFanDuel'] = this.fantasyPointsFanDuel;
    data['FieldGoalsMade0to19'] = this.fieldGoalsMade0to19;
    data['FieldGoalsMade20to29'] = this.fieldGoalsMade20to29;
    data['FieldGoalsMade30to39'] = this.fieldGoalsMade30to39;
    data['FieldGoalsMade40to49'] = this.fieldGoalsMade40to49;
    data['FieldGoalsMade50Plus'] = this.fieldGoalsMade50Plus;
    data['FantasyPointsDraftKings'] = this.fantasyPointsDraftKings;
    data['YahooSalary'] = this.yahooSalary;
    data['FantasyPointsYahoo'] = this.fantasyPointsYahoo;
    data['InjuryStatus'] = this.injuryStatus;
    data['InjuryBodyPart'] = this.injuryBodyPart;
    data['InjuryStartDate'] = this.injuryStartDate;
    data['InjuryNotes'] = this.injuryNotes;
    data['FanDuelPosition'] = this.fanDuelPosition;
    data['DraftKingsPosition'] = this.draftKingsPosition;
    data['YahooPosition'] = this.yahooPosition;
    data['OpponentRank'] = this.opponentRank;
    data['OpponentPositionRank'] = this.opponentPositionRank;
    data['InjuryPractice'] = this.injuryPractice;
    data['InjuryPracticeDescription'] = this.injuryPracticeDescription;
    data['DeclaredInactive'] = this.declaredInactive;
    data['FantasyDraftSalary'] = this.fantasyDraftSalary;
    data['FantasyDraftPosition'] = this.fantasyDraftPosition;
    data['TeamID'] = this.teamID;
    data['OpponentID'] = this.opponentID;
    data['Day'] = this.day;
    data['DateTime'] = this.dateTime;
    data['GlobalGameID'] = this.globalGameID;
    data['GlobalTeamID'] = this.globalTeamID;
    data['GlobalOpponentID'] = this.globalOpponentID;
    data['ScoreID'] = this.scoreID;
    data['FantasyPointsFantasyDraft'] = this.fantasyPointsFantasyDraft;
    data['OffensiveFumbleRecoveryTouchdowns'] =
        this.offensiveFumbleRecoveryTouchdowns;
    data['SnapCountsConfirmed'] = this.snapCountsConfirmed;
    return data;
  }
}