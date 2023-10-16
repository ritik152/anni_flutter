import 'dart:async';
import 'dart:ui';
import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/chat/chat_vm.dart';
import 'package:anni_ai/utils/all_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/common_widget.dart';
import '../player_data/career/career_model.dart';
import '../player_data/player_data.dart';

class ReceiverTextView extends StatefulWidget {
  final Function regeratedTapped;
  var chatData;
  bool isLast;
  var vm;
  ReceiverTextView({Key? key, required this.chatData, required this.isLast, required this.vm, required this.regeratedTapped}) : super(key: key);

  @override
  State<ReceiverTextView> createState() => _ReceiverTextViewState();
}

class _ReceiverTextViewState extends State<ReceiverTextView> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 5,right: 20.0,bottom: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                border: Border.all(color: AppColor.greenColor)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (widget.chatData.aiMessage != "")?
                        (widget.chatData.aiMessage.contains("CSP")) ?GestureDetector(
                          onTap: () async {
                            showLoader(context);
                            SharedPreferences spf = await SharedPreferences.getInstance();
                            final clickId = widget.chatData.aiMessage.replaceAll(RegExp('CSP_'), '');
                            print("Click id = $clickId");
                            for(var i = 0; i < trendingUpData.length; i++){
                              if(clickId == trendingUpData[i].playerID.toString()){

                                Timer(const Duration(seconds: 2), () {
                                  hideLoader(context);
                                  spf.setString(AllKeys.playerId, trendingUpData[i].playerID.toString());

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PlayerData(
                                      playerId : trendingUpData[i].playerID.toString(),
                                      fantasyPoints : trendingUpData[i].fantasyPoints.toString(),
                                      totalPlay : trendingUpData[i].played.toString(),
                                      keys: trendingUpData[i].team.toString(),
                                      tab: 4)
                                  )
                                  );
                                });

                              }

                            }


                          },
                            child: BoldText("Please click here to view career stats", 14, AppColor.whiteColor, TextAlign.start)) :CommonText(widget.chatData.aiMessage.replaceFirst('\n', '', 1), 14, AppColor.whiteColor, TextAlign.start)
                            : CommonText("It seems like you've entered another random sequence of characters. If you have any questions or need assistance with anything, please let me know, and I'll be glad to assist you.", 14, AppColor.whiteColor, TextAlign.start),
                        const SizedBox(height: 5,),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
