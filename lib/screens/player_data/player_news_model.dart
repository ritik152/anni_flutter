class PlayerNewsModel {
  var newsID;
  String? source;
  String? updated;
  String? timeAgo;
  String? title;
  String? content;
  String? url;
  String? termsOfUse;
  String? author;
  String? categories;
  var playerID;
  var teamID;
  String? team;
  var playerID2;
  var teamID2;
  var team2;
  String? originalSource;
  String? originalSourceUrl;

  PlayerNewsModel(
      {this.newsID,
        this.source,
        this.updated,
        this.timeAgo,
        this.title,
        this.content,
        this.url,
        this.termsOfUse,
        this.author,
        this.categories,
        this.playerID,
        this.teamID,
        this.team,
        this.playerID2,
        this.teamID2,
        this.team2,
        this.originalSource,
        this.originalSourceUrl});

  PlayerNewsModel.fromJson(Map<String, dynamic> json) {
    newsID = json['NewsID'];
    source = json['Source'];
    updated = json['Updated'];
    timeAgo = json['TimeAgo'];
    title = json['Title'];
    content = json['Content'];
    url = json['Url'];
    termsOfUse = json['TermsOfUse'];
    author = json['Author'];
    categories = json['Categories'];
    playerID = json['PlayerID'];
    teamID = json['TeamID'];
    team = json['Team'];
    playerID2 = json['PlayerID2'];
    teamID2 = json['TeamID2'];
    team2 = json['Team2'];
    originalSource = json['OriginalSource'];
    originalSourceUrl = json['OriginalSourceUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NewsID'] = this.newsID;
    data['Source'] = this.source;
    data['Updated'] = this.updated;
    data['TimeAgo'] = this.timeAgo;
    data['Title'] = this.title;
    data['Content'] = this.content;
    data['Url'] = this.url;
    data['TermsOfUse'] = this.termsOfUse;
    data['Author'] = this.author;
    data['Categories'] = this.categories;
    data['PlayerID'] = this.playerID;
    data['TeamID'] = this.teamID;
    data['Team'] = this.team;
    data['PlayerID2'] = this.playerID2;
    data['TeamID2'] = this.teamID2;
    data['Team2'] = this.team2;
    data['OriginalSource'] = this.originalSource;
    data['OriginalSourceUrl'] = this.originalSourceUrl;
    return data;
  }
}