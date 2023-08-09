import 'package:anni_ai/screens/player_data/player_data_vm.dart';
import 'package:anni_ai/screens/player_data/roster/roster.dart';
import 'package:anni_ai/screens/player_data/table_list/table_list.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import 'career/career.dart';
import 'graph/graph.dart';
import 'overview/overview.dart';

class PlayerData extends StatefulWidget {
  const PlayerData({Key? key}) : super(key: key);

  @override
  State<PlayerData> createState() => _PlayerDataState();
}

class _PlayerDataState extends State<PlayerData> {
  var vm = PlayerDataVm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: DefaultTabController(
        length: 5,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xff05116c),
                      Color(0xff000000),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.greenColor,
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 40,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/doctor_img.jpg",
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText("Free Agent", 10,
                                      AppColor.whiteColor, TextAlign.start),
                                  BoldText("#34", 10, AppColor.whiteColor,
                                      TextAlign.start),
                                  Container(
                                    height: 20,
                                    width: 1.2,
                                    color: AppColor.black,
                                  ),
                                  BoldText("RB", 10, AppColor.whiteColor,
                                      TextAlign.start),
                                  Container(
                                    height: 20,
                                    width: 1.2,
                                    color: AppColor.black,
                                  ),
                                  BoldText("DAL", 10, AppColor.whiteColor,
                                      TextAlign.start),
                                ],
                              ),
                              BoldText("Malik", 15, AppColor.whiteColor,
                                  TextAlign.start),
                              BoldText("Davis", 19, AppColor.whiteColor,
                                  TextAlign.start),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CommonText("Age", 12, AppColor.whiteColor,
                                          TextAlign.start),
                                      BoldText("24", 19, AppColor.whiteColor,
                                          TextAlign.start)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CommonText("Height", 12,
                                          AppColor.whiteColor, TextAlign.start),
                                      BoldText("5'11'", 19, AppColor.whiteColor,
                                          TextAlign.start)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CommonText("Weight", 12,
                                          AppColor.whiteColor, TextAlign.start),
                                      Row(
                                        children: [
                                          BoldText(
                                              "202",
                                              19,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                          CommonText(
                                              "lbs",
                                              12,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/star.png",
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        BoldText("Cowboys", 14, AppColor.whiteColor,
                            TextAlign.start),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  child: TabBar(
                    isScrollable: true,
                    padding: EdgeInsets.zero,
                    labelColor: AppColor.greenColor,
                    unselectedLabelColor: Colors.grey,
                    dividerColor: Colors.green,
                    indicatorWeight: 1,
                    indicatorColor: AppColor.greenColor,
                    tabs: const [
                      Tab(
                        text: "Overview",
                      ),
                      Tab(
                        text: "Table",
                      ),
                      Tab(
                        text: "Graph",
                      ),
                      Tab(
                        text: "Roster",
                      ),
                      Tab(
                        text: "Career",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Overview(),
                      TableList(),
                      GraphTab(),
                      Roster(),
                      Career()
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }


}








