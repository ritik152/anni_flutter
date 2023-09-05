import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/alert_detail/alert_detail.dart';
import 'package:anni_ai/screens/chat/chat_vm.dart';
import 'package:anni_ai/screens/save_chat_list/save_chats.dart';
import 'package:anni_ai/utils/color.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import '../../../../utils/all_keys.dart';
import '../../../alerts/alerts.dart';
import '../../../betting_data/betting_data.dart';
import '../../../profile/profile_screen.dart';
import '../../../saved_chat_detail/saved_chat_detail.dart';

class LeftDrawer extends StatefulWidget {
  ChatVm vm;
  LeftDrawer(this.vm, {Key? key}) : super(key: key);

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();

}

class _LeftDrawerState extends State<LeftDrawer> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppColor.black,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              var data = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
              setState(() {

              });
            },
            child: Container(
              color: AppColor.backColor,
              child: Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.only(
                    top: 50, bottom: 20, right: 10, left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColor.hintColor)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 70,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: (registerModel.body!.image.toString() == "null")
                                  ? Image.asset(
                                      "assets/images/user.png",
                                      height: 38,
                                      width: 38,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      AllKeys.imageUrl + registerModel.body!.image.toString(),
                                      height: 38,
                                      width: 38,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            BoldText(registerModel.body!.name.toString(), 14,
                                AppColor.whiteColor, TextAlign.start)
                          ],
                        )),
                    Expanded(
                        flex: 20,
                        child: Image.asset(
                          "assets/images/ball.png",
                          height: 30,
                        ))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 82,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BeatingData()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: BoldText("Betting Data", 14,
                                      AppColor.whiteColor, TextAlign.start)),
                              Expanded(
                                  child: BoldText("View All +", 14,
                                      AppColor.textGreenColor, TextAlign.end)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/dot.png",
                              height: 10,
                              width: 10,
                              color: AppColor.whiteColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            MediumText("Upcoming Games", 13,
                                AppColor.whiteColor, TextAlign.start),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/dot.png",
                              height: 10,
                              width: 10,
                              color: AppColor.whiteColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            MediumText("Game Props", 13, AppColor.whiteColor,
                                TextAlign.start),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/dot.png",
                              height: 10,
                              width: 10,
                              color: AppColor.whiteColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            MediumText("Player Props", 13, AppColor.whiteColor,
                                TextAlign.start),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColor.backColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Alerts()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: BoldText("Anni Alerts", 14,
                                      AppColor.whiteColor, TextAlign.start)),
                              Expanded(
                                  child: BoldText("View All +", 14,
                                      AppColor.textGreenColor, TextAlign.end)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if(alertsModel.body != null)SizedBox(
                            height: 280,
                            child: ListView.builder(
                                itemCount: (alertsModel.body!.length <= 3)?alertsModel.body!.length:3,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => AlertDetail(
                                                  detailData : alertsModel.body![index])));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColor.hintColor)),
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BoldText(
                                                  (alertsModel.body![index].type == 1)
                                                      ?"Injury Report":(alertsModel.body![index].type == 2)
                                                      ?"Depth Chart Change!"
                                                      :"Anni Alerts",
                                                  13,
                                                  AppColor.whiteColor,
                                                  TextAlign.start),
                                              MediumText(
                                                  dateFormatAlert( alertsModel.body![index].jsonData!.updated.toString()),
                                                  10,
                                                  AppColor.whiteColor,
                                                  TextAlign.start),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CommonText((alertsModel.body![index].type == 1)
                                              ?"${alertsModel.body![index].jsonData!.name} (${alertsModel.body![index].jsonData!.position.toString()})"
                                              :(alertsModel.body![index].type == 2)
                                              ?"${alertsModel.body![index].jsonData!.name.toString()} (${alertsModel.body![index].jsonData!.position.toString()})"
                                              :alertsModel.body![index].jsonData!.title.toString(), 10, AppColor.whiteColor, TextAlign.start),
                                          SizedBox(
                                            width: double.infinity,
                                            child: BoldText(
                                                "Read More",
                                                12,
                                                AppColor.textGreenColor,
                                                TextAlign.end),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            widget.vm.controller.dispose();
                            var data = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SaveChats()));
                            setState(() {

                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: BoldText("Chat History", 14,
                                      AppColor.whiteColor, TextAlign.start)),
                              Expanded(
                                  child: BoldText("View All +", 14,
                                      AppColor.textGreenColor, TextAlign.end)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if(savedChatModel.body != null)SizedBox(height: 150, child: ListView.builder(
                                itemCount: (savedChatModel.body!.length <= 3)?savedChatModel.body!.length:3,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {

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
                                      widget.vm.controller.dispose();
                                      var data = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>  SavedChatDetail(messageList: messageList,
                                                  chatId : savedChatModel.body![index].id,
                                                  title : savedChatModel.body![index].title.toString())));
                                      widget.vm.controller = VideoPlayerController.asset('assets/video/test.mp4');
                                      widget.vm.controller.setLooping(true);
                                      widget.vm.controller.setVolume(0.0);
                                      widget.vm.controller.initialize().then((value){
                                        setState(() {

                                        });
                                      });
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: AppColor.hintColor)),
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BoldText(
                                              savedChatModel.body![index].title.toString(),
                                              14,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                          MediumText(
                                            dateFormat(savedChatModel.body![index].createdAt.toString()), 12,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String dateFormat(String eventDate) {
    var createTime = "";
    String formattedDate2 = DateFormat('MMM dd,yyyy').format(DateTime.parse(eventDate));
    print(formattedDate2); //formatted date output using intl package =>  2021-03-16
    createTime = formattedDate2.toString();
    return createTime;
  }
  String dateFormatAlert(String eventDate) {
    var createTime = "";
    String formattedDate2 = DateFormat('MMM dd,yyyy').format(DateTime.parse(eventDate));
    print(formattedDate2); //formatted date output using intl package =>  2021-03-16
    createTime = formattedDate2.toString();
    return createTime;
  }

}
