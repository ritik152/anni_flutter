
import 'package:anni_ai/dialogs/start_chat_dialog.dart';
import 'package:anni_ai/screens/chat/chat.dart';
import 'package:anni_ai/screens/hint/swipe_left.dart';
import 'package:anni_ai/screens/hint/swipe_right.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/color.dart';


class SwipeRightDialog extends StatefulWidget {

  const SwipeRightDialog({Key? key}) : super(key: key);

  @override
  State<SwipeRightDialog> createState() => _SwipeRightDialog();

}

class _SwipeRightDialog extends State<SwipeRightDialog> {


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
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>  Chat(from: "signup",)), (route) => false);
        return true;
      },
      child: Container(
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
              child:  RotatedBox(
                  quarterTurns: 3,
                  child: Lottie.asset('assets/json_animation/swipe_left.json')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                BoldText("Swipe", 16, AppColor.whiteColor, TextAlign.center),
                const SizedBox(width: 5,),
                BoldText("Right", 16, AppColor.greenColor, TextAlign.center),
              ],
            ),
            const SizedBox(height: 5,),
            MediumText("Swipe the screen to the right to\nsee game data, Anni Alerts, and\nsaved charts.", 13, AppColor.whiteColor, TextAlign.center),

            const SizedBox(height: 20,),

            SizedBox(
              height: 50,
              width: 170,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>  Chat(from: "signup",)), (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColor.greenColor, backgroundColor: AppColor.greenColor,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // <-- Radius
                    ),
                  ),
                  child:  BoldText("Next", 15, AppColor.black, TextAlign.center)),
            ),
            const SizedBox(height: 20,),

          ],
        ),

      ),
    );
  }

}
