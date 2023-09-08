import 'dart:convert';

import 'package:anni_ai/screens/betting_detail/player_props_model.dart';
import 'package:anni_ai/screens/betting_detail/players_model.dart';
import 'package:flutter/cupertino.dart';

import '../../apis/api_controller.dart';
import '../betting_data/all_teams_model.dart';

class BettingDetailVm {

  var index = 1;
  var isLoading = true;
  List<PlayerPropsByWeekModel> playersPropsData = [];

  Future<void> getPlayerPropsData(BuildContext context, String week) async {
    playersPropsData.clear();
    allTeams.clear();
    String res = await thirdPartyMethod("GET",
        "https://api.sportsdata.io/v3/nfl/odds/json/PlayerPropsByWeek/2023/$week?key=cfa3031cc89a4ea8a9ee358c43f3ca39",
        null, null, context);

    var response = await jsonDecode(res);

    List<dynamic> list = [];
    list.addAll(response);

    for (var i = 0; i < list.length; i++) {
      PlayerPropsByWeekModel bettingDataNew = PlayerPropsByWeekModel.fromJson(list[i]);
      playersPropsData.add(bettingDataNew);
    }

  }

  Future<void> getTeams(BuildContext context) async {
    String res = await thirdPartyMethod("GET",
        "https://api.sportsdata.io/v3/nfl/scores/json/Teams/2022?key=cfa3031cc89a4ea8a9ee358c43f3ca39",
        null, null, context);

    var response = await jsonDecode(res);

    List<dynamic> list = [];
    list.addAll(response);

    for (var i = 0; i < list.length; i++) {
      AllTeamsModel allTeamsData = AllTeamsModel.fromJson(list[i]);
      allTeams.add(allTeamsData);
    }
    // BettingDataModel bettingDataNew = BettingDataModel.fromJson(response);

    for (var k = 0; k < playersPropsData.length; k++) {

      for (var j = 0; j < allTeams.length; j++) {
        if (playersPropsData[k].team.toString() == allTeams[j].key.toString()) {
          playersPropsData[k].teamImg = allTeams[j].wikipediaLogoUrl.toString();
        }
      }
    }
  }

  Future<void> getPlayers(BuildContext context) async {
    String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/scores/json/Players?key=cfa3031cc89a4ea8a9ee358c43f3ca39",
        null, null, context);

    var response = await jsonDecode(res);

    List<dynamic> list = [];
    list.addAll(response);

    for (var i = 0; i < list.length; i++) {
      PlayersModel allPlayersData = PlayersModel.fromJson(list[i]);
      allPlayers.add(allPlayersData);
    }

    for (var k = 0; k < playersPropsData.length; k++) {

      for (var j = 0; j < allPlayers.length; j++) {
        if (playersPropsData[k].playerID.toString() == allPlayers[j].playerID.toString()) {
          playersPropsData[k].playerImg = allPlayers[j].photoUrl.toString();
        }
      }
    }

    isLoading = false;
  }


}