import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../apis/api_controller.dart';
import '../../apis/common_model.dart';
import '../../dialogs/change_pass_dialog.dart';
import '../../utils/all_keys.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';

class ChangePasswordVM with ChangeNotifier{

  TextEditingController userName = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool obscureOld = true;
  bool obscureNew = true;
  bool obscureConfirm = true;
  var click = 0;
  String showPass = "assets/images/eye_open.png";
  String showPassNew = "assets/images/eye_open.png";
  String showPassConfirm = "assets/images/eye_open.png";


  void showHideClick(BuildContext context) {
    if(obscureOld){
      obscureOld = !obscureOld;
      showPass = "assets/images/eye_closs.png";
    }else{
      obscureOld = !obscureOld;
      showPass = "assets/images/eye_open.png";
    }
  }

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



  void backClick(BuildContext context) {
    Navigator.pop(context,true);
  }

  bool validation() {
    if(oldPassword.text.toString().trim() == ""){
      showError("Please enter current password");
      return false;
    }else if(newPassword.text.toString().trim() == ""){
      showError("Please enter new password");
      return false;
    }else if(newPassword.text.toString().trim().length < 6){
      showError('Password should be at least 6 creators');
      return false;
    }else if(confirmPassword.text.toString().trim() == ""){
      showError("Please enter repeat password");
      return false;
    }else if(confirmPassword.text.toString().trim() != newPassword.text.toString().trim()){
      showError("New password and Repeat password not matched");
      return false;
    }else{
      return true;
    }
  }

  bool nameValidation() {
    if(userName.text.toString().trim() == ""){
      showError("Please enter name");
      return false;
    }else{
      return true;
    }
  }

  Future<void> changePassword(BuildContext context) async {

    showLoader(context);
    Map<String,String> map = {
      "oldPassword": oldPassword.text.toString().trim(),
      "newPassword": newPassword.text.toString().trim(),
    };

    String res = await methodWithHeader("PUT", AllKeys.changePassword, map, null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);

    hideLoader(context);
    if(commonModel.code == 200){
      getProfile(context);
      var data = await showDialog(barrierColor: AppColor.dialogBackgroundColor, context: context, builder: (context)=> const ChangePassSuccess());
      Navigator.pop(context);
    }else{
      showError(commonModel.message.toString());
    }


  }


  Future<void> changeName(BuildContext context) async {
    showLoader(context);
    Map<String,String> map = {
      "name": userName.text.toString().trim(),
    };

    String res = await methodWithHeader("PUT", AllKeys.editProfile, map, null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);

    hideLoader(context);
    hideKeyboard();
    if(commonModel.code == 200){
      showToast(commonModel.message.toString());
      getProfile(context);
    }else{
      showError(commonModel.message.toString());
    }


  }

}