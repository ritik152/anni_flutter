import 'dart:convert';

import 'package:anni_ai/apis/common_model.dart';
import 'package:flutter/material.dart';

import '../../apis/api_controller.dart';
import '../../dialogs/forgot_pass_success_dialog.dart';
import '../../utils/all_keys.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';

class ForgotPasswordVm {


  TextEditingController email = TextEditingController();
  var hideButton = false;


  bool validation() {
    RegExp regex = RegExp(pattern.toString());
    if(email.text.toString().trim() == ""){
      showError('Please enter email');
      return false;
    }else if(!regex.hasMatch(email.text.toString().trim())){
      showError('Please enter valid email');
      return false;
    }else{
      return true;
    }

  }


  Future<bool> forgotPasswordApi(Map<String, String> map, BuildContext context) async {
    showLoader(context);

    String res = await postMethod("POST", AllKeys.forgotPassword, map, null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);
    hideLoader(context);
    if(commonModel.code == 200){
      return true;
    }else {
      showError(commonModel.message.toString());
      return false;
    }


  }


}