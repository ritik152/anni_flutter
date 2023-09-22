import 'dart:convert';

import 'package:anni_ai/apis/api_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/common.dart';
import '../table_list/table_model.dart';

class GraphVm {

  List<int> years = [];
  List<double> selfData = [];
  List<double> otherData = [];
  List<String> category = ["Yards","Touchdowns","Receptions","Targets","Attempts"];
  var click = 0;
  var categoryClick = 0;
  var yearSelect = "2023";
  var categorySelect = "Yards";
  var comparePlayerName = "Compare...";
  var isLoading = true;
  TableModel tableModel = TableModel();
  TableModel tableModelOther = TableModel();

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

    if(tableModel.code == 200){
      if(categoryClick == 0){
        for(var i = 0; i < tableModel.body!.length; i++){
          selfData.add(tableModel.body![i].jsonData!.passingYards);
        }
      }else if(categoryClick == 1){
        for(var i = 0; i < tableModel.body!.length; i++){
          selfData.add(tableModel.body![i].jsonData!.passingTouchdowns);
        }
      }else if(categoryClick == 2){
        for(var i = 0; i < tableModel.body!.length; i++){
          selfData.add(tableModel.body![i].jsonData!.receptionPercentage);
        }
      }else if(categoryClick == 3){
        for(var i = 0; i < tableModel.body!.length; i++){
          otherData.add(tableModel.body![i].jsonData!.receivingTargets);
        }
      }else if(categoryClick == 4){
        for(var i = 0; i < tableModel.body!.length; i++){
          selfData.add(tableModel.body![i].jsonData!.passingAttempts);
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

    if(tableModelOther.code == 200){
      if(categoryClick == 0){
        for(var i = 0; i < tableModelOther.body!.length; i++){
          otherData.add(tableModelOther.body![i].jsonData!.passingYards);
        }
      }else if(categoryClick == 1){
        for(var i = 0; i < tableModelOther.body!.length; i++){
          otherData.add(tableModelOther.body![i].jsonData!.passingTouchdowns);
        }
      }else if(categoryClick == 2){
        for(var i = 0; i < tableModelOther.body!.length; i++){
          otherData.add(tableModelOther.body![i].jsonData!.receptionPercentage);
        }
      }else if(categoryClick == 3){
        for(var i = 0; i < tableModelOther.body!.length; i++){
          otherData.add(tableModelOther.body![i].jsonData!.receivingTargets);
        }
      }else if(categoryClick == 4){
        for(var i = 0; i < tableModelOther.body!.length; i++){
          otherData.add(tableModelOther.body![i].jsonData!.passingAttempts);
        }
      }

      return true;
    }else{

      showError(tableModelOther.message.toString());
      return true;
    }

  }

}