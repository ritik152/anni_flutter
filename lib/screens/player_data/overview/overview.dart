import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/player_data/player_data_vm.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/color.dart';
import '../../../utils/common_widget.dart';

class Overview extends StatelessWidget {
  PlayerDataVm vm;
  String fantasyPoints, number, position;
  double totalPoints;

  Overview(
      this.vm, this.fantasyPoints, this.totalPoints, this.number, this.position,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.backColor),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText("Player Rank", 10, AppColor.whiteColor,
                          TextAlign.start),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText("#${(number == "null") ? "" : number}",
                                  14, AppColor.whiteColor, TextAlign.start),
                              CommonText((position == "null") ? "" : position,
                                  10, AppColor.whiteColor, TextAlign.start),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          /*  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText("#391", 14, AppColor.whiteColor,
                                  TextAlign.start),
                              CommonText("Overall", 10, AppColor.whiteColor,
                                  TextAlign.start),
                            ],
                          ),*/
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppColor.backgroundColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText("Ownership", 10, AppColor.whiteColor,
                          TextAlign.start),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                  "${(vm.allTeamsData.rosted.toString() == "null") ? "0" : vm.allTeamsData.rosted}%",
                                  14,
                                  AppColor.whiteColor,
                                  TextAlign.start),
                              CommonText("Roster", 10, AppColor.whiteColor,
                                  TextAlign.start),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                  "${(vm.allTeamsData.start.toString() == "null") ? "0" : vm.allTeamsData.start}%",
                                  14,
                                  AppColor.whiteColor,
                                  TextAlign.start),
                              CommonText("Start", 10, AppColor.whiteColor,
                                  TextAlign.start),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonText("FPTS/Game", 10, AppColor.whiteColor,
                          TextAlign.start),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                  totalPoints.toStringAsFixed(2).toString(),
                                  14,
                                  AppColor.whiteColor,
                                  TextAlign.start),
                              CommonText("PPR", 10, AppColor.whiteColor,
                                  TextAlign.start),
                            ],
                          ),
                          /* const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText("2.37", 14, AppColor.whiteColor,
                                  TextAlign.start),
                              CommonText("STD", 10, AppColor.whiteColor,
                                  TextAlign.start),
                            ],
                          ),*/
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (vm.playerNewsData.body != null &&
              vm.playerNewsData.body!.isNotEmpty)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.backColor),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldText("$season Season Outlook", 13, AppColor.whiteColor,
                      TextAlign.start),
                  const SizedBox(
                    height: 5,
                  ),
                  if (vm.playerNewsData.body != null &&
                      vm.playerNewsData.body!.isNotEmpty)
                    CommonText(
                        dateFormat(vm
                            .playerNewsData.body![0].jsonData!.rotoworldCreated
                            .toString()),
                        10,
                        AppColor.whiteColor,
                        TextAlign.start),
                  const SizedBox(
                    height: 10,
                  ),
                  if (vm.playerNewsData.body != null &&
                      vm.playerNewsData.body!.isNotEmpty)
                    CommonText(
                        vm.playerNewsData.body![0].jsonData!.comment.toString().replaceAll("<br>", ""),
                        10,
                        AppColor.whiteColor,
                        TextAlign.start),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: BoldText(
                "Projections", 13, AppColor.whiteColor, TextAlign.start),
          ),
          if(projectionsModel.isNotEmpty)SizedBox(
            height: 150,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: projectionsModel.length,
                itemBuilder: (context,index){
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      BoldText(
                          "Wk ${projectionsModel[index].week + 1}", 10, AppColor.whiteColor, TextAlign.start),
                      CommonText(
                          "@ ${projectionsModel[index].opponent.toString()}", 10, AppColor.whiteColor, TextAlign.start),
                      SizedBox(
                        height: 15,
                        width: 15,
                        child: SvgPicture.network(
                          projectionsModel[index].photoUrl.toString(),
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 130,
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    decoration: BoxDecoration(
                        color: AppColor.hintColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))),
                    padding:
                    const EdgeInsets.only(top: 13, left: 13, bottom: 13),
                    child: BoldText(
                        "Proj ", 10, AppColor.whiteColor, TextAlign.start),
                  ),
                  Container(
                    width: 130,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: AppColor.backColor,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    padding: const EdgeInsets.only(top: 13, left: 13, bottom: 13),
                    child: BoldText("Pts. ${projectionsModel[index].fantasyPoints.toString()}", 10, AppColor.whiteColor, TextAlign.start),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
