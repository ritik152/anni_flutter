import 'dart:convert';

import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/alerts/alerts_model.dart';
import 'package:anni_ai/utils/all_keys.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class AlertsVm {
  var isLoading = true;
  final ScrollController scrollController = ScrollController();
  int page = 1;
  final int limit = 20;


  Future<bool> getAlerts(BuildContext context) async {

    String res = await getMethodWithQuery("GET", "${AllKeys.getNews}?page=${page.toString()}&limit=${limit.toString()}", null, context);

    var response = jsonDecode(res);
    AlertsModel alertsModel2 = AlertsModel();

    if(page.toString() == "1"){
      alertsModel = AlertsModel.fromJson(response);
    }

    alertsModel2 = AlertsModel.fromJson(response);
    isLoading = false;
    if(alertsModel2.code == 200){

      if(alertsModel2.body != null){
        allAlerts.addAll(alertsModel2.body!);
      }

      // }

      return true;
    }

    else{

      showError(alertsModel.message.toString());
      return true;

    }

  }

  String changeFormat(String date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    String formattedDate = DateFormat('MMM dd, yyyy').format(dateTime);
    String _selectedDate = formattedDate.toString();
    return _selectedDate;
  }




}