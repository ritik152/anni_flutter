import 'dart:convert';

import 'package:anni_ai/screens/player_data/ownership_data_model.dart';
import 'package:anni_ai/screens/player_data/player_data_model.dart';
import 'package:anni_ai/screens/player_data/player_news_model.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/material.dart';

import '../../apis/api_controller.dart';
import '../../utils/all_keys.dart';

class PlayerDataVm {
  var overview = true;
  var table = false;
  var graph = false;
  var roster = false;
  var career = false;
  var teamId = "";
  String teamCard = "assets/teams_theme/cowboys.png";
  PlayerDataModel allTeamsData = PlayerDataModel();

  List<OwnershipDataModel> ownershipModelList = [];
  List<PlayerNewsModel> playerNewsModel = [];

  Future<void> playerDetail(
      BuildContext context, String playerId, String keys) async {
    String res = await thirdPartyMethod(
        "GET",
        "https://api.sportsdata.io/v3/nfl/scores/json/Player/$playerId?key=${AllKeys.sportsKey}",
        null,
        null,
        context);

    var response = await jsonDecode(res);

    allTeamsData = PlayerDataModel.fromJson(response);
    for (var j = 0; j < allTeams.length; j++) {

      if (keys.toString() == allTeams[j].key.toString()) {
        allTeamsData.teamImg = allTeams[j].wikipediaLogoUrl.toString();
        allTeamsData.teamName = allTeams[j].name.toString();
        teamId = allTeams[j].teamID.toString();
        print("Team Id === ${allTeams[j].teamID.toString()}");

        if (allTeams[j].name.toString() == "Cowboys") {
          teamCard = "assets/teams_theme/cowboys.png";
        }
        else if (allTeams[j].name.toString() == "Vikings") {
          teamCard = "assets/teams_theme/vikings.png";
        }
        else if (allTeams[j].name.toString() == "Giants") {
          teamCard = "assets/teams_theme/giants.png";
        }
        else if (allTeams[j].name.toString() == "Rams") {
          teamCard = "assets/teams_theme/rams.png";
        }
        else if (allTeams[j].name.toString() == "Packers") {
          teamCard = "assets/teams_theme/packers.png";
        }
        else if (allTeams[j].name.toString() == "Browns") {
          teamCard = "assets/teams_theme/browns.png";
        }
        else if (allTeams[j].name.toString() == "Cardinals") {
          teamCard = "assets/teams_theme/cardinals.png";
        }
        else if (allTeams[j].name.toString() == "Ravens") {
          teamCard = "assets/teams_theme/ravens.png";
        }
        else if (allTeams[j].name.toString() == "Bills") {
          teamCard = "assets/teams_theme/bills.png";
        }
        else if (allTeams[j].name.toString() == "Bengals") {
          teamCard = "assets/teams_theme/bengals.png";
        }
        else if (allTeams[j].name.toString() == "Bears") {
          teamCard = "assets/teams_theme/bears.png";
        }
        else if (allTeams[j].name.toString() == "Broncos") {
          teamCard = "assets/teams_theme/broncos.png";
        }
        else if (allTeams[j].name.toString() == "Lions") {
          teamCard = "assets/teams_theme/lions.png";
        }
        else if (allTeams[j].name.toString() == "Colts") {
          teamCard = "assets/teams_theme/colts.png";
        }
        else if (allTeams[j].name.toString() == "Jaguars") {
          teamCard = "assets/teams_theme/jaguars.png";
        }
        else if (allTeams[j].name.toString() == "Panthers") {
          teamCard = "assets/teams_theme/panthers.png";
        }
        else if (allTeams[j].name.toString() == "Chiefs") {
          teamCard = "assets/teams_theme/chiefs.png";
        }
        else if (allTeams[j].name.toString() == "Chargers") {
          teamCard = "assets/teams_theme/chargers.png";
        }
        else if (allTeams[j].name.toString() == "Dolphins") {
          teamCard = "assets/teams_theme/dolphins.png";
        }
        else if (allTeams[j].name.toString() == "Patriots") {
          teamCard = "assets/teams_theme/patriots.png";
        }
        else if (allTeams[j].name.toString() == "Texans") {
          teamCard = "assets/teams_theme/texans.png";
        }
        else if (allTeams[j].name.toString() == "Falcons") {
          teamCard = "assets/teams_theme/falcons.png";
        }
        else {
          print("No Image -------  ${allTeams[j].name}");
        }
      }

    }
  }

  Future<void> playerNews(BuildContext context, String playerId) async {
    String res = await thirdPartyMethod(
        "GET",
        "https://api.sportsdata.io/v3/nfl/scores/json/NewsByPlayerID/$playerId?key=${AllKeys.sportsKey}",
        null,
        null,
        context);

    var response = await jsonDecode(res);

    List<dynamic> list = [];
    list.addAll(response);

    for (var i = 0; i < list.length; i++) {
      PlayerNewsModel player = PlayerNewsModel.fromJson(list[i]);
      playerNewsModel.add(player);
    }
  }

  Future<void> ownershipDetail(BuildContext context) async {
    String res = await thirdPartyMethod(
        "GET",
        "https://api.sportsdata.io/v3/nfl/stats/json/PlayerOwnership/2023/1?key=${AllKeys.sportsKey}",
        null,
        null,
        context);

    var response = await jsonDecode(res);
    List<dynamic> list = [];
    list.addAll(response);

    for (var i = 0; i < list.length; i++) {
      OwnershipDataModel ownershipDataModel =
          OwnershipDataModel.fromJson(list[i]);
      ownershipModelList.add(ownershipDataModel);
    }

    for (var j = 0; j < ownershipModelList.length; j++) {
      if (allTeamsData.playerID.toString() ==
          ownershipModelList[j].playerID.toString()) {
        allTeamsData.rosted =
            ownershipModelList[j].ownershipPercentage.toString();
        allTeamsData.start = ownershipModelList[j].startPercentage.toString();
      }
    }

    hideLoader(context);
  }
}
