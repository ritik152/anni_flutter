import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import '../../apis/api_controller.dart';
import '../../utils/all_keys.dart';
import 'SavedChatModel.dart';


class SaveChatVM with ChangeNotifier{

  TextEditingController search = TextEditingController();
  TextEditingController editTitle = TextEditingController();

  var isLoading = true;

  getSavedChat(BuildContext context, String s) async {
    String res = await getMethodWithQuery("GET", "${AllKeys.getSavedChat}", null, context);

    var response = jsonDecode(res);

    savedChatModel = SavedChatModel.fromJson(response);

    isLoading = false;

    if(savedChatModel.code == 200){

    }else{

    }

    return true;
  }

  String dateFormat(String eventDate) {
    var createTime = "";
    String formattedDate2 = DateFormat('MMM dd, yyyy').format(DateTime.parse(eventDate));
    print(
        formattedDate2); //formatted date output using intl package =>  2021-03-16
    createTime = formattedDate2.toString();
    return createTime;
  }

 /* Future<bool> editTitleApi(BuildContext context, Map<String, String> map) async {
    showLoader(context);
    String res = await methodWithHeader("PUT", AllKeys.editSavedChat, map, null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);

    hideLoader(context);
    if(commonModel.code == 200){
      showToast(commonModel.message.toString());
      return true;
    }else{
      showError(commonModel.message.toString());
      return false;
    }
    
  }*/


  

}