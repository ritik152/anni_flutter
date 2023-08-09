import 'package:anni_ai/dialogs/delete_account_vm.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/color.dart';

class DeleteAccountDialog extends StatefulWidget {

  const DeleteAccountDialog({Key? key}) : super(key: key);

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialog();

}

class _DeleteAccountDialog extends State<DeleteAccountDialog> {

  var vm = DeleteAccountVM();

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
            padding: const EdgeInsets.all(15),
            child:  Lottie.asset('assets/json_animation/delete_account.json'),
          ),

          BoldText("Delete Account?", 16, AppColor.whiteColor, TextAlign.center),

          const SizedBox(height: 5,),

          MediumText("Your account data will be\npermanently deleted", 13, AppColor.whiteColor, TextAlign.center),

          const SizedBox(height: 20,),

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
                        vm.yesClick(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColor.greenColor, backgroundColor: AppColor.greenColor,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25), // <-- Radius
                        ),
                      ),
                      child:  BoldText("Delete", 15, AppColor.black, TextAlign.center)),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                   vm.noClick(context);
                  },
                  child: SizedBox(
                    height: 40,
                    width: 80,
                    child: MediumText("Cancel", 15, AppColor.whiteColor, TextAlign.center),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),

    );
  }

}
