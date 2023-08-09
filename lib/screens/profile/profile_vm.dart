import 'dart:convert';
import 'dart:io';

import 'package:anni_ai/apis/RegisterModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/api_controller.dart';
import '../../apis/common_model.dart';
import '../../utils/all_keys.dart';
import '../../utils/common.dart';

class ProfileVm {

  File? imageList;
  bool changesProfession = false;
  Map<String, String>? imageParams;

  Future<bool> updateProfilePicture(BuildContext context,
      Map<String, String> map, Map<String, String>? imageParams) async {
    showLoader(context);
    String res = await methodWithHeader(
        "PUT", AllKeys.editProfile, map, imageParams, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);

    if (commonModel.code == 200) {
      showToast(commonModel.message.toString());
      return true;
    } else {
      hideLoader(context);
      showToast(commonModel.message.toString());
      return false;
    }
  }


  Future<bool> getProfile(BuildContext context) async {
    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await getMethodWithQuery("GET", "${AllKeys.getProfile}?user_id=${srf.getString(AllKeys.userID)}", null, context);

    var response = jsonDecode(res);

    registerModel = RegisterModel.fromJson(response);

    hideLoader(context);
    if(registerModel.code == 200){
      showToast(registerModel.message.toString());
      return true;
    }else{
      showError(registerModel.message.toString());
      return false;
    }
  }

}