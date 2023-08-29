import 'dart:convert';

import 'package:anni_ai/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/api_controller.dart';
import '../../apis/common_model.dart';
import '../../utils/all_keys.dart';
import '../../utils/common.dart';


class LogoutVM{


  Future<void> logout(BuildContext context) async {

    showLoader(context);

    SharedPreferences srf = await SharedPreferences.getInstance();

    String response = await methodWithHeader("PUT", AllKeys.logout, null, null, context);

    var res = jsonDecode(response);

    CommonModel commonModel = CommonModel.fromJson(res);

    hideLoader(context);

    if(commonModel.code == 200){

      srf.clear();

      showToast(commonModel.message.toString());

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Login()), (route) => false);

    }
    else{

      showError(commonModel.message.toString());

    }

  }

  void noClick(BuildContext context) {
    Navigator.pop(context);
  }

}