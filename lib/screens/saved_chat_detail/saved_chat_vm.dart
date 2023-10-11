import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import '../../apis/RegisterModel.dart';
import '../../apis/api_controller.dart';
import '../../apis/common_model.dart';
import '../../utils/all_keys.dart';
import '../../utils/common.dart';
import '../alerts/alerts_model.dart';
import '../betting_data/all_teams_model.dart';
import '../betting_detail/players_model.dart';
import '../chat/chat_model.dart';
import '../chat/drawers/right_drawer/trending_up_model.dart';
import '../save_chat_list/SavedChatModel.dart';

class SavedChatVm{

  TextEditingController chatController = TextEditingController();
  TextEditingController saveChatController = TextEditingController();
  List<LocalChatDataSaved> chatArray = [];
  ScrollController scrollController = ScrollController();
  late VideoPlayerController controller;
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

  Future<ChatModel> chatWithAI(Map<String, String> params, BuildContext context) async {
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

  getAlerts(BuildContext context) async {
    String res = await getMethodWithQuery("GET", "${AllKeys.getNews}?page=1&limit=10", null, context);

    var response = jsonDecode(res);

    alertsModel = AlertsModel.fromJson(response);

    if(alertsModel.code == 200){

    }else{

    }

    return true;
  }

  Future<void> getPlayerGameStatsByWeek(BuildContext context) async {
    String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/stats/json/PlayerSeasonStats/$season?key=${AllKeys.sportsKey}",
        null, null, context);

    var response = jsonDecode(res);

    List<dynamic> list = [];
    list.addAll(response);

    trendingUpData.clear();
    duplicateItems.clear();

    for (var i = 0; i < list.length; i++) {
      TrendingData allPlayersData = TrendingData.fromJson(list[i]);
      trendingUpData.add(allPlayersData);
      duplicateItems.add(allPlayersData);
    }

    trendingUpData.sort((a, b) {
      final aValue = a.fantasyPoints;
      final bValue = b.fantasyPoints;
      return bValue.compareTo(aValue);
    });

    duplicateItems.sort((a, b) {
      final aValue = a.fantasyPoints;
      final bValue = b.fantasyPoints;
      return bValue.compareTo(aValue);
    });


  }



  Future<void> getPlayers(BuildContext context) async {

    String res = await thirdPartyMethod("GET", "https://api.sportsdata.io/v3/nfl/scores/json/Players?key=${AllKeys.sportsKey}", null, null, context);

    var response = jsonDecode(res);

    hideLoader(context);

    List<dynamic> list = [];

    list.addAll(response);

    for (var i = 0; i < list.length; i++) {

      PlayersModel allPlayersData = PlayersModel.fromJson(list[i]);

      allPlayers.add(allPlayersData);

    }

    for (var k = 0; k < trendingUpData.length; k++) {
      for (var j = 0; j < allPlayers.length; j++) {
        if (trendingUpData[k].playerID.toString() == allPlayers[j].playerID.toString()) {
          trendingUpData[k].playerImg = allPlayers[j].photoUrl.toString();
        }
      }
    }
  }

  Future<void> getTeams(BuildContext context) async {
    String res = await thirdPartyMethod("GET",
        "https://api.sportsdata.io/v3/nfl/scores/json/Teams/$season?key=${AllKeys.sportsKey}",
        null, null, context);

    var response = jsonDecode(res);

    List<dynamic> list = [];

    list.addAll(response);

    for (var i = 0; i < list.length; i++) {
      AllTeamsModel allTeamsData = AllTeamsModel.fromJson(list[i]);
      allTeams.add(allTeamsData);
    }

    for (var k = 0; k < trendingUpData.length; k++) {

      for (var j = 0; j < allTeams.length; j++) {
        if (trendingUpData[k].team.toString() == allTeams[j].key.toString()) {
          trendingUpData[k].teamImg = allTeams[j].wikipediaLogoUrl.toString();
          duplicateItems[k].teamImg = allTeams[j].wikipediaLogoUrl.toString();
        }
      }
    }

  }

}

class LocalChatDataSaved {
  String isFrom = '';
  String humanMesasge = '';
  String aiMessage = '';
  String category = '';
  String prompt = '';
  String description = '';
  int? id = 0;

  LocalChatDataSaved({
    required this.isFrom,
    required this.humanMesasge,
    required this.aiMessage,
    required this.category,
    required this.prompt,
    required this.description,
    this.id
  });
}