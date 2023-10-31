import 'dart:convert';

import 'package:anni_ai/apis/api_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/common.dart';
import '../table_list/table_model.dart';

class GraphVm {

  List<int> years = [];

  List<String> category = ["Yards","Touchdowns","Receptions","Targets","Attempts"];
  var click = 0;
  var categoryClick = 0;
  var otherPlayerId = "";
  var yearSelect = season.toString();
  var categorySelect = "Yards";
  var comparePlayerName = "Compare...";
  var isLoading = true;

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final style = TextStyle(
      color: Colors.white,
      fontFamily: 'Digital',
      fontSize: 18 * chartWidth / 500,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '1';
        break;
      case 1:
        text = '2';
        break;
      case 2:
        text = '3';
        break;
      case 3:
        text = '4';
        break;
      case 4:
        text = '5';
        break;
      case 5:
        text = '6';
        break;
      case 6:
        text = '7';
        break;
      case 7:
        text = '8';
        break;
      case 8:
        text = '9';
        break;
      case 9:
        text = '10';
        break;
      case 10:
        text = '11';
        break;
      case 11:
        text = '12';
        break;
      case 12:
        text = '13';
        break;
      case 13:
        text = '14';
        break;
      case 14:
        text = '15';
        break;
      case 15:
        text = '16';
        break;
      case 16:
        text = '17';
        break;
      case 17:
        text = '18';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: AppColor.whiteColor,
      fontSize: 10,
    );
    String text;

    return Text(value.toString(), style: style, textAlign: TextAlign.center);
  }

  Future<bool> getTableListWeek(BuildContext context, String yearSelect, String playerId) async {
    String res = await getMethodWithQuery("GET", "getProjectionStatsByWeek?page=1&limit=20&Season=$yearSelect&PlayerID=$playerId", null, context);

    var response = jsonDecode(res);

    isLoading = false;
    tableModel = TableModel.fromJson(response);
    selfData.clear();
    if(tableModel.code == 200){
      if(categoryClick == 0){
        for(var i = 0; i < tableModel.body!.length; i++){

          double passingY = double.parse(tableModel.body![i].jsonData!.passingYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.puntYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.puntNetYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.rushingYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.receivingYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.kickReturnYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.puntReturnYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.passingSackYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.fumbleReturnYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.fieldGoalReturnYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.blockedKickReturnYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.passingYardsPerAttempt.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.rushingYardsPerAttempt.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.interceptionReturnYards.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.receivingYardsPerTarget.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.kickReturnYardsPerAttempt.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.passingYardsPerCompletion.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.puntReturnYardsPerAttempt.toString());
          passingY += double.parse(tableModel.body![i].jsonData!.receivingYardsPerReception.toString());

          selfData.add(passingY);

        }
      }else if(categoryClick == 1){
        for(var i = 0; i < tableModel.body!.length; i++){

          double touchdowns = double.parse(tableModel.body![i].jsonData!.passingTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.passingTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.rushingTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.defensiveTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.offensiveTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.receivingTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.kickReturnTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.puntReturnTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.fumbleReturnTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.specialTeamsTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.fieldGoalReturnTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.blockedKickReturnTouchdowns.toString());
          touchdowns += double.parse(tableModel.body![i].jsonData!.interceptionReturnTouchdowns.toString());
          touchdowns += double.parse((tableModel.body![i].jsonData!.offensiveFumbleRecoveryTouchdowns == null)?"0":tableModel.body![i].jsonData!.offensiveFumbleRecoveryTouchdowns.toString());

          selfData.add(touchdowns);

        }
      }
      else if(categoryClick == 2){
        for(var i = 0; i < tableModel.body!.length; i++){

          double reception = double.parse(tableModel.body![i].jsonData!.receptionPercentage.toString());
          reception += double.parse(tableModel.body![i].jsonData!.fieldGoalPercentage.toString());
          reception += double.parse(tableModel.body![i].jsonData!.receptionPercentage.toString());
          reception += double.parse(tableModel.body![i].jsonData!.passingCompletionPercentage.toString());

          selfData.add(reception);

        }
      }else if(categoryClick == 3){
        for(var i = 0; i < tableModel.body!.length; i++){

          selfData.add(double.parse(tableModel.body![i].jsonData!.receivingTargets.toString()));

        }
      }else if(categoryClick == 4){
        for(var i = 0; i < tableModel.body!.length; i++){

          double attempts = double.parse(tableModel.body![i].jsonData!.passingAttempts.toString());
          attempts += double.parse(tableModel.body![i].jsonData!.rushingAttempts.toString());

          selfData.add(attempts);

        }
      }
      return true;
    }else{

      showError(tableModel.message.toString());

      return true;
    }

  }

  Future<bool> getOtherListWeek(BuildContext context, String yearSelect, String playerId) async {

    String res = await getMethodWithQuery("GET", "getProjectionStatsByWeek?page=1&limit=20&Season=$yearSelect&PlayerID=$playerId", null, context);

    var response = jsonDecode(res);

    isLoading = false;
    tableModelOther = TableModel.fromJson(response);
    otherData.clear();
    if(tableModelOther.code == 200){
      if(categoryClick == 0){
        for(var i = 0; i < tableModelOther.body!.length; i++){

          double passingY = double.parse(tableModelOther.body![i].jsonData!.passingYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.puntYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.puntNetYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.rushingYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.receivingYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.kickReturnYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.puntReturnYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.passingSackYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.fumbleReturnYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.fieldGoalReturnYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.blockedKickReturnYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.passingYardsPerAttempt.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.rushingYardsPerAttempt.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.interceptionReturnYards.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.receivingYardsPerTarget.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.kickReturnYardsPerAttempt.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.passingYardsPerCompletion.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.puntReturnYardsPerAttempt.toString());
          passingY += double.parse(tableModelOther.body![i].jsonData!.receivingYardsPerReception.toString());

          otherData.add(passingY);

        }
      }
      else if(categoryClick == 1){
        for(var i = 0; i < tableModelOther.body!.length; i++){

          double touchdowns = double.parse(tableModelOther.body![i].jsonData!.passingTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.passingTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.rushingTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.defensiveTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.offensiveTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.receivingTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.kickReturnTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.puntReturnTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.fumbleReturnTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.specialTeamsTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.fieldGoalReturnTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.blockedKickReturnTouchdowns.toString());
          touchdowns += double.parse(tableModelOther.body![i].jsonData!.interceptionReturnTouchdowns.toString());
          touchdowns += double.parse((tableModelOther.body![i].jsonData!.offensiveFumbleRecoveryTouchdowns == null)?"0":tableModelOther.body![i].jsonData!.offensiveFumbleRecoveryTouchdowns.toString());

          otherData.add(touchdowns);

        }
      }
      else if(categoryClick == 2){
        for(var i = 0; i < tableModelOther.body!.length; i++){

          double reception = double.parse(tableModelOther.body![i].jsonData!.receptionPercentage.toString());
          reception += double.parse(tableModelOther.body![i].jsonData!.fieldGoalPercentage.toString());
          reception += double.parse(tableModelOther.body![i].jsonData!.receptionPercentage.toString());
          reception += double.parse(tableModelOther.body![i].jsonData!.passingCompletionPercentage.toString());

          otherData.add(reception);

        }
      }
      else if(categoryClick == 3){
        for(var i = 0; i < tableModelOther.body!.length; i++){

          otherData.add(double.parse(tableModelOther.body![i].jsonData!.receivingTargets.toString()));

        }
      }
      else if(categoryClick == 4){

        for(var i = 0; i < tableModelOther.body!.length; i++){

          double attempts = double.parse(tableModelOther.body![i].jsonData!.passingAttempts.toString());

          attempts += double.parse(tableModelOther.body![i].jsonData!.rushingAttempts.toString());

          otherData.add(attempts);

        }
      }

      return true;
    }else{

      showError(tableModelOther.message.toString());

      return true;
    }

  }

}