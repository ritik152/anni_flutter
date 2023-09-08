import 'dart:convert';

import 'package:anni_ai/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/alerts/alerts_model.dart';
import '../screens/betting_data/all_teams_model.dart';
import '../screens/betting_detail/players_model.dart';
import '../screens/chat/drawers/right_drawer/trending_up_model.dart';
import '../screens/save_chat_list/SavedChatModel.dart';
import '../utils/all_keys.dart';
import '../utils/common.dart';
import 'RegisterModel.dart';

String key_splite = "_*_";
String password = 'QW5uaSBBcHAgQ3JlYXRlZCBCeSBDaGFuZGFu';


var token = "qwe";

RegisterModel registerModel = RegisterModel();
SavedChatModel savedChatModel = SavedChatModel();
AlertsModel alertsModel = AlertsModel();
List<TrendingData> trendingUpData = [];
List<TrendingData> duplicateItems = [];
List<PlayersModel> allPlayers = [];
List<AllTeamsModel> allTeams = [];
String season = "2022";
String week = "1";
//---------------------------------Post Method----------------------------------

Future<String> thirdPartyMethod(String method, String url, Map<String, String>? fieldsParams, Map<String, String>? imageParams, BuildContext context) async {
  var request = http.Request(method, Uri.parse(url));
  if (fieldsParams != null) {
    final jsonString = json.encode(fieldsParams);
    request.body = jsonString;
  }
  http.StreamedResponse streamedRequest = await request.send();
  String response = await streamedRequest.stream.bytesToString();
  print("${'${AllKeys.baseUrl}/$url'}  $response");
  return response;
}

Future<String> postMethod(String method, String url, Map<String, String>? fieldsParams, Map<String, String>? imageParams, BuildContext context) async {
  Map<String, String> headers = <String, String>{"Accept": "application/json", "security_key": password,};
  var request = http.MultipartRequest(method, Uri.parse("${AllKeys.baseUrl}/$url"));

  if (fieldsParams != null) {
    request.fields.addAll(fieldsParams);
  }
  if (imageParams != null) {
    imageParams.forEach((key, value) async {
      request.files.add(await http.MultipartFile.fromPath(key.split(key_splite)[0], value));
    });
  }

  request.headers.addAll(headers);
  http.StreamedResponse streamedRequest = await request.send();
  String response = await streamedRequest.stream.bytesToString();
  print("${'${AllKeys.baseUrl}/$url'}  $response");
  return response;
}

Future<String> methodWithHeader(
    String method,
    String url,
    Map<String, String>? fieldsParams,
    Map<String, String>? imageParams,
    BuildContext context) async {
  SharedPreferences srf = await SharedPreferences.getInstance();


  Map<String, String> headers = <String, String>{
    "Accept": "application/json",
    "security_key": password,
    'authorization': '${srf.getString(AllKeys.authorization)}',
  };
  print("HEADERS $headers");
  var request = http.MultipartRequest(method, Uri.parse("${AllKeys.baseUrl}/$url"));
  if (fieldsParams != null) {
    request.fields.addAll(fieldsParams);
  }
  if (imageParams != null) {
    imageParams.forEach((key, value) async {
      request.files.add(await http.MultipartFile.fromPath(key.split(key_splite)[0], value));
    });
  }

  request.headers.addAll(headers);
  http.StreamedResponse streamedRequest = await request.send();

  if (streamedRequest.statusCode == 401) {
    srf.clear();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => Login(),), (route) => false,);
  }

  String response = await streamedRequest.stream.bytesToString();
  print("${'${AllKeys.baseUrl}/$url'}  $response");
  return response;

}

//---------------------------------Get Method-----------------------------------

Future<String> getMethodWithQuery(String method, String endUrl,
    Map<String, String>? params, BuildContext context) async {
  SharedPreferences srf = await SharedPreferences.getInstance();

  Map<String, String> headers = <String, String>{
    "Accept": "application/json",
    "security_key": password,
    'authorization': '${srf.getString(AllKeys.authorization)}',
  };

  print("HEADERS $headers");
  var request = http.Request(method, Uri.parse('${AllKeys.baseUrl}/$endUrl'));

  if (params != null) {
    request.bodyFields.addAll(params);
  }

  request.headers.addAll(headers);
  http.StreamedResponse streamedResponse = await request.send();

  if (streamedResponse.statusCode == 401) {
    srf.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Login(),
      ),
      (route) => false,
    );
  }

  String response = await streamedResponse.stream.bytesToString();
  print("${'${AllKeys.baseUrl}/$endUrl'}   $response");
  return response;
}

//---------------------------------Get profile----------------------------------

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