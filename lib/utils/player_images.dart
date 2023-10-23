class PlayerImages {
  int? playerID;
  String? name;
  var teamID;
  var teamImg;
  var team;
  String? position;
  String? preferredHostedHeadshotUrl;
  String? preferredHostedHeadshotUpdated;
  String? hostedHeadshotWithBackgroundUrl;
  String? hostedHeadshotWithBackgroundUpdated;
  String? hostedHeadshotNoBackgroundUrl;
  String? hostedHeadshotNoBackgroundUpdated;

  PlayerImages(
      {this.playerID,
        this.name,
        this.teamID,
        this.team,
        this.position,
        this.preferredHostedHeadshotUrl,
        this.preferredHostedHeadshotUpdated,
        this.hostedHeadshotWithBackgroundUrl,
        this.hostedHeadshotWithBackgroundUpdated,
        this.hostedHeadshotNoBackgroundUrl,
        this.hostedHeadshotNoBackgroundUpdated});

  PlayerImages.fromJson(Map<String, dynamic> json) {
    playerID = json['PlayerID'];
    name = json['Name'];
    teamID = json['TeamID'];
    team = json['Team'];
    position = json['Position'];
    preferredHostedHeadshotUrl = json['PreferredHostedHeadshotUrl'];
    preferredHostedHeadshotUpdated = json['PreferredHostedHeadshotUpdated'];
    hostedHeadshotWithBackgroundUrl = json['HostedHeadshotWithBackgroundUrl'];
    hostedHeadshotWithBackgroundUpdated =
    json['HostedHeadshotWithBackgroundUpdated'];
    hostedHeadshotNoBackgroundUrl = json['HostedHeadshotNoBackgroundUrl'];
    hostedHeadshotNoBackgroundUpdated =
    json['HostedHeadshotNoBackgroundUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlayerID'] = this.playerID;
    data['Name'] = this.name;
    data['TeamID'] = this.teamID;
    data['Team'] = this.team;
    data['Position'] = this.position;
    data['PreferredHostedHeadshotUrl'] = this.preferredHostedHeadshotUrl;
    data['PreferredHostedHeadshotUpdated'] =
        this.preferredHostedHeadshotUpdated;
    data['HostedHeadshotWithBackgroundUrl'] =
        this.hostedHeadshotWithBackgroundUrl;
    data['HostedHeadshotWithBackgroundUpdated'] =
        this.hostedHeadshotWithBackgroundUpdated;
    data['HostedHeadshotNoBackgroundUrl'] = this.hostedHeadshotNoBackgroundUrl;
    data['HostedHeadshotNoBackgroundUpdated'] =
        this.hostedHeadshotNoBackgroundUpdated;
    return data;
  }
}