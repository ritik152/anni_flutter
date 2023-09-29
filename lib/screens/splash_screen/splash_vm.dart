import 'dart:convert';

import 'package:flutter/material.dart';

import '../../apis/api_controller.dart';
import '../../utils/all_keys.dart';
import '../betting_data/all_teams_model.dart';

class SplashVm {


  Future<void> currentSeason(BuildContext context) async {
    String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/scores/json/CurrentSeason?key=${AllKeys.sportsKey}",
        null, null, context);
    var response = jsonDecode(res);

    print("Season--------"+response.toString());
    season = response.toString();

  }

  Future<void> currentWeek(BuildContext context) async {
    String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/scores/json/CurrentWeek?key=${AllKeys.sportsKey}",
        null, null, context);
    var response = jsonDecode(res);

    print("Week--------"+response.toString());
    week = response.toString();

  }



}