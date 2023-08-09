import 'dart:convert';
import 'package:anni_ai/screens/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../apis/api_controller.dart';
import '../../apis/common_model.dart';
import '../../screens/save_chat_list/SavedChatModel.dart';
import '../../utils/all_keys.dart';
import '../../utils/common.dart';

class DeleteSaveChatVm{

  Future<void> yesClick(BuildContext context, String id) async {
    showLoader(context);
    String res = await getMethodWithQuery("DELETE", "${AllKeys.deleteSavedChat}?chat_id=$id", null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);

    hideLoader(context);
    if(commonModel.code == 200){
     // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Chat()), (route) => false);
      getSavedChat(context);
      showToast(commonModel.message.toString());
    }else{
      showError(commonModel.message.toString());
    }
  }

  getSavedChat(BuildContext context) async {
    String res = await getMethodWithQuery("GET", AllKeys.getSavedChat, null, context);

    var response = jsonDecode(res);

    savedChatModel = SavedChatModel.fromJson(response);

    if(savedChatModel.code == 200){
      Navigator.pop(context,true);
      Navigator.pop(context,true);
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Chat()), (route) => false);
    }

    return true;
  }

  void noClick(BuildContext context) {
    Navigator.pop(context);
  }


}