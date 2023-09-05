import 'dart:convert';

import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/alerts/alerts_model.dart';
import 'package:anni_ai/utils/all_keys.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class AlertsVm {
  var isLoading = true;


  Future<bool> getAlerts(BuildContext context) async {

    String res = await getMethodWithQuery("GET", "${AllKeys.getNews}?page=1&limit=10", null, context);

    var response = jsonDecode(res);

    alertsModel = AlertsModel.fromJson(response);
    isLoading = false;
    if(alertsModel.code == 200){

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
    String formattedDate = DateFormat('MMM dd,yyyy').format(dateTime);
    String _selectedDate = formattedDate.toString();
    return _selectedDate;
  }




}