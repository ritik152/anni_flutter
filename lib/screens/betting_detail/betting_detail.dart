import 'package:anni_ai/screens/betting_data/betting_data_vm.dart';
import 'package:anni_ai/screens/betting_detail/betting_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color.dart';
import '../../utils/common_widget.dart';

class BettingDetail extends StatefulWidget {
  String date, scoreId, awayImg, awayName, homeImg, homeName;

  BettingDetail(
      {Key? key,
      required this.date,
      required this.scoreId,
      required this.awayImg,
      required this.awayName,
      required this.homeImg,
      required this.homeName})
      : super(key: key);

  @override
  State<BettingDetail> createState() => _BettingDetailState();
}

class _BettingDetailState extends State<BettingDetail> {
  var vm = BettingDetailVm();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.backColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            padding:
                const EdgeInsets.only(top: 50, bottom: 20, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.greenColor,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    BoldText("Betting Data", 14, AppColor.whiteColor,
                        TextAlign.start)
                  ],
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: RichText(
                      text: TextSpan(
                          text: widget.date,
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: "Reg",
                              color: AppColor.whiteColor),
                          children: [
                        TextSpan(
                          text: '@${widget.homeName}',
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: "Bold",
                              color: AppColor.whiteColor),
                        ),
                      ])),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: BoldText("Popular", 13, AppColor.textGreenColor, TextAlign.center),
                  // ),
                  /* GestureDetector(
                    onTap: (){
                      vm.index = 0;
                      setState(() {

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BoldText("All", 13, (vm.index == 0)?AppColor.textGreenColor:AppColor.whiteColor, TextAlign.center),
                    ),
                  ),*/
                  GestureDetector(
                    onTap: () {
                      vm.index = 1;
                      setState(() {
                        if(vm.controller.positions.isNotEmpty){
                          vm.controller.animateTo(
                            vm.controller.position.minScrollExtent,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 500),
                          );
                        }

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BoldText(
                          "Player Props",
                          13,
                          (vm.index == 1)
                              ? AppColor.textGreenColor
                              : AppColor.whiteColor,
                          TextAlign.center),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      vm.index = 2;
                      setState(() {
                        if(vm.controller.positions.isNotEmpty){
                          vm.controller.animateTo(
                            vm.controller.position.minScrollExtent,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 500),
                          );
                        }

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BoldText(
                          "Game Props",
                          13,
                          (vm.index == 2)
                              ? AppColor.textGreenColor
                              : AppColor.whiteColor,
                          TextAlign.center),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      vm.index = 3;
                      setState(() {
                        if(vm.controller.positions.isNotEmpty){
                          vm.controller.animateTo(
                            vm.controller.position.minScrollExtent,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 500),
                          );
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BoldText(
                          "Team Props",
                          13,
                          (vm.index == 3)
                              ? AppColor.textGreenColor
                              : AppColor.whiteColor,
                          TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (vm.index == 0)
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              color: AppColor.dialogBackgroundColor,
                              child: BoldText("Game Lines", 13,
                                  AppColor.whiteColor, TextAlign.center),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              color: AppColor.backColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CommonText("Spread", 11, AppColor.whiteColor,
                                      TextAlign.center),
                                  CommonText("ML", 11, AppColor.whiteColor,
                                      TextAlign.center),
                                  CommonText("Total", 11, AppColor.whiteColor,
                                      TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/dummy_team.png",
                                        height: 15,
                                        width: 15,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      BoldText("Lions", 13, AppColor.whiteColor,
                                          TextAlign.start)
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: CommonText("Name", 12,
                                        AppColor.whiteColor, TextAlign.start),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColor.hintColor)),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MediumText(
                                            "+6.5",
                                            12,
                                            AppColor.whiteColor,
                                            TextAlign.start),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        MediumText(
                                            "-105",
                                            12,
                                            AppColor.textGreenColor,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 45,
                                    height: 45,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColor.hintColor)),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MediumText(
                                            "+250",
                                            12,
                                            AppColor.textGreenColor,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 45,
                                    height: 45,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColor.hintColor)),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MediumText(
                                            "O 53.5",
                                            12,
                                            AppColor.whiteColor,
                                            TextAlign.start),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        MediumText(
                                            "-110",
                                            12,
                                            AppColor.textGreenColor,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/dummy_team.png",
                                        height: 15,
                                        width: 15,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      BoldText("Cheifs", 13,
                                          AppColor.whiteColor, TextAlign.start)
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: CommonText("Name", 12,
                                        AppColor.whiteColor, TextAlign.start),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColor.hintColor)),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MediumText(
                                            "+6.5",
                                            12,
                                            AppColor.whiteColor,
                                            TextAlign.start),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        MediumText(
                                            "-115",
                                            12,
                                            AppColor.textGreenColor,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 45,
                                    height: 45,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColor.hintColor)),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MediumText(
                                            "+310",
                                            12,
                                            AppColor.textGreenColor,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 45,
                                    height: 45,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColor.hintColor)),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MediumText(
                                            "U 53.5",
                                            12,
                                            AppColor.whiteColor,
                                            TextAlign.start),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        MediumText(
                                            "-110",
                                            12,
                                            AppColor.textGreenColor,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        color: AppColor.backColor,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoldText("To Score a Touchdown", 13,
                                AppColor.whiteColor, TextAlign.start),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.greenColor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: AppColor.backColor,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoldText("First to Score a Touchdown", 13,
                                AppColor.whiteColor, TextAlign.start),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.greenColor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: AppColor.backColor,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoldText("Most Passing Yards", 13,
                                AppColor.whiteColor, TextAlign.start),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.greenColor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: AppColor.backColor,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoldText("Most Rushing Yards", 13,
                                AppColor.whiteColor, TextAlign.start),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.greenColor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: AppColor.backColor,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoldText("Most Receptions", 13, AppColor.whiteColor,
                                TextAlign.start),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.greenColor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: AppColor.backColor,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoldText("Most Sacks", 13, AppColor.whiteColor,
                                TextAlign.start),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.greenColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
          if (vm.index == 1) PlayerPropsList(),
          if (vm.index == 2) GamePropsList(),
          if (vm.index == 3) TeamPropsList()
        ],
      ),
    );
  }

  Widget PlayerPropsList() {
    return Expanded(
        child: (vm.isLoading)
            ? Progress()
            : (vm.playersPropsData.isEmpty)
                ? NoData("No Data", "", context)
                : ListView.builder(
                    controller: vm.controller,
                    padding: EdgeInsets.zero,
                    itemCount: vm.playersPropsData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            color: AppColor.backColor,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: AppColor.fieldBack,
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10, bottom: 10),
                                    child: BoldText(
                                        "${vm.playersPropsData[index].bettingBetType}/${vm.playersPropsData[index].bettingPeriodType}",
                                        13,
                                        AppColor.whiteColor,
                                        TextAlign.start),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: AppColor.backColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // CommonText("Over/Under", 11, AppColor.whiteColor,
                                        //     TextAlign.center),
                                        // CommonText("10", 11, AppColor.whiteColor,
                                        //     TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: (vm.playersPropsData[index]
                                                          .playerImg
                                                          .toString() ==
                                                      "null")
                                                  ? Image.asset(
                                                      "assets/images/football_player.png")
                                                  : Image.network(
                                                      vm.playersPropsData[index]
                                                          .playerImg
                                                          .toString(),
                                                      fit: BoxFit.fill,
                                                    ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.40,
                                            child: BoldText(
                                                vm.playersPropsData[index]
                                                    .playerName
                                                    .toString(),
                                                13,
                                                AppColor.whiteColor,
                                                TextAlign.start),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 45,
                                        margin: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColor.hintColor)),
                                        padding: const EdgeInsets.all(2),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MediumText(
                                                "U ${(vm.playersPropsData[index].under.toString() == "null") ? "0" : vm.playersPropsData[index].under.toString()}",
                                                12,
                                                AppColor.textGreenColor,
                                                TextAlign.start),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 50,
                                        height: 45,
                                        margin: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColor.hintColor)),
                                        padding: const EdgeInsets.all(2),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MediumText(
                                                "O ${(vm.playersPropsData[index].over.toString() == "null") ? "0" : vm.playersPropsData[index].over.toString()}",
                                                12,
                                                AppColor.textGreenColor,
                                                TextAlign.start),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }));
  }

  Widget GamePropsList() {
    return Expanded(
        child: (vm.isLoading)
            ? Progress()
            : (vm.gamePropsData.isEmpty)
                ? NoData("No Data", "", context)
                : ListView.builder(
                    controller: vm.controller,
                    padding: EdgeInsets.zero,
                    itemCount: vm.gamePropsData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            color: AppColor.backColor,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: AppColor.fieldBack,
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10, bottom: 10),
                                    child: BoldText(
                                        "${vm.gamePropsData[index].bettingBetType}/${vm.gamePropsData[index].bettingPeriodType}",
                                        13,
                                        AppColor.whiteColor,
                                        TextAlign.start),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: AppColor.backColor,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // CommonText("Over/Under", 11, AppColor.whiteColor,
                                        //     TextAlign.center),
                                        // CommonText("10", 11, AppColor.whiteColor,
                                        //     TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: (widget.homeImg.toString() ==
                                                    "null")
                                                ? Image.asset(
                                                    "assets/images/dummy_team.png")
                                                : SvgPicture.network(
                                                    widget.homeImg.toString(),
                                                    height: 15,
                                                    width: 15,
                                                  ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          BoldText(
                                              widget.homeName.toString(),
                                              13,
                                              AppColor.whiteColor,
                                              TextAlign.start)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: SvgPicture.network(
                                              widget.awayImg.toString(),
                                              height: 15,
                                              width: 15,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          BoldText(
                                              widget.awayName.toString(),
                                              13,
                                              AppColor.whiteColor,
                                              TextAlign.start)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 45,
                                        margin: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColor.hintColor)),
                                        padding: const EdgeInsets.all(2),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MediumText(
                                                "U ${(vm.gamePropsData[index].under.toString() == "null") ? "0" : vm.gamePropsData[index].under.toString()}",
                                                12,
                                                AppColor.textGreenColor,
                                                TextAlign.start),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 50,
                                        height: 45,
                                        margin: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColor.hintColor)),
                                        padding: const EdgeInsets.all(2),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MediumText(
                                                "O ${(vm.gamePropsData[index].over.toString() == "null") ? "0" : vm.gamePropsData[index].over.toString()}",
                                                12,
                                                AppColor.textGreenColor,
                                                TextAlign.start),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }));
  }

  Widget TeamPropsList() {
    return Expanded(
        child: (vm.isLoading)
            ? Progress()
            : (vm.teamPropsData.isEmpty)
                ? NoData("No Data", "", context)
                : ListView.builder(
                    controller: vm.controller,
                    padding: EdgeInsets.zero,
                    itemCount: vm.teamPropsData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            color: AppColor.backColor,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: AppColor.fieldBack,
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10, bottom: 10),
                                    child: BoldText(
                                        "${vm.teamPropsData[index].bettingBetType.toString()}/${vm.teamPropsData[index].bettingPeriodType.toString()}",
                                        13,
                                        AppColor.whiteColor,
                                        TextAlign.start),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: AppColor.backColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // CommonText("Over/Under", 11, AppColor.whiteColor,
                                        //     TextAlign.center),
                                        // CommonText("10", 11, AppColor.whiteColor,
                                        //     TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: SvgPicture.network(
                                              vm.teamPropsData[index].teamImg
                                                  .toString(),
                                              height: 15,
                                              width: 15,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          BoldText(
                                              vm.teamPropsData[index].name
                                                  .toString(),
                                              13,
                                              AppColor.whiteColor,
                                              TextAlign.start)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 45,
                                        margin: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColor.hintColor)),
                                        padding: const EdgeInsets.all(2),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MediumText(
                                                "U ${(vm.teamPropsData[index].under.toString() == "null") ? "0" : vm.teamPropsData[index].under.toString()}",
                                                12,
                                                AppColor.textGreenColor,
                                                TextAlign.start),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 50,
                                        height: 45,
                                        margin: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColor.hintColor)),
                                        padding: const EdgeInsets.all(2),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MediumText(
                                                "O ${(vm.teamPropsData[index].over.toString() == "null") ? "0" : vm.teamPropsData[index].over.toString()}",
                                                12,
                                                AppColor.textGreenColor,
                                                TextAlign.start),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }));
  }

  Future<void> getData() async {
    await vm.getPlayerPropsData(context, widget.scoreId);
    setState(() {});
  }
}
