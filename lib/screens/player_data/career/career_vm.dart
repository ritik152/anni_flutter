import 'dart:convert';
import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/player_data/career/career_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/common.dart';
import '../table_list/table_model.dart';

class CareerVm {

  var isLoading = (careerModel.body == null || careerModel.body!.isEmpty)?true:false;

  Future<bool> getTableListWeek(BuildContext context, String playerId) async {

    String res = await getMethodWithQuery("GET", "getCareer?PlayerID=$playerId", null, context);

    var response = jsonDecode(res);

    isLoading = false;
    careerModel = CareerModel.fromJson(response);

    if(careerModel.code == 200){

      return true;
    }else{

      showError(careerModel.message.toString());
      return true;
    }

  }


}