import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/player_data/table_list/table_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/all_keys.dart';
import '../../../utils/color.dart';
import '../../../utils/common_widget.dart';

class TableList extends StatefulWidget {
  String playerId;

  TableList({Key? key, required this.playerId}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {

  var vm = TableListVm();

  @override
  void initState() {
    super.initState();

    getSeason();


  }
  @override
  Widget build(BuildContext context) {
    return (vm.isLoading == true)?const SizedBox():(vm.seasonList.body == null)?NoData("No Data", "", context):CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () async {

                      if (vm.click == index) {
                        setState(() {
                          vm.click = -1;
                        });
                      }

                      else {
                        setState(() {
                          vm.isLoading2 = true;
                          vm.click = index;
                        });
                      }

                      await getData(vm.seasonList.body![index].season.toString());
                    },
                    child: Container(
                      color: AppColor.backColor,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText("${vm.seasonList.body![index].season.toString()} Regular Season", 12, AppColor.textGreenColor,
                              TextAlign.start),
                          Icon(
                            (vm.click == index)
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: AppColor.greenColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  if (vm.click == index && (vm.isLoading2 != true))
                    SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                      child:  (vm.isLoading2 == true)?SizedBox(
                          width: MediaQuery.of(context).size.width)
                          :(vm.tableModel.body == null || vm.tableModel.body!.isEmpty)
                          ?NoDataText("No Data", context)
                          :SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(height: 10,),
                              Row(children: [
                                  const SizedBox(width: 220,),
                                  BoldText("Receiving", 10, AppColor.whiteColor,
                                      TextAlign.start),
                                  const SizedBox(width: 200,),
                                  BoldText("Rushing", 10, AppColor.whiteColor,
                                      TextAlign.start),
                                  const SizedBox(width: 190,),
                                  BoldText("Passing", 10, AppColor.whiteColor,
                                      TextAlign.start),
                                ],),
                              const SizedBox(height: 10,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 20,),
                                  CommonText("Wk", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 35,),
                                  CommonText("Opp",  10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 35,),


                                  CommonText("TAR", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 35,),
                                  CommonText("REC", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 35,),
                                  CommonText("YD", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 35,),
                                  CommonText("YPC", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 35,),
                                  CommonText("TD", 10, AppColor.whiteColor, TextAlign.start),

                                  const SizedBox(width: 24,),
                                  Container(width: 1,color: AppColor.hintColor,height: 22,),
                                  const SizedBox(width: 30,),



                                  CommonText("TD", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 35,),
                                  CommonText("YD", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 35,),
                                  CommonText("YPC", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 35,),
                                  CommonText("TD", 10, AppColor.whiteColor, TextAlign.start),

                                  const SizedBox(width: 30,),
                                  Container(width: 1,color: AppColor.hintColor,height: 22,),
                                  const SizedBox(width: 30,),


                                  CommonText("ATT", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 30,),
                                  CommonText("CMP", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 30,),
                                  CommonText("YD", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 32,),
                                  CommonText("TD", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 35,),
                                  CommonText("INT", 10, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 20,),
                                ],
                              ),

                              ListData("1",0),
                              ListData("2",1),
                              ListData("3",2),
                              ListData("4",3),
                              ListData("5",4),
                              ListData("6",5),
                              ListData("7",6),
                              ListData("8",7),
                              ListData("9",8),
                              ListData("10",9),
                              ListData("11",10),
                              ListData("12",11),
                              ListData("13",12),
                              ListData("14",13),
                              ListData("15",14),
                              ListData("16",15),
                              ListData("17",16),
                              ListData("18",17),

                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
            childCount: vm.seasonList.body!.length,
          ),
        ),
      ],
    );
  }

  Widget ListData(String weeks, int index){
    return (vm.tableModel.body!.length < index+1)?const SizedBox():Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(width: 23,),
        SizedBox(
            width: 33,
            child: BoldText(weeks, 11, AppColor.whiteColor, TextAlign.start)),
        const SizedBox(width: 17,),
        SizedBox(
            width: 33,
            child: BoldText((vm.tableModel.body![index].jsonData!.opponent.toString() == "null")?"":vm.tableModel.body![index].jsonData!.opponent.toString(), 11, AppColor.whiteColor, TextAlign.start)),
        const SizedBox(width: 9,),

        //________________________________Receiving____________________________
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.greenColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
    (vm.tableModel.body![index].jsonData!.receivingTargets.toString() == "null")?"0":vm.tableModel.body![index].jsonData!.receivingTargets.toString(), 10,
                AppColor.black,
                TextAlign.center)),
        const SizedBox(width: 3,),
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.greenColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.receptions.toString() == "null")?"0":vm.tableModel.body![index].jsonData!.receptions.toString(), 10,
                AppColor.black,
                TextAlign.center)),
        const SizedBox(width: 3,),
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.greenColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.receivingYards.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.receivingYards.toString(), 10,
                AppColor.black,
                TextAlign.center)),
        const SizedBox(width: 3,),
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.greenColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.receivingYardsPerReception.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.receivingYardsPerReception.toString(), 10,
                AppColor.black,
                TextAlign.center)),
        const SizedBox(width: 3,),
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.greenColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.receivingTouchdowns.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.receivingTouchdowns.toString(),
                10,
                AppColor.black,
                TextAlign.center)),

        const SizedBox(width: 9,),
        Container(width: 1,color: AppColor.hintColor,height: 22,),
        const SizedBox(width: 10,),
        //________________________________Rushing____________________________

        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.redColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.rushingAttempts.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.rushingAttempts.toString(),
                10,
                AppColor.black,
                TextAlign.center)),
        const SizedBox(width: 3,),
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.redColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.rushingYards.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.rushingYards.toString(),
                10,
                AppColor.black,
                TextAlign.center)),
        const SizedBox(width: 3,),
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.redColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.rushingYardsPerAttempt.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.rushingYardsPerAttempt.toString(),
                10,
                AppColor.black,
                TextAlign.center)),
        const SizedBox(width: 3,),
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.redColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.rushingTouchdowns.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.rushingTouchdowns.toString(),
                10,
                AppColor.black,
                TextAlign.center)),

        const SizedBox(width: 10,),
        Container(width: 1,color: AppColor.hintColor,height: 22,),
        const SizedBox(width: 10,),

        //________________________________Passing____________________________


        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.backColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.passingAttempts.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.passingAttempts.toString(),
                10,
                AppColor.whiteColor,
                TextAlign.center)),
        const SizedBox(width: 3,),
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.backColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.passingCompletions.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.passingCompletions.toString(),
                10,
                AppColor.whiteColor,
                TextAlign.center)),
        const SizedBox(width: 3,),
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.backColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.passingYards.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.passingYards.toString(),
                10,
                AppColor.whiteColor,
                TextAlign.center)),
        const SizedBox(width: 3,),
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.backColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.passingTouchdowns.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.passingTouchdowns.toString(),
                10,
                AppColor.whiteColor,
                TextAlign.center)),
        const SizedBox(width: 3,),
        Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
                color: AppColor.backColor,
                borderRadius:
                BorderRadius.circular(
                    5)),
            padding:
            const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3),
            child: BoldText(
                (vm.tableModel.body![index].jsonData!.passingInterceptions.toString() == "null")?"0":
                vm.tableModel.body![index].jsonData!.passingInterceptions.toString(),
                10,
                AppColor.whiteColor,
                TextAlign.center)),
        const SizedBox(width: 3,),
      ],
    );
  }

  Future<void> getData(String season) async {

    await vm.getTableListWeek(context, season,widget.playerId);

    setState(() {

    });
  }

  Future<void> getSeason() async {
    SharedPreferences spf = await SharedPreferences.getInstance();

    if(widget.playerId.toString() == "null"){
      widget.playerId = spf.getString(AllKeys.playerId).toString();
    }
    await vm.getSeasonList(context,widget.playerId);

    if(spf.getString(AllKeys.selectedYear).toString() != "null" || spf.getString(AllKeys.selectedYear).toString() == ""){
      getData(vm.seasonSelect);
    }
    spf.setString(AllKeys.selectedYear, "");
    setState(() {

    });
  }
}