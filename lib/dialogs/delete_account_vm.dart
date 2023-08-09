import 'dart:convert';
import 'package:anni_ai/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../apis/api_controller.dart';
import '../apis/common_model.dart';
import '../screens/start_screen/start_screen.dart';
import '../utils/all_keys.dart';
import '../utils/common.dart';

class DeleteAccountVM{

  Future<void> yesClick(BuildContext context) async {
    showLoader(context);
    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await getMethodWithQuery("DELETE", AllKeys.deleteAccount, null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);

    hideLoader(context);

    if(commonModel.code == 200){

      srf.clear();
      showToast(commonModel.message.toString());
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const StartScreen()), (route) => false);

    }else{

      showError(commonModel.message.toString());

    }
  }

  void noClick(BuildContext context) {
    Navigator.pop(context);
  }


}