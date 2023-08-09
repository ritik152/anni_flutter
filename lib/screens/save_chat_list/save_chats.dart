import 'package:flutter/material.dart';

import '../../apis/api_controller.dart';
import '../../utils/color.dart';
import '../../utils/common_widget.dart';
import '../alert_detail/alert_detail.dart';
import '../saved_chat_detail/saved_chat_detail.dart';
import 'SaveChatVM.dart';

class SaveChats extends StatefulWidget {

  const SaveChats({Key? key}) : super(key: key);

  @override
  State<SaveChats> createState() => _SaveChatsState();

}

class _SaveChatsState extends State<SaveChats> {

  var vm = SaveChatVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.backColor,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
            padding: const EdgeInsets.only(top: 35, bottom: 20, right: 20, left: 20),
            child: Stack(
              children: [

                SizedBox(
                  width: double.infinity,
                  child: BoldText("Saved Chats", 14, AppColor.whiteColor, TextAlign.center),
                ),

                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,color: AppColor.greenColor,)),

              ],
            ),
          ),
          Expanded(
              child: (savedChatModel.body!.length == 0)?
              NoData("No Saved Chats", "assets/images/no_data.png", context):
              ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: savedChatModel.body!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {

                        List<Map<String, String>> messageList = [];

                        for (var i = 0; i < savedChatModel.body![index].jsonData!.length; i++) {
                          Map<String, String> mapRate = <String, String>{};
                          mapRate['isFrom'] = savedChatModel.body![index].jsonData![i].isFrom.toString();
                          mapRate['humanMesasge'] = savedChatModel.body![index].jsonData![i].humanMesasge.toString();
                          mapRate['aiMessage'] = savedChatModel.body![index].jsonData![i].aiMessage.toString();
                          mapRate['category'] = savedChatModel.body![index].jsonData![i].category.toString();
                          mapRate['prompt'] = savedChatModel.body![index].jsonData![i].prompt.toString();
                          mapRate['description'] = savedChatModel.body![index].jsonData![i].description.toString();
                          mapRate['id'] = savedChatModel.body![index].jsonData![i].id.toString();
                          messageList.add(mapRate);
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  SavedChatDetail(messageList: messageList,chatId : savedChatModel.body![index].id,title : savedChatModel.body![index].title.toString())));
                      },
                      child: Container(
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColor.hintColor)),
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoldText(savedChatModel.body![index].title.toString(), 13, AppColor.textGreenColor,
                                TextAlign.start),
                            MediumText(vm.dateFormat(savedChatModel.body![index].createdAt.toString()), 10, AppColor.whiteColor, TextAlign.start)
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
