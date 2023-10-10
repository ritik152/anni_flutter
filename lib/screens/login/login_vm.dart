import 'dart:convert';

import 'package:anni_ai/apis/RegisterModel.dart';
import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/utils/all_keys.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../chat/chat.dart';

class LoginVm {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscureNew = true;
  String showPass = "assets/images/eye_open.png";

  void showHideNewClick(BuildContext context) {
    if(obscureNew){
      obscureNew = !obscureNew;
      showPass = "assets/images/eye_closs.png";
    }else{
      obscureNew = !obscureNew;
      showPass = "assets/images/eye_open.png";
    }
  }

  bool validation() {
    RegExp regex = RegExp(pattern.toString());

    if(email.text.toString().trim() == ""){
      showError('Please enter email');
      return false;
    }
    else if(!regex.hasMatch(email.text.toString().trim())){
      showError('Please enter valid email');
      return false;
    }
    else if (password.text.toString().trim() == ""){
      showError('Please enter password');
      return false;
    }
    else{
      return true;
    }

  }


  Future<void> loginApi(Map<String, String> map, BuildContext context) async {
    showLoader(context);
    SharedPreferences srf = await SharedPreferences.getInstance();

    String res = await postMethod("POST", AllKeys.login, map, null, context);

    var response = jsonDecode(res);

    registerModel = RegisterModel.fromJson(response);
    hideLoader(context);
    if(registerModel.code == 200){
      srf.setString(AllKeys.authorization, registerModel.body!.authorization.toString());
      srf.setString(AllKeys.userID, registerModel.body!.id.toString());

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Chat()), (route) => false);
    }else {
      showError(registerModel.message.toString());
    }


  }





}