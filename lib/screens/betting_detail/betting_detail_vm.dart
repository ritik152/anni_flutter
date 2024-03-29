import 'dart:convert';

import 'package:anni_ai/screens/betting_detail/player_props_model.dart';
import 'package:anni_ai/screens/betting_detail/players_model.dart';
import 'package:anni_ai/screens/betting_detail/team_and_player_props_model.dart';
import 'package:flutter/cupertino.dart';

import '../../apis/api_controller.dart';
import '../../utils/all_keys.dart';
import '../betting_data/all_teams_model.dart';

class BettingDetailVm {

  final ScrollController controller = ScrollController();
  var index = 1;
  var isLoading = true;
  List<TeamAndPlayerPropsModel> teamPropsData = [];
  List<TeamAndPlayerPropsModel> playersPropsData = [];
  List<TeamAndPlayerPropsModel> gamePropsData = [];
  List<String> over = [];
  List<String> under = [];

  Future<void> getPlayerPropsData(BuildContext context, String scoreId) async {
    teamPropsData.clear();
    String res = await thirdPartyMethod("GET",
        "https://api.sportsdata.io/v3/nfl/odds/json/BettingMarketsByScoreID/$scoreId?key=${AllKeys.sportsKey}",
        null, null, context);

    var response = await jsonDecode(res);

    List<dynamic> list = [];
    list.addAll(response);

    for (var i = 0; i < list.length; i++) {
      TeamAndPlayerPropsModel bettingDataNew = TeamAndPlayerPropsModel.fromJson(list[i]);

      if(bettingDataNew.bettingMarketType.toString() == "Team Prop"){

        for(var j = 0; j < bettingDataNew.bettingOutcomes!.length; j++){
          if(bettingDataNew.bettingOutcomes![j].sportsBook!.sportsbookID.toString() == "8"){
            if(bettingDataNew.bettingOutcomes![j].bettingOutcomeType.toString() == "Over"){
              bettingDataNew.over =bettingDataNew.bettingOutcomes![j].value.toString();
            }
            if(bettingDataNew.bettingOutcomes![j].bettingOutcomeType.toString() == "Under"){
              bettingDataNew.under = bettingDataNew.bettingOutcomes![j].value.toString();
            }

            teamPropsData.add(bettingDataNew);

          }

        }


      }

      if(bettingDataNew.bettingMarketType.toString() == "Player Prop"){

        for(var j = 0; j < bettingDataNew.bettingOutcomes!.length; j++){

          if(bettingDataNew.bettingOutcomes![j].sportsBook!.sportsbookID.toString() == "8"){
            if(bettingDataNew.bettingOutcomes![j].bettingOutcomeType.toString() == "Over"){
              bettingDataNew.over =bettingDataNew.bettingOutcomes![j].value.toString();
              print("QWERT  Player Name ${bettingDataNew.playerName.toString()} - ${bettingDataNew.bettingMarketID.toString()} - value ${bettingDataNew.bettingOutcomes![j].value.toString()}");
            }
            if(bettingDataNew.bettingOutcomes![j].bettingOutcomeType.toString() == "Under"){
              bettingDataNew.under = bettingDataNew.bettingOutcomes![j].value.toString();
            }

            if(bettingDataNew.playerID.toString() != "null"){

              playersPropsData.add(bettingDataNew);

            }

          }

        }


      }

      if(bettingDataNew.bettingMarketType.toString() == "Game Prop"){

        for(var j = 0; j < bettingDataNew.bettingOutcomes!.length; j++){
          if(bettingDataNew.bettingOutcomes![j].sportsBook!.sportsbookID.toString() == "8"){
            if(bettingDataNew.bettingOutcomes![j].bettingOutcomeType.toString() == "Over"){
              bettingDataNew.over =bettingDataNew.bettingOutcomes![j].value.toString();
            }
            if(bettingDataNew.bettingOutcomes![j].bettingOutcomeType.toString() == "Under"){
              bettingDataNew.under = bettingDataNew.bettingOutcomes![j].value.toString();
            }
          }

        }

        gamePropsData.add(bettingDataNew);
      }

    }


    for (var k = 0; k < teamPropsData.length; k++) {
      for (var j = 0; j < allTeams.length; j++) {
        if (teamPropsData[k].teamKey.toString() == allTeams[j].key.toString()) {
          teamPropsData[k].name = allTeams[j].name.toString();
          teamPropsData[k].teamImg = allTeams[j].wikipediaLogoUrl.toString();
        }
      }
    }

    for (var k = 0; k < playersPropsData.length; k++) {
      for (var j = 0; j < allPlayers.length; j++) {
        if (playersPropsData[k].playerID.toString() == allPlayers[j].playerID.toString()) {
          playersPropsData[k].playerImg = allPlayers[j].hostedHeadshotNoBackgroundUrl.toString();
        }
      }
    }

    isLoading = false;

  }

}