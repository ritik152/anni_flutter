import 'dart:convert';

import 'package:anni_ai/screens/player_data/ownership_data_model.dart';
import 'package:anni_ai/screens/player_data/player_data_model.dart';
import 'package:anni_ai/screens/player_data/player_news_model.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/material.dart';

import '../../apis/api_controller.dart';

class PlayerDataVm {

  var overview = true;
  var table = false;
  var graph = false;
  var roster = false;
  var career = false;
  PlayerDataModel allTeamsData = PlayerDataModel();

  List<OwnershipDataModel> ownershipModelList = [];
  List<PlayerNewsModel> playerNewsModel = [];

  Future<void> playerDetail(BuildContext context, String playerId) async {
    String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/scores/json/Player/$playerId?key=cfa3031cc89a4ea8a9ee358c43f3ca39",
        null, null, context);

    var response = await jsonDecode(res);

      allTeamsData = PlayerDataModel.fromJson(response);
    for (var j = 0; j < allTeams.length; j++) {
      if (allTeamsData.team.toString() == allTeams[j].key.toString()) {
        allTeamsData.teamImg = allTeams[j].wikipediaLogoUrl.toString();
        allTeamsData.teamName = allTeams[j].name.toString();
      }
    }


  }

  Future<void> playerNews(BuildContext context, String playerId) async {
    String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/scores/json/NewsByPlayerID/$playerId?key=cfa3031cc89a4ea8a9ee358c43f3ca39",
        null, null, context);

    var response = await jsonDecode(res);
    List<dynamic> list = [];
    list.addAll(response);

    for (var i = 0; i < list.length; i++) {
      PlayerNewsModel player = PlayerNewsModel.fromJson(list[i]);
      playerNewsModel.add(player);
    }


  }

  Future<void> ownershipDetail(BuildContext context) async {
    String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/stats/json/PlayerOwnership/2023/1?key=cfa3031cc89a4ea8a9ee358c43f3ca39",
        null, null, context);

    var response = await jsonDecode(res);
    List<dynamic> list = [];
    list.addAll(response);

    for (var i = 0; i < list.length; i++) {
      OwnershipDataModel ownershipDataModel = OwnershipDataModel.fromJson(list[i]);
      ownershipModelList.add(ownershipDataModel);
    }

    for (var j = 0; j < ownershipModelList.length; j++) {
      if (allTeamsData.playerID.toString() == ownershipModelList[j].playerID.toString()) {
        allTeamsData.rosted = ownershipModelList[j].ownershipPercentage.toString();
        allTeamsData.start = ownershipModelList[j].startPercentage.toString();
      }
    }

      hideLoader(context);
  }
}