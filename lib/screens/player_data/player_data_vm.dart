import 'dart:convert';

import 'package:anni_ai/screens/player_data/overview/projection_model.dart';
import 'package:anni_ai/screens/player_data/ownership_data_model.dart';
import 'package:anni_ai/screens/player_data/player_data_model.dart';
import 'package:anni_ai/screens/player_data/player_news_model.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:anni_ai/utils/player_images.dart';
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
  var totalPoints = 0.0;
  late TabController tabController;
  String teamCard = "assets/teams_theme/cowboys.png";
  PlayerDataModel allTeamsData = PlayerDataModel();

  List<OwnershipDataModel> ownershipModelList = [];
  List<PlayerNewsModel> playerNewsModel = [];
  List<PlayerImages> playerImages = [];
  PlayerNewsModel playerNewsData = PlayerNewsModel();

  Future<void> playerDetail(BuildContext context, String playerId, String keys) async {
    String res = await thirdPartyMethod(
        "GET",
        "https://api.sportsdata.io/v3/nfl/scores/json/Player/$playerId?key=${AllKeys.sportsKey}",
        null,
        null,
        context);

    var response = await jsonDecode(res);

    allTeamsData = PlayerDataModel.fromJson(response);
    print("User Img = ${allTeamsData.photoUrl}");
    for (var j = 0; j < allTeams.length; j++) {

      if (keys.toString() == allTeams[j].key.toString()) {
        allTeamsData.teamImg = allTeams[j].wikipediaLogoUrl.toString();
        allTeamsData.teamName = (allTeams[j].name.toString() == "null")?"":allTeams[j].name.toString();
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

        else if (allTeams[j].name.toString() == "Saints") {
          teamCard = "assets/teams_theme/saints.png";
        }
        else if (allTeams[j].name.toString() == "Raiders") {
          teamCard = "assets/teams_theme/raiders.png";
        }
        else if (allTeams[j].name.toString() == "Chargers") {
          teamCard = "assets/teams_theme/chargers.png";
        }
        else if (allTeams[j].name.toString() == "Steelers") {
          teamCard = "assets/teams_theme/steelers.png";
        }
        else if (allTeams[j].name.toString() == "Jets") {
          teamCard = "assets/teams_theme/jets.png";
        }
        else if (allTeams[j].name.toString() == "Titans") {
          teamCard = "assets/teams_theme/titans.png";
        }
        else if (allTeams[j].name.toString() == "Buccaneers") {
          teamCard = "assets/teams_theme/bucaneers.png";
        }
        else if (allTeams[j].name.toString() == "Commanders") {
          teamCard = "assets/teams_theme/commanders.png";
        }
        else if (allTeams[j].name.toString() == "49ers") {
          teamCard = "assets/teams_theme/49ers.png";
        }
        else if (allTeams[j].name.toString() == "Seahawks") {
          teamCard = "assets/teams_theme/seahawks.png";
        }
        else if (allTeams[j].name.toString() == "Eagles") {
          teamCard = "assets/teams_theme/eagles.png";
        }
        else {
          print("No Image -------  ${allTeams[j].name}");
        }
      }

    }
  }

  Future<void> playerNews(BuildContext context, String playerId) async {
    String res = await getMethodWithQuery("GET", "getRotoworldPlayerNews?PlayerID=$playerId", null, context);

    var response = await jsonDecode(res);

    playerNewsData = PlayerNewsModel.fromJson(response);


  }

  Future<void> ownershipDetail(BuildContext context) async {
    String res = await thirdPartyMethod(
        "GET",
        "https://api.sportsdata.io/v3/nfl/stats/json/PlayerOwnership/$season/$week?key=${AllKeys.sportsKey}",
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


  }

  Future<void> getPlayerImage(BuildContext context) async {

    String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/headshots/json/Headshots?key=${AllKeys.sportsKey}", null, null, context);

    var response = jsonDecode(res);

    List<dynamic> list = [];

    list.addAll(response);

    for (var i = 0; i < list.length; i++) {

      PlayerImages allPlayersData = PlayerImages.fromJson(list[i]);

      playerImages.add(allPlayersData);

    }
      for (var j = 0; j < playerImages.length; j++) {
        if (allTeamsData.playerID.toString() == playerImages[j].playerID.toString()) {
          allTeamsData.photoUrl = playerImages[j].hostedHeadshotNoBackgroundUrl.toString();
        }
      }

  }

  Future<void> getProjections(BuildContext context, String playerName) async {

    for(var i = int.parse(week); i < 18 ; i++){

      String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/projections/json/IdpPlayerGameProjectionStatsByWeek/$season/$i?key=${AllKeys.sportsKey}", null, null, context);

      var response = jsonDecode(res);

      List<dynamic> list = [];

      list.addAll(response);

      for (var i = 0; i < list.length; i++) {

        ProjectionsModel allPlayersData = ProjectionsModel.fromJson(list[i]);
        if(allPlayersData.name.toString() == playerName.toString()){
          for (var j = 0; j < allTeams.length; j++) {
            if (allPlayersData.teamID.toString() == allTeams[j].teamID.toString()) {
              allPlayersData.photoUrl = allTeams[j].wikipediaLogoUrl.toString();
              allPlayersData.photoUrl = allTeams[j].wikipediaLogoUrl.toString();
            }
          }
          projectionsModel.add(allPlayersData);
        }

      }
    }

  }
}
