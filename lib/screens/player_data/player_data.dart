import 'package:anni_ai/screens/player_data/player_data_vm.dart';
import 'package:anni_ai/screens/player_data/roster/roster.dart';
import 'package:anni_ai/screens/player_data/table_list/table_list.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../apis/api_controller.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';
import 'career/career.dart';
import 'career/career_model.dart';
import 'graph/graph.dart';
import 'overview/overview.dart';

class PlayerData extends StatefulWidget {
  String playerId,fantasyPoints,keys,totalPlay;
  int tab;

  PlayerData({Key? key, required this.playerId, required this.fantasyPoints, required this.keys, required this.totalPlay, required this.tab}) : super(key: key);

  @override
  State<PlayerData> createState() => _PlayerDataState();
}

class _PlayerDataState extends State<PlayerData> with SingleTickerProviderStateMixin {
  var vm = PlayerDataVm();

  @override
  void initState() {
    super.initState();

    careerModel = CareerModel();

    vm.tabController = TabController(length: 5, vsync: this);

    Future.delayed(Duration.zero, () {
      showLoader(context);
    });

    vm.tabController.animateTo(widget.tab);
    var fPoints = double.parse(widget.fantasyPoints.toString());
    var tPlay = double.parse(widget.totalPlay.toString());

    if(widget.fantasyPoints.toString() == "null" || widget.fantasyPoints.toString() == "0"){
      vm.totalPoints = 0.0;
    }else{
      vm.totalPoints = (fPoints / tPlay);
    }

    print("QWERTYUIOP ${vm.totalPoints}");

    getData();
  }

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
               /* decoration: BoxDecoration(
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
                ),*/
              decoration:  BoxDecoration(
                  image:  DecorationImage(
                    image:  AssetImage(vm.teamCard),
                    fit: BoxFit.fill,
                  )
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
                              child: (vm.allTeamsData.photoUrl.toString() != "null")
                                  ?Image.network(
                                  vm.allTeamsData.photoUrl.toString(),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )
                                  :Image.asset(
                                "assets/images/user.png",
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
                                  BoldText("#${(vm.allTeamsData.number.toString() == "null")?"":vm.allTeamsData.number.toString()}", 10, AppColor.whiteColor,
                                      TextAlign.start),
                                  Container(
                                    height: 20,
                                    width: 1.2,
                                    color: AppColor.black,
                                  ),
                                  BoldText((vm.allTeamsData.position.toString() == "null")?"":vm.allTeamsData.position.toString(), 10, AppColor.whiteColor,
                                      TextAlign.start),
                                  Container(
                                    height: 20,
                                    width: 1.2,
                                    color: AppColor.black,
                                  ),
                                  BoldText((vm.allTeamsData.team.toString() == "null")?"":vm.allTeamsData.team.toString(), 10, AppColor.whiteColor,
                                      TextAlign.start),
                                ],
                              ),
                              BoldText((vm.allTeamsData.firstName.toString() == "null")?"":vm.allTeamsData.firstName.toString(), 15, AppColor.whiteColor,
                                  TextAlign.start),
                              BoldText((vm.allTeamsData.lastName.toString() == "null")?"":vm.allTeamsData.lastName.toString(), 19, AppColor.whiteColor,
                                  TextAlign.start),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonText("Age", 12, AppColor.whiteColor,
                                          TextAlign.start),
                                      BoldText((vm.allTeamsData.age.toString() == "null")?"":vm.allTeamsData.age.toString(), 19, AppColor.whiteColor, TextAlign.start)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonText("Height", 12,
                                          AppColor.whiteColor, TextAlign.start),
                                      BoldText((vm.allTeamsData.height.toString() == "null")?"":vm.allTeamsData.height.toString(), 19, AppColor.whiteColor, TextAlign.start)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonText("Weight", 12,
                                          AppColor.whiteColor, TextAlign.start),
                                      Row(
                                        children: [
                                          BoldText(
                                              (vm.allTeamsData.weight.toString() == "null")?"":vm.allTeamsData.weight.toString(),
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
                      height: 20,
                    ),
                    Row(
                      children: [
                        SvgPicture.network(
                          vm.allTeamsData.teamImg.toString(),
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        BoldText((vm.allTeamsData.teamName.toString() == "null")?"":vm.allTeamsData.teamName.toString(), 14, AppColor.whiteColor,
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
                    controller: vm.tabController,
                    isScrollable: true,
                    padding: EdgeInsets.zero,
                    labelColor: AppColor.greenColor,
                    unselectedLabelColor: Colors.grey,
                    dividerColor: Colors.green,
                    labelStyle: const TextStyle(fontSize: 14.0,fontFamily: 'Bold'),  //For Selected tab
                    unselectedLabelStyle: const TextStyle(fontSize: 14.0,fontFamily: 'Bold'), //For Un-selected Tabs
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
              Expanded(
                child: TabBarView(
                  controller: vm.tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Overview(vm,widget.fantasyPoints,vm.totalPoints,vm.allTeamsData.number.toString(),vm.allTeamsData.position.toString()),
                      TableList(playerId : vm.allTeamsData.playerID.toString()),
                      GraphTab(playerId : vm.allTeamsData.playerID.toString()),
                      Roster(teamId: vm.teamId,position : vm.allTeamsData.position.toString()),
                      Career(playerId : vm.allTeamsData.playerID.toString())
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {

    await vm.playerDetail(context,widget.playerId,widget.keys);
    await vm.playerNews(context,widget.playerId);
    await vm.ownershipDetail(context);
    setState(() {

    });
  }


}








