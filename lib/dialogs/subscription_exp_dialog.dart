
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/color.dart';
import '../screens/subscription/subscription.dart';


class SubscriptionExpire extends StatefulWidget {

  const SubscriptionExpire({Key? key}) : super(key: key);

  @override
  State<SubscriptionExpire> createState() => _SubscriptionExpire();

}

class _SubscriptionExpire extends State<SubscriptionExpire> {


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

        return false;
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
              height: 200,
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  Lottie.asset('assets/json_animation/anii.json'),
            ),
            BoldText("Subscription Expired", 16, AppColor.whiteColor, TextAlign.center),
            const SizedBox(height: 5,),
            MediumText("The free trial has expired, please subscribe to access the features", 13, AppColor.whiteColor, TextAlign.center),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    width: 170,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context,true);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColor.greenColor, backgroundColor: AppColor.greenColor,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25), // <-- Radius
                          ),
                        ),
                        child:  BoldText("Purchase", 15, AppColor.black, TextAlign.center)),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                     Navigator.pop(context,false);
                    },
                    child: SizedBox(
                      height: 40,
                      width: 80,
                      child: MediumText("Profile", 15, AppColor.whiteColor, TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }

}
