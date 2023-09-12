class PlayersModel {
  int? playerID;
  var team;
  var number;
  String? firstName;
  String? lastName;
  String? position;
  String? status;
  String? height;
  int? weight;
  String? birthDate;
  String? college;
  int? experience;
  String? fantasyPosition;
  bool? active;
  String? positionCategory;
  String? name;
  int? age;
  String? experienceString;
  String? birthDateString;
  String? photoUrl;
  var byeWeek;
  String? upcomingGameOpponent;
  int? upcomingGameWeek;
  String? shortName;
  var averageDraftPosition;
  String? depthPositionCategory;
  String? depthPosition;
  var depthOrder;
  var depthDisplayOrder;
  var currentTeam;
  String? collegeDraftTeam;
  int? collegeDraftYear;
  int? collegeDraftRound;
  int? collegeDraftPick;
  bool? isUndraftedFreeAgent;
  int? heightFeet;
  int? heightInches;
  int? upcomingOpponentRank;
  int? upcomingOpponentPositionRank;
  String? currentStatus;
  var upcomingSalary;
  int? fantasyAlarmPlayerID;
  String? sportRadarPlayerID;
  var rotoworldPlayerID;
  int? rotoWirePlayerID;
  int? statsPlayerID;
  int? sportsDirectPlayerID;
  int? xmlTeamPlayerID;
  var fanDuelPlayerID;
  var draftKingsPlayerID;
  int? yahooPlayerID;
  String? injuryStatus;
  String? injuryBodyPart;
  var injuryStartDate;
  String? injuryNotes;
  var fanDuelName;
  var draftKingsName;
  var yahooName;
  var fantasyPositionDepthOrder;
  String? injuryPractice;
  String? injuryPracticeDescription;
  String? teamImg;
  bool? declaredInactive;
  var upcomingFanDuelSalary;
  var upcomingDraftKingsSalary;
  var upcomingYahooSalary;
  var teamID;
  int? globalTeamID;
  var fantasyDraftPlayerID;
  var fantasyDraftName;
  int? usaTodayPlayerID;
  String? usaTodayHeadshotUrl;
  String? usaTodayHeadshotNoBackgroundUrl;
  String? usaTodayHeadshotUpdated;
  String? usaTodayHeadshotNoBackgroundUpdated;

  PlayersModel(
      {this.playerID,
        this.team,
        this.number,
        this.firstName,
        this.lastName,
        this.position,
        this.status,
        this.height,
        this.weight,
        this.birthDate,
        this.college,
        this.experience,
        this.fantasyPosition,
        this.active,
        this.positionCategory,
        this.name,
        this.age,
        this.experienceString,
        this.birthDateString,
        this.photoUrl,
        this.byeWeek,
        this.upcomingGameOpponent,
        this.upcomingGameWeek,
        this.shortName,
        this.averageDraftPosition,
        this.depthPositionCategory,
        this.depthPosition,
        this.depthOrder,
        this.depthDisplayOrder,
        this.currentTeam,
        this.collegeDraftTeam,
        this.collegeDraftYear,
        this.collegeDraftRound,
        this.collegeDraftPick,
        this.isUndraftedFreeAgent,
        this.heightFeet,
        this.heightInches,
        this.upcomingOpponentRank,
        this.upcomingOpponentPositionRank,
        this.currentStatus,
        this.upcomingSalary,
        this.fantasyAlarmPlayerID,
        this.sportRadarPlayerID,
        this.rotoworldPlayerID,
        this.rotoWirePlayerID,
        this.statsPlayerID,
        this.sportsDirectPlayerID,
        this.xmlTeamPlayerID,
        this.fanDuelPlayerID,
        this.draftKingsPlayerID,
        this.yahooPlayerID,
        this.injuryStatus,
        this.injuryBodyPart,
        this.injuryStartDate,
        this.injuryNotes,
        this.fanDuelName,
        this.draftKingsName,
        this.yahooName,
        this.fantasyPositionDepthOrder,
        this.injuryPractice,
        this.injuryPracticeDescription,
        this.declaredInactive,
        this.upcomingFanDuelSalary,
        this.upcomingDraftKingsSalary,
        this.upcomingYahooSalary,
        this.teamID,
        this.globalTeamID,
        this.fantasyDraftPlayerID,
        this.fantasyDraftName,
        this.usaTodayPlayerID,
        this.usaTodayHeadshotUrl,
        this.usaTodayHeadshotNoBackgroundUrl,
        this.usaTodayHeadshotUpdated,
        this.usaTodayHeadshotNoBackgroundUpdated});

  PlayersModel.fromJson(Map<String, dynamic> json) {
    playerID = json['PlayerID'];
    team = json['Team'];
    number = json['Number'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    position = json['Position'];
    status = json['Status'];
    height = json['Height'];
    weight = json['Weight'];
    birthDate = json['BirthDate'];
    college = json['College'];
    experience = json['Experience'];
    fantasyPosition = json['FantasyPosition'];
    active = json['Active'];
    positionCategory = json['PositionCategory'];
    name = json['Name'];
    age = json['Age'];
    experienceString = json['ExperienceString'];
    birthDateString = json['BirthDateString'];
    photoUrl = json['PhotoUrl'];
    byeWeek = json['ByeWeek'];
    upcomingGameOpponent = json['UpcomingGameOpponent'];
    upcomingGameWeek = json['UpcomingGameWeek'];
    shortName = json['ShortName'];
    averageDraftPosition = json['AverageDraftPosition'];
    depthPositionCategory = json['DepthPositionCategory'];
    depthPosition = json['DepthPosition'];
    depthOrder = json['DepthOrder'];
    depthDisplayOrder = json['DepthDisplayOrder'];
    currentTeam = json['CurrentTeam'];
    collegeDraftTeam = json['CollegeDraftTeam'];
    collegeDraftYear = json['CollegeDraftYear'];
    collegeDraftRound = json['CollegeDraftRound'];
    collegeDraftPick = json['CollegeDraftPick'];
    isUndraftedFreeAgent = json['IsUndraftedFreeAgent'];
    heightFeet = json['HeightFeet'];
    heightInches = json['HeightInches'];
    upcomingOpponentRank = json['UpcomingOpponentRank'];
    upcomingOpponentPositionRank = json['UpcomingOpponentPositionRank'];
    currentStatus = json['CurrentStatus'];
    upcomingSalary = json['UpcomingSalary'];
    fantasyAlarmPlayerID = json['FantasyAlarmPlayerID'];
    sportRadarPlayerID = json['SportRadarPlayerID'];
    rotoworldPlayerID = json['RotoworldPlayerID'];
    rotoWirePlayerID = json['RotoWirePlayerID'];
    statsPlayerID = json['StatsPlayerID'];
    sportsDirectPlayerID = json['SportsDirectPlayerID'];
    xmlTeamPlayerID = json['XmlTeamPlayerID'];
    fanDuelPlayerID = json['FanDuelPlayerID'];
    draftKingsPlayerID = json['DraftKingsPlayerID'];
    yahooPlayerID = json['YahooPlayerID'];
    injuryStatus = json['InjuryStatus'];
    injuryBodyPart = json['InjuryBodyPart'];
    injuryStartDate = json['InjuryStartDate'];
    injuryNotes = json['InjuryNotes'];
    fanDuelName = json['FanDuelName'];
    draftKingsName = json['DraftKingsName'];
    yahooName = json['YahooName'];
    fantasyPositionDepthOrder = json['FantasyPositionDepthOrder'];
    injuryPractice = json['InjuryPractice'];
    injuryPracticeDescription = json['InjuryPracticeDescription'];
    declaredInactive = json['DeclaredInactive'];
    upcomingFanDuelSalary = json['UpcomingFanDuelSalary'];
    upcomingDraftKingsSalary = json['UpcomingDraftKingsSalary'];
    upcomingYahooSalary = json['UpcomingYahooSalary'];
    teamID = json['TeamID'];
    globalTeamID = json['GlobalTeamID'];
    fantasyDraftPlayerID = json['FantasyDraftPlayerID'];
    fantasyDraftName = json['FantasyDraftName'];
    usaTodayPlayerID = json['UsaTodayPlayerID'];
    usaTodayHeadshotUrl = json['UsaTodayHeadshotUrl'];
    usaTodayHeadshotNoBackgroundUrl = json['UsaTodayHeadshotNoBackgroundUrl'];
    usaTodayHeadshotUpdated = json['UsaTodayHeadshotUpdated'];
    usaTodayHeadshotNoBackgroundUpdated =
    json['UsaTodayHeadshotNoBackgroundUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlayerID'] = this.playerID;
    data['Team'] = this.team;
    data['Number'] = this.number;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Position'] = this.position;
    data['Status'] = this.status;
    data['Height'] = this.height;
    data['Weight'] = this.weight;
    data['BirthDate'] = this.birthDate;
    data['College'] = this.college;
    data['Experience'] = this.experience;
    data['FantasyPosition'] = this.fantasyPosition;
    data['Active'] = this.active;
    data['PositionCategory'] = this.positionCategory;
    data['Name'] = this.name;
    data['Age'] = this.age;
    data['ExperienceString'] = this.experienceString;
    data['BirthDateString'] = this.birthDateString;
    data['PhotoUrl'] = this.photoUrl;
    data['ByeWeek'] = this.byeWeek;
    data['UpcomingGameOpponent'] = this.upcomingGameOpponent;
    data['UpcomingGameWeek'] = this.upcomingGameWeek;
    data['ShortName'] = this.shortName;
    data['AverageDraftPosition'] = this.averageDraftPosition;
    data['DepthPositionCategory'] = this.depthPositionCategory;
    data['DepthPosition'] = this.depthPosition;
    data['DepthOrder'] = this.depthOrder;
    data['DepthDisplayOrder'] = this.depthDisplayOrder;
    data['CurrentTeam'] = this.currentTeam;
    data['CollegeDraftTeam'] = this.collegeDraftTeam;
    data['CollegeDraftYear'] = this.collegeDraftYear;
    data['CollegeDraftRound'] = this.collegeDraftRound;
    data['CollegeDraftPick'] = this.collegeDraftPick;
    data['IsUndraftedFreeAgent'] = this.isUndraftedFreeAgent;
    data['HeightFeet'] = this.heightFeet;
    data['HeightInches'] = this.heightInches;
    data['UpcomingOpponentRank'] = this.upcomingOpponentRank;
    data['UpcomingOpponentPositionRank'] = this.upcomingOpponentPositionRank;
    data['CurrentStatus'] = this.currentStatus;
    data['UpcomingSalary'] = this.upcomingSalary;
    data['FantasyAlarmPlayerID'] = this.fantasyAlarmPlayerID;
    data['SportRadarPlayerID'] = this.sportRadarPlayerID;
    data['RotoworldPlayerID'] = this.rotoworldPlayerID;
    data['RotoWirePlayerID'] = this.rotoWirePlayerID;
    data['StatsPlayerID'] = this.statsPlayerID;
    data['SportsDirectPlayerID'] = this.sportsDirectPlayerID;
    data['XmlTeamPlayerID'] = this.xmlTeamPlayerID;
    data['FanDuelPlayerID'] = this.fanDuelPlayerID;
    data['DraftKingsPlayerID'] = this.draftKingsPlayerID;
    data['YahooPlayerID'] = this.yahooPlayerID;
    data['InjuryStatus'] = this.injuryStatus;
    data['InjuryBodyPart'] = this.injuryBodyPart;
    data['InjuryStartDate'] = this.injuryStartDate;
    data['InjuryNotes'] = this.injuryNotes;
    data['FanDuelName'] = this.fanDuelName;
    data['DraftKingsName'] = this.draftKingsName;
    data['YahooName'] = this.yahooName;
    data['FantasyPositionDepthOrder'] = this.fantasyPositionDepthOrder;
    data['InjuryPractice'] = this.injuryPractice;
    data['InjuryPracticeDescription'] = this.injuryPracticeDescription;
    data['DeclaredInactive'] = this.declaredInactive;
    data['UpcomingFanDuelSalary'] = this.upcomingFanDuelSalary;
    data['UpcomingDraftKingsSalary'] = this.upcomingDraftKingsSalary;
    data['UpcomingYahooSalary'] = this.upcomingYahooSalary;
    data['TeamID'] = this.teamID;
    data['GlobalTeamID'] = this.globalTeamID;
    data['FantasyDraftPlayerID'] = this.fantasyDraftPlayerID;
    data['FantasyDraftName'] = this.fantasyDraftName;
    data['UsaTodayPlayerID'] = this.usaTodayPlayerID;
    data['UsaTodayHeadshotUrl'] = this.usaTodayHeadshotUrl;
    data['UsaTodayHeadshotNoBackgroundUrl'] =
        this.usaTodayHeadshotNoBackgroundUrl;
    data['UsaTodayHeadshotUpdated'] = this.usaTodayHeadshotUpdated;
    data['UsaTodayHeadshotNoBackgroundUpdated'] =
        this.usaTodayHeadshotNoBackgroundUpdated;
    return data;
  }
}