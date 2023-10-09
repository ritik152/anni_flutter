import 'dart:async';

import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../screens/profile/profile_screen.dart';
import '../../utils/color.dart';
import 'help_send_dialog_vm.dart';


class HelpSuccess extends StatefulWidget {

  const HelpSuccess({Key? key}) : super(key: key);

  @override
  State<HelpSuccess> createState() => _HelpSuccess();

}

class _HelpSuccess extends State<HelpSuccess> {

  var vm = HelpSuccessDialogVM();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 3), () {
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const ProfileScreen()), (route) => false);
      Navigator.pop(context);
      Navigator.pop(context);
    });

  }
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
            child:  Lottie.asset('assets/json_animation/ooZJNsYyRE.json'),
          ),
          BoldText("Form Sent!", 16, AppColor.whiteColor, TextAlign.center),
          const SizedBox(height: 5,),
          MediumText("Thank you for your message, your feedback helps us improve!", 13, AppColor.whiteColor, TextAlign.center),
          const SizedBox(height: 30,)
        ],
      ),

    );
  }

}
