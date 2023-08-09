import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/RegisterModel.dart';
import '../../apis/api_controller.dart';
import '../../utils/all_keys.dart';
import '../../utils/common.dart';
import '../hint/swipe_left.dart';

class SignupVm {


  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();
  bool obscureNew = true;
  bool obscureConfirm = true;

  String showPassNew = "assets/images/eye_open.png";
  String showPassConfirm = "assets/images/eye_open.png";


  void showHideNewClick(BuildContext context) {
    if(obscureNew){
      obscureNew = !obscureNew;
      showPassNew = "assets/images/eye_closs.png";
    }else{
      obscureNew = !obscureNew;
      showPassNew = "assets/images/eye_open.png";
    }
  }

  void showHideConfirmClick(BuildContext context) {
    if(obscureConfirm){
      obscureConfirm = !obscureConfirm;
      showPassConfirm = "assets/images/eye_closs.png";
    }else{
      obscureConfirm = !obscureConfirm;
      showPassConfirm = "assets/images/eye_open.png";
    }
  }


  bool validation() {
    if(email.text.toString().trim() == ""){
      showError('Please enter email');
      return false;
    }else if (name.text.toString().trim() == ""){
      showError('Please enter name');
      return false;
    }else if (password.text.toString().trim() == ""){
      showError('Please enter password');
      return false;
    }else if (repeatPassword.text.toString().trim() == ""){
      showError('Please enter repeat password');
      return false;
    }else if (repeatPassword.text.toString().trim() != password.text.toString().trim()){
      showError('Your password and repeat password not matched');
      return false;
    }else{
      return true;
    }

  }


  Future<void> signupApi(Map<String, String> map, BuildContext context) async {
    showLoader(context);
    SharedPreferences srf = await SharedPreferences.getInstance();

    String res = await postMethod("POST", AllKeys.signup, map, null, context);

    var response = jsonDecode(res);

    registerModel = RegisterModel.fromJson(response);
    hideLoader(context);
    if(registerModel.code == 200){
      srf.setString(AllKeys.authorization, registerModel.body!.authorization.toString());
      srf.setString(AllKeys.userID, registerModel.body!.id.toString());
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const SwipeLeft()), (route) => false);
    }else {
      showError(registerModel.message.toString());
    }


  }


}