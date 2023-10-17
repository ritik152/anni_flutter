import 'dart:convert';

import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/player_data/table_list/seasons_list.dart';
import 'package:anni_ai/screens/player_data/table_list/table_model.dart';
import 'package:anni_ai/utils/all_keys.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TableListVm {

  var click = -1;
  var seasonL = int.parse(season.toString());
  TableModel tableModel = TableModel();
  SeasonList seasonList = SeasonList();
  var seasonSelect = "";
  var isLoading = true;
  var isLoading2 = true;


  Future<void> getSeasonList(BuildContext context, String playerId) async {

    SharedPreferences spf = await SharedPreferences.getInstance();

    if(spf.getString(AllKeys.selectedYear).toString() != "null" || spf.getString(AllKeys.selectedYear).toString() == ""){
      seasonSelect = spf.getString(AllKeys.selectedYear).toString();
    }

    showLoader(context);
    print("Season $seasonL");
    seasonList = SeasonList();

    String res = await getMethodWithQuery("GET", "getSeason?PlayerID=$playerId", null, context);

    var response = jsonDecode(res);

    seasonList = SeasonList.fromJson(response);
    isLoading = false;
    hideLoader(context);
    if(seasonList.code == 200){

      for(var i = 0; i < seasonList.body!.length; i++){
        if(seasonSelect == seasonList.body![i].season.toString()){
          click = i;
          break;
        }
      }

    }else{

      showError(seasonList.message.toString());

    }

  }


  Future<void> getTableListWeek(BuildContext context, String seasonL, String playerId) async {
    showLoader(context);
    print("Season $seasonL");
    tableModel = TableModel();

    String res = await getMethodWithQuery("GET", "getProjectionStatsByWeek?page=1&limit=20&Season=$seasonL&PlayerID=$playerId", null, context);

    var response = jsonDecode(res);

    tableModel = TableModel.fromJson(response);
    isLoading2 = false;
    hideLoader(context);
    if(tableModel.code == 200){

    }else{

      showError(tableModel.message.toString());

    }

  }
}