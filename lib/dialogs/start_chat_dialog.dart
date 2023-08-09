
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/color.dart';


class StartChatDialog extends StatefulWidget {

  const StartChatDialog({Key? key}) : super(key: key);

  @override
  State<StartChatDialog> createState() => _StartChatDialog();

}

class _StartChatDialog extends State<StartChatDialog> {


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*100,
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.black, //Colors.black.withOpacity(0.3),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(45),

        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,// To make the card compact
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(10),
            child:  Lottie.asset('assets/json_animation/swipe_left.json'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              BoldText("Start Chatting", 16, AppColor.whiteColor, TextAlign.center),
              const SizedBox(width: 5,),
              BoldText("Below", 16, AppColor.greenColor, TextAlign.center),
            ],
          ),
          const SizedBox(height: 5,),
          MediumText("Type in the field below to\nstart chatting with Anni.", 13, AppColor.whiteColor, TextAlign.center),

          const SizedBox(height: 20,),

          SizedBox(
            height: 50,
            width: 170,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.greenColor, backgroundColor: AppColor.greenColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // <-- Radius
                  ),
                ),
                child:  BoldText("Got It!", 15, AppColor.black, TextAlign.center)),
          ),
          const SizedBox(height: 20,),

        ],
      ),

    );
  }

}
