import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../apis/api_controller.dart';
import '../../apis/common_model.dart';
import '../../dialogs/help_success/HelpSuccessDialog.dart';
import '../../utils/all_keys.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';

class HelpVm {

  TextEditingController email = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();

  bool validation() {
    RegExp regex = RegExp(pattern.toString());

    if(email.text.toString().trim() == ""){
      showError('Please enter email');
      return false;
    }else if(!regex.hasMatch(email.text.toString().trim())){
      showError('Please enter valid email');
      return false;
    }else if (subject.text.toString().trim() == ""){
      showError('Please enter subject');
      return false;
    }else if (message.text.toString().trim() == ""){
      showError('Please enter your message');
      return false;
    }else{
      return true;
    }

  }

  Future<void> helpApi(Map<String, String> map, BuildContext context) async {
    showLoader(context);

    String res = await methodWithHeader("POST", AllKeys.contactUs, map, null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);
    hideLoader(context);
    if(commonModel.code == 200){
      showDialog(
          barrierColor: AppColor.dialogBackgroundColor,
          context: context, builder: (context)=> const HelpSuccess());
    }else {
      showError(commonModel.message.toString());
    }


  }
}