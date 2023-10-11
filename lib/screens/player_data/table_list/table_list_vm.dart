import 'dart:convert';

import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/player_data/table_list/table_model.dart';
import 'package:anni_ai/utils/all_keys.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/src/widgets/framework.dart';

class TableListVm {

  var click = -1;
  var seasonL = int.parse(season.toString());
  List<String> seasonList = [];
  TableModel tableModel = TableModel();
  var isLoading = true;

  Future<void> getSeasonList() async {

    for(var i = 0; i <= 18; i++){
      seasonL = int.parse(season.toString()) - i;
      seasonList.add(seasonL.toString());
    }

  }

  Future<void> getTableListWeek(BuildContext context, String seasonL, String playerId) async {
    print("Season $seasonL");
    String res = await getMethodWithQuery("GET", "getProjectionStatsByWeek?page=1&limit=20&Season=$seasonL&PlayerID=$playerId", null, context);

    var response = jsonDecode(res);
    tableModel = TableModel();
    tableModel = TableModel.fromJson(response);
    isLoading = false;
    if(tableModel.code == 200){

    }else{

      showError(tableModel.message.toString());

    }

  }
}