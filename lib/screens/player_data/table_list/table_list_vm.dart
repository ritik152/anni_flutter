import 'dart:convert';

import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/player_data/table_list/table_model.dart';
import 'package:anni_ai/utils/all_keys.dart';
import 'package:flutter/src/widgets/framework.dart';

class TableListVm {
  var click = -1;
  int seasonList = int.parse(season);
  List<TableModel> tableData = [];
  List<TableModel> tableDataMain = [];

  Future<void> getTableListData(BuildContext context, String playerId) async {

    for(var i = 0; i <= 18; i++){
      int seasonL = seasonList - i;
      for(var i = 1; i <= 18; i++){
        await getTableListWeek(context, seasonL,i);
      }
    }

  }

  Future<void> getTableListWeek(BuildContext context, int seasonL, int weekL) async {
    print("Season $seasonL , Week $weekL");
    String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/projections/json/IdpPlayerGameProjectionStatsByWeek/$seasonL/$weekL?key=${AllKeys.sportsKey}", null,null, context);

    var response = jsonDecode(res);

    List<dynamic> list = [];
    list.addAll(response);

    for (var i = 0; i < list.length; i++) {
      TableModel allPlayersData = TableModel.fromJson(list[i]);
      tableData.add(allPlayersData);
    }


  }
}