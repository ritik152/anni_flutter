import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apis/RegisterModel.dart';
import '../../apis/api_controller.dart';
import '../../apis/common_model.dart';
import '../../utils/all_keys.dart';
import '../../utils/common.dart';
import '../save_chat_list/SavedChatModel.dart';
import 'chat_model.dart';

class ChatVm{

  TextEditingController chatController = TextEditingController();
  TextEditingController saveChatController = TextEditingController();
  List<LocalChatData> chatArray = [];
  ScrollController scrollController = ScrollController();
  String lastQuestion = '';
  String lastWords = '';
  var errorMesasge = '';
  int chatId = 0;
  String email = '';
  late Timer timer;
  var question = "";
  var mute = false;
  List<String> questionsList = [
    "Who led the NFL in rushing yards in 2022?",
    "Who had the toughest schedule in 2022?",
    "What team has the best odds to win the super bowl this year?",
  "Which player had the best points per game (PPG) in 2022?",
  "Which team had the most defensive turnovers in 2022?"
  ];

  Future<bool> getProfile(BuildContext context) async {

    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await getMethodWithQuery("GET", "${AllKeys.getProfile}?user_id=${srf.getString(AllKeys.userID)}", null, context);

    var response = jsonDecode(res);

    registerModel = RegisterModel.fromJson(response);

    if(registerModel.code == 200){
      // showToast(registerModel.message.toString());
      return true;
    }else{
      showError(registerModel.message.toString());
      return false;
    }
  }

  Future<ChatModel> chatWithAI(Map<String, String> params,
      BuildContext context) async {
    var response = await methodWithHeader("POST", AllKeys.aiChat, params, null, context);
    var res = jsonDecode(response);
    return ChatModel.fromJson(res);
  }


  Future<void> saveChatThread(Map<String, String> map, BuildContext context) async {

    if (chatArray.isNotEmpty) {
      showLoader(context);
      String response = await methodWithHeader("POST", AllKeys.saveChat, map, null, context);

      var res = jsonDecode(response);

      CommonModel commonModel = CommonModel.fromJson(res);
      hideLoader(context);
      if(commonModel.code == 200){
        Navigator.pop(context);
        getSavedChat(context);
        showToast(commonModel.message.toString());
      }else{
        showToast(commonModel.message.toString());
      }

    }
  }


  getSavedChat(BuildContext context) async {
    String res = await getMethodWithQuery("GET", AllKeys.getSavedChat, null, context);

    var response = jsonDecode(res);

    savedChatModel = SavedChatModel.fromJson(response);

    if(savedChatModel.code == 200){

    }else{

    }

    return true;
  }


}


class LocalChatData {
  String isFrom = '';
  String humanMesasge = '';
  String aiMessage = '';
  String category = '';
  String prompt = '';
  String description = '';
  int? id = 0;

  LocalChatData({
    required this.isFrom,
    required this.humanMesasge,
    required this.aiMessage,
    required this.category,
    required this.prompt,
    required this.description,
    this.id
  });
}