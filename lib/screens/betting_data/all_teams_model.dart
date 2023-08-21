class AllTeamsModel {
  String? key;
  int? teamID;
  int? playerID;
  String? city;
  String? name;
  String? conference;
  String? division;
  String? fullName;
  int? stadiumID;
  var byeWeek;
  var averageDraftPosition;
  var averageDraftPositionPPR;
  String? headCoach;
  String? offensiveCoordinator;
  String? defensiveCoordinator;
  String? specialTeamsCoach;
  String? offensiveScheme;
  String? defensiveScheme;
  var upcomingSalary;
  String? upcomingOpponent;
  int? upcomingOpponentRank;
  int? upcomingOpponentPositionRank;
  var upcomingFanDuelSalary;
  var upcomingDraftKingsSalary;
  var upcomingYahooSalary;
  String? primaryColor;
  String? secondaryColor;
  String? tertiaryColor;
  String? quaternaryColor;
  String? wikipediaLogoUrl;
  String? wikipediaWordMarkUrl;
  int? globalTeamID;
  String? draftKingsName;
  int? draftKingsPlayerID;
  String? fanDuelName;
  int? fanDuelPlayerID;
  String? fantasyDraftName;
  int? fantasyDraftPlayerID;
  String? yahooName;
  int? yahooPlayerID;
  var averageDraftPosition2QB;
  var averageDraftPositionDynasty;
  StadiumDetails? stadiumDetails;

  AllTeamsModel(
      {this.key,
        this.teamID,
        this.playerID,
        this.city,
        this.name,
        this.conference,
        this.division,
        this.fullName,
        this.stadiumID,
        this.byeWeek,
        this.averageDraftPosition,
        this.averageDraftPositionPPR,
        this.headCoach,
        this.offensiveCoordinator,
        this.defensiveCoordinator,
        this.specialTeamsCoach,
        this.offensiveScheme,
        this.defensiveScheme,
        this.upcomingSalary,
        this.upcomingOpponent,
        this.upcomingOpponentRank,
        this.upcomingOpponentPositionRank,
        this.upcomingFanDuelSalary,
        this.upcomingDraftKingsSalary,
        this.upcomingYahooSalary,
        this.primaryColor,
        this.secondaryColor,
        this.tertiaryColor,
        this.quaternaryColor,
        this.wikipediaLogoUrl,
        this.wikipediaWordMarkUrl,
        this.globalTeamID,
        this.draftKingsName,
        this.draftKingsPlayerID,
        this.fanDuelName,
        this.fanDuelPlayerID,
        this.fantasyDraftName,
        this.fantasyDraftPlayerID,
        this.yahooName,
        this.yahooPlayerID,
        this.averageDraftPosition2QB,
        this.averageDraftPositionDynasty,
        this.stadiumDetails});

  AllTeamsModel.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    teamID = json['TeamID'];
    playerID = json['PlayerID'];
    city = json['City'];
    name = json['Name'];
    conference = json['Conference'];
    division = json['Division'];
    fullName = json['FullName'];
    stadiumID = json['StadiumID'];
    byeWeek = json['ByeWeek'];
    averageDraftPosition = json['AverageDraftPosition'];
    averageDraftPositionPPR = json['AverageDraftPositionPPR'];
    headCoach = json['HeadCoach'];
    offensiveCoordinator = json['OffensiveCoordinator'];
    defensiveCoordinator = json['DefensiveCoordinator'];
    specialTeamsCoach = json['SpecialTeamsCoach'];
    offensiveScheme = json['OffensiveScheme'];
    defensiveScheme = json['DefensiveScheme'];
    upcomingSalary = json['UpcomingSalary'];
    upcomingOpponent = json['UpcomingOpponent'];
    upcomingOpponentRank = json['UpcomingOpponentRank'];
    upcomingOpponentPositionRank = json['UpcomingOpponentPositionRank'];
    upcomingFanDuelSalary = json['UpcomingFanDuelSalary'];
    upcomingDraftKingsSalary = json['UpcomingDraftKingsSalary'];
    upcomingYahooSalary = json['UpcomingYahooSalary'];
    primaryColor = json['PrimaryColor'];
    secondaryColor = json['SecondaryColor'];
    tertiaryColor = json['TertiaryColor'];
    quaternaryColor = json['QuaternaryColor'];
    wikipediaLogoUrl = json['WikipediaLogoUrl'];
    wikipediaWordMarkUrl = json['WikipediaWordMarkUrl'];
    globalTeamID = json['GlobalTeamID'];
    draftKingsName = json['DraftKingsName'];
    draftKingsPlayerID = json['DraftKingsPlayerID'];
    fanDuelName = json['FanDuelName'];
    fanDuelPlayerID = json['FanDuelPlayerID'];
    fantasyDraftName = json['FantasyDraftName'];
    fantasyDraftPlayerID = json['FantasyDraftPlayerID'];
    yahooName = json['YahooName'];
    yahooPlayerID = json['YahooPlayerID'];
    averageDraftPosition2QB = json['AverageDraftPosition2QB'];
    averageDraftPositionDynasty = json['AverageDraftPositionDynasty'];
    stadiumDetails = json['StadiumDetails'] != null
        ? new StadiumDetails.fromJson(json['StadiumDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Key'] = this.key;
    data['TeamID'] = this.teamID;
    data['PlayerID'] = this.playerID;
    data['City'] = this.city;
    data['Name'] = this.name;
    data['Conference'] = this.conference;
    data['Division'] = this.division;
    data['FullName'] = this.fullName;
    data['StadiumID'] = this.stadiumID;
    data['ByeWeek'] = this.byeWeek;
    data['AverageDraftPosition'] = this.averageDraftPosition;
    data['AverageDraftPositionPPR'] = this.averageDraftPositionPPR;
    data['HeadCoach'] = this.headCoach;
    data['OffensiveCoordinator'] = this.offensiveCoordinator;
    data['DefensiveCoordinator'] = this.defensiveCoordinator;
    data['SpecialTeamsCoach'] = this.specialTeamsCoach;
    data['OffensiveScheme'] = this.offensiveScheme;
    data['DefensiveScheme'] = this.defensiveScheme;
    data['UpcomingSalary'] = this.upcomingSalary;
    data['UpcomingOpponent'] = this.upcomingOpponent;
    data['UpcomingOpponentRank'] = this.upcomingOpponentRank;
    data['UpcomingOpponentPositionRank'] = this.upcomingOpponentPositionRank;
    data['UpcomingFanDuelSalary'] = this.upcomingFanDuelSalary;
    data['UpcomingDraftKingsSalary'] = this.upcomingDraftKingsSalary;
    data['UpcomingYahooSalary'] = this.upcomingYahooSalary;
    data['PrimaryColor'] = this.primaryColor;
    data['SecondaryColor'] = this.secondaryColor;
    data['TertiaryColor'] = this.tertiaryColor;
    data['QuaternaryColor'] = this.quaternaryColor;
    data['WikipediaLogoUrl'] = this.wikipediaLogoUrl;
    data['WikipediaWordMarkUrl'] = this.wikipediaWordMarkUrl;
    data['GlobalTeamID'] = this.globalTeamID;
    data['DraftKingsName'] = this.draftKingsName;
    data['DraftKingsPlayerID'] = this.draftKingsPlayerID;
    data['FanDuelName'] = this.fanDuelName;
    data['FanDuelPlayerID'] = this.fanDuelPlayerID;
    data['FantasyDraftName'] = this.fantasyDraftName;
    data['FantasyDraftPlayerID'] = this.fantasyDraftPlayerID;
    data['YahooName'] = this.yahooName;
    data['YahooPlayerID'] = this.yahooPlayerID;
    data['AverageDraftPosition2QB'] = this.averageDraftPosition2QB;
    data['AverageDraftPositionDynasty'] = this.averageDraftPositionDynasty;
    if (this.stadiumDetails != null) {
      data['StadiumDetails'] = this.stadiumDetails!.toJson();
    }
    return data;
  }
}

class StadiumDetails {
  int? stadiumID;
  String? name;
  String? city;
  String? state;
  String? country;
  int? capacity;
  String? playingSurface;
  double? geoLat;
  double? geoLong;
  String? type;

  StadiumDetails(
      {this.stadiumID,
        this.name,
        this.city,
        this.state,
        this.country,
        this.capacity,
        this.playingSurface,
        this.geoLat,
        this.geoLong,
        this.type});

  StadiumDetails.fromJson(Map<String, dynamic> json) {
    stadiumID = json['StadiumID'];
    name = json['Name'];
    city = json['City'];
    state = json['State'];
    country = json['Country'];
    capacity = json['Capacity'];
    playingSurface = json['PlayingSurface'];
    geoLat = json['GeoLat'];
    geoLong = json['GeoLong'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StadiumID'] = this.stadiumID;
    data['Name'] = this.name;
    data['City'] = this.city;
    data['State'] = this.state;
    data['Country'] = this.country;
    data['Capacity'] = this.capacity;
    data['PlayingSurface'] = this.playingSurface;
    data['GeoLat'] = this.geoLat;
    data['GeoLong'] = this.geoLong;
    data['Type'] = this.type;
    return data;
  }
}