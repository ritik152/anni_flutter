class CareerModel {
  var success;
  var code;
  String? message;
  List<Body>? body;

  CareerModel({this.success, this.code, this.message, this.body});

  CareerModel.fromJson(Map<String, dynamic> json) {
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
  var year;
  Rushing? rushing;
  Receiving? receiving;
  Passing? passing;
  ComparingData? comparingData;

  Body(
      {this.year,
        this.rushing,
        this.receiving,
        this.passing,
        this.comparingData});

  Body.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    rushing =
    json['rushing'] != null ? new Rushing.fromJson(json['rushing']) : null;
    receiving = json['receiving'] != null
        ? new Receiving.fromJson(json['receiving'])
        : null;
    passing =
    json['passing'] != null ? new Passing.fromJson(json['passing']) : null;
    comparingData = json['comparingData'] != null
        ? new ComparingData.fromJson(json['comparingData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    if (this.rushing != null) {
      data['rushing'] = this.rushing!.toJson();
    }
    if (this.receiving != null) {
      data['receiving'] = this.receiving!.toJson();
    }
    if (this.passing != null) {
      data['passing'] = this.passing!.toJson();
    }
    if (this.comparingData != null) {
      data['comparingData'] = this.comparingData!.toJson();
    }
    return data;
  }
}

class Rushing {
  var rushingAttempts;
  var rushingYards;
  var rushingYardsPerAttempt;
  var rushingTouchdowns;

  var colourRushingAttempts;
  var colourRushingYards;
  var colourRushingYardsPerAttempt;
  var colourRushingTouchdowns;

  Rushing(
      {this.rushingAttempts,
        this.rushingYards,
        this.rushingYardsPerAttempt,
        this.rushingTouchdowns});

  Rushing.fromJson(Map<String, dynamic> json) {
    rushingAttempts = json['RushingAttempts'];
    rushingYards = json['RushingYards'];
    rushingYardsPerAttempt = json['RushingYardsPerAttempt'];
    rushingTouchdowns = json['RushingTouchdowns'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RushingAttempts'] = this.rushingAttempts;
    data['RushingYards'] = this.rushingYards;
    data['RushingYardsPerAttempt'] = this.rushingYardsPerAttempt;
    data['RushingTouchdowns'] = this.rushingTouchdowns;
    return data;
  }
}

class Receiving {
  var receivingTargets;
  var receptions;
  var receivingYards;
  var receivingYardsPerReception;
  var receivingTouchdowns;

  var receivingTargetsC;
  var receptionsC;
  var receivingYardsC;
  var receivingYardsPerReceptionC;
  var receivingTouchdownsC;


  Receiving(
      {this.receivingTargets,
        this.receptions,
        this.receivingYards,
        this.receivingYardsPerReception,
        this.receivingTouchdowns});

  Receiving.fromJson(Map<String, dynamic> json) {
    receivingTargets = json['ReceivingTargets'];
    receptions = json['Receptions'];
    receivingYards = json['ReceivingYards'];
    receivingYardsPerReception = json['ReceivingYardsPerReception'];
    receivingTouchdowns = json['ReceivingTouchdowns'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ReceivingTargets'] = this.receivingTargets;
    data['Receptions'] = this.receptions;
    data['ReceivingYards'] = this.receivingYards;
    data['ReceivingYardsPerReception'] = this.receivingYardsPerReception;
    data['ReceivingTouchdowns'] = this.receivingTouchdowns;
    return data;
  }
}

class Passing {
  var passingAttempts;
  var passingCompletions;
  var passingYards;
  var passingTouchdowns;
  var passingInterceptions;

  var passingAttemptsC;
  var passingCompletionsC;
  var passingYardsC;
  var passingTouchdownsC;
  var passingInterceptionsC;


  Passing(
      {this.passingAttempts,
        this.passingCompletions,
        this.passingYards,
        this.passingTouchdowns,
        this.passingInterceptions});

  Passing.fromJson(Map<String, dynamic> json) {
    passingAttempts = json['PassingAttempts'];
    passingCompletions = json['PassingCompletions'];
    passingYards = json['PassingYards'];
    passingTouchdowns = json['PassingTouchdowns'];
    passingInterceptions = json['PassingInterceptions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PassingAttempts'] = this.passingAttempts;
    data['PassingCompletions'] = this.passingCompletions;
    data['PassingYards'] = this.passingYards;
    data['PassingTouchdowns'] = this.passingTouchdowns;
    data['PassingInterceptions'] = this.passingInterceptions;
    return data;
  }
}

class ComparingData {
  var passingAttempts;
  var passingCompletions;
  var passingYards;
  var passingTouchdowns;
  var passingInterceptions;
  var receivingTargets;
  var receptions;
  var receivingYards;
  var receivingYardsPerReception;
  var receivingTouchdowns;
  var rushingAttempts;
  var rushingYards;
  var rushingYardsPerAttempt;
  var rushingTouchdowns;

  ComparingData(
      {this.passingAttempts,
        this.passingCompletions,
        this.passingYards,
        this.passingTouchdowns,
        this.passingInterceptions,
        this.receivingTargets,
        this.receptions,
        this.receivingYards,
        this.receivingYardsPerReception,
        this.receivingTouchdowns,
        this.rushingAttempts,
        this.rushingYards,
        this.rushingYardsPerAttempt,
        this.rushingTouchdowns});

  ComparingData.fromJson(Map<String, dynamic> json) {
    passingAttempts = json['PassingAttempts'];
    passingCompletions = json['PassingCompletions'];
    passingYards = json['PassingYards'];
    passingTouchdowns = json['PassingTouchdowns'];
    passingInterceptions = json['PassingInterceptions'];
    receivingTargets = json['ReceivingTargets'];
    receptions = json['Receptions'];
    receivingYards = json['ReceivingYards'];
    receivingYardsPerReception = json['ReceivingYardsPerReception'];
    receivingTouchdowns = json['ReceivingTouchdowns'];
    rushingAttempts = json['RushingAttempts'];
    rushingYards = json['RushingYards'];
    rushingYardsPerAttempt = json['RushingYardsPerAttempt'];
    rushingTouchdowns = json['RushingTouchdowns'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PassingAttempts'] = this.passingAttempts;
    data['PassingCompletions'] = this.passingCompletions;
    data['PassingYards'] = this.passingYards;
    data['PassingTouchdowns'] = this.passingTouchdowns;
    data['PassingInterceptions'] = this.passingInterceptions;
    data['ReceivingTargets'] = this.receivingTargets;
    data['Receptions'] = this.receptions;
    data['ReceivingYards'] = this.receivingYards;
    data['ReceivingYardsPerReception'] = this.receivingYardsPerReception;
    data['ReceivingTouchdowns'] = this.receivingTouchdowns;
    data['RushingAttempts'] = this.rushingAttempts;
    data['RushingYards'] = this.rushingYards;
    data['RushingYardsPerAttempt'] = this.rushingYardsPerAttempt;
    data['RushingTouchdowns'] = this.rushingTouchdowns;
    return data;
  }
}