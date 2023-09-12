import 'dart:convert';

import 'package:anni_ai/utils/common.dart';
import 'package:flutter/material.dart';

import '../../apis/api_controller.dart';
import '../../utils/all_keys.dart';
import '../betting_detail/players_model.dart';

class ComparePlayerVm {
  List<PlayersModel> allPlayers = [];
  List<PlayersModel> allPlayersDuplicate = [];
  var isLoading = true;


  Future<void> getPlayers(BuildContext context) async {
    String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/scores/json/Players?key=${AllKeys.sportsKey}",
        null, null, context);

    var response = await jsonDecode(res);


      List<dynamic> list = [];
      list.addAll(response);

      for (var i = 0; i < list.length; i++) {
        PlayersModel allPlayersData = PlayersModel.fromJson(list[i]);
        if(allPlayersData.teamID != null){
          allPlayers.add(allPlayersData);
          allPlayersDuplicate.add(allPlayersData);
        }
      }

      for (var k = 0; k < allPlayers.length; k++) {
        for (var j = 0; j < allTeams.length; j++) {
          if (allPlayers[k].teamID.toString() == allTeams[j].teamID.toString()) {
            allPlayers[k].teamImg = allTeams[j].wikipediaLogoUrl.toString();
            allPlayersDuplicate[k].teamImg = allTeams[j].wikipediaLogoUrl.toString();
            print("Team Logo ${allTeams[j].wikipediaLogoUrl.toString()}");
          }
        }
      }



    isLoading = false;
  }

}