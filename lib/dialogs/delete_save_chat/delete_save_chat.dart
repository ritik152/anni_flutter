import 'package:anni_ai/dialogs/delete_save_chat/delete_save_chat_vm.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import '../../../utils/color.dart';


class DeleteSaveChat extends StatefulWidget {
  int? chatId;
  DeleteSaveChat({Key? key,this.chatId}) : super(key: key);

  @override
  State<DeleteSaveChat> createState() => _DeleteSaveChat();

}

class _DeleteSaveChat extends State<DeleteSaveChat> {

  var vm = DeleteSaveChatVm();

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
      padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
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
          const SizedBox(height: 10,),
          BoldText("Delete this Chat?", 17, AppColor.whiteColor, TextAlign.center),
          const SizedBox(height: 5,),
          CommonText("Are you sure? Once deleted it cannot be recovered.", 12, AppColor.whiteColor, TextAlign.center),

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
                        vm.yesClick(context, widget.chatId.toString());
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColor.redColor, backgroundColor: AppColor.redColor,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25), // <-- Radius
                        ),
                      ),
                      child:  BoldText("Delete Chat", 15, AppColor.black, TextAlign.center)),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 40,
                    width: 80,
                    child: BoldText("Cancel", 13, AppColor.whiteColor, TextAlign.center),
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
