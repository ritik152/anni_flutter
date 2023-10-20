import 'package:anni_ai/screens/player_data/career/career_vm.dart';
import 'package:anni_ai/utils/all_keys.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../apis/api_controller.dart';
import '../../../utils/color.dart';

class Career extends StatefulWidget {
  String playerId, position;

  Career({Key? key, required this.playerId, required this.position})
      : super(key: key);

  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
  var vm = CareerVm();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: (vm.isLoading == true)
          ? SizedBox(
              width: MediaQuery.of(context).size.width, child: Progress())
          : (careerModel.body == null || careerModel.body!.isEmpty)
              ? NoDataText("No Data", context)
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        (widget.position == "QB")
                            ? Row(
                                children: [
                                  const SizedBox(
                                    width: 220,
                                  ),
                                  BoldText("Passing", 10, AppColor.whiteColor,
                                      TextAlign.start),
                                  const SizedBox(
                                    width: 200,
                                  ),
                                  BoldText("Rushing", 10, AppColor.whiteColor,
                                      TextAlign.start),
                                  const SizedBox(
                                    width: 190,
                                  ),
                                  BoldText("Receiving", 10, AppColor.whiteColor,
                                      TextAlign.start),
                                ],
                              )
                            : (widget.position == "RB")
                                ? Row(
                                    children: [
                                      const SizedBox(
                                        width: 220,
                                      ),
                                      BoldText("Rushing", 10,
                                          AppColor.whiteColor, TextAlign.start),
                                      const SizedBox(
                                        width: 200,
                                      ),
                                      BoldText("Receiving", 10,
                                          AppColor.whiteColor, TextAlign.start),
                                      const SizedBox(
                                        width: 190,
                                      ),
                                      BoldText("Passing", 10,
                                          AppColor.whiteColor, TextAlign.start),
                                    ],
                                  )
                                : (widget.position == "WR/TE")
                                    ? Row(
                                        children: [
                                          const SizedBox(
                                            width: 220,
                                          ),
                                          BoldText(
                                              "Receiving",
                                              10,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                          const SizedBox(
                                            width: 200,
                                          ),
                                          BoldText(
                                              "Rushing",
                                              10,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                          const SizedBox(
                                            width: 190,
                                          ),
                                          BoldText(
                                              "Passing",
                                              10,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          const SizedBox(
                                            width: 220,
                                          ),
                                          BoldText(
                                              "Receiving",
                                              10,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                          const SizedBox(
                                            width: 200,
                                          ),
                                          BoldText(
                                              "Rushing",
                                              10,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                          const SizedBox(
                                            width: 190,
                                          ),
                                          BoldText(
                                              "Passing",
                                              10,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                        ],
                                      ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //------------------------------------------------title---------------------------
                            const SizedBox(width: 20,),
                            Column(
                              children: [
                                const SizedBox(height: 3,),
                                CommonText("Yr", 10, AppColor.whiteColor, TextAlign.start),
                              ],
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 3,),
                                CommonText("Opp", 10, AppColor.whiteColor, TextAlign.start),
                              ],
                            ),
                            const SizedBox(width: 35,),


                            (widget.position == "QB")
                                ? Row(
                              children: [

                                //------------------------------------------------Passing---------------------------

                                Row(
                                  children: [
                                    const SizedBox(width: 10,),
                                    CommonText("ATT", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 33,
                                    ),
                                    CommonText("CMP", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 33,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 37,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 39,
                                    ),
                                    CommonText("INT", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Container(
                                      width: 1,
                                      color: AppColor.hintColor,
                                      height: 22,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),

                                //------------------------------------------------Rushing---------------------------

                                Row(
                                  children: [
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("YPC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),

                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 1,
                                      color: AppColor.hintColor,
                                      height: 22,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),

                                //------------------------------------------------Receiving---------------------------

                                Row(
                                  children: [
                                    CommonText("TAR", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    CommonText("REC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("YPC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),

                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Container(
                                      width: 1,
                                      color: AppColor.hintColor,
                                      height: 22,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),


                              ],
                            )
                                : (widget.position == "RB")
                                ? Row(
                              children: [

                                //------------------------------------------------Rushing---------------------------

                                Row(
                                  children: [
                                    const SizedBox(width: 13,),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("YPC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),

                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 1,
                                      color: AppColor.hintColor,
                                      height: 22,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),


                                //------------------------------------------------Receiving---------------------------

                                Row(
                                  children: [
                                    CommonText("TAR", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    CommonText("REC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("YPC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),

                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Container(
                                      width: 1,
                                      color: AppColor.hintColor,
                                      height: 22,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),


                                //------------------------------------------------Passing---------------------------

                                Row(
                                  children: [
                                    CommonText("ATT", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    CommonText("CMP", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 32,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("INT", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ],
                            )
                                : (widget.position == "WR/TE")
                                ? Row(
                              children: [
                                //------------------------------------------------Receiving---------------------------

                                Row(
                                  children: [
                                    const SizedBox(width: 8,),
                                    CommonText("TAR", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("REC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("YPC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),

                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Container(
                                      width: 1,
                                      color: AppColor.hintColor,
                                      height: 22,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),

                                //------------------------------------------------Rushing---------------------------

                                Row(
                                  children: [
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("YPC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),

                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 1,
                                      color: AppColor.hintColor,
                                      height: 22,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),

                                //------------------------------------------------Passing---------------------------

                                Row(
                                  children: [
                                    CommonText("ATT", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    CommonText("CMP", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 32,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("INT", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ],
                            )
                                : Row(
                              children: [
                                //------------------------------------------------Receiving---------------------------

                                Row(
                                  children: [
                                    const SizedBox(width: 8,),
                                    CommonText("TAR", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("REC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("YPC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),

                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Container(
                                      width: 1,
                                      color: AppColor.hintColor,
                                      height: 22,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),

                                //------------------------------------------------Rushing---------------------------

                                Row(
                                  children: [
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("YPC", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),

                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 1,
                                      color: AppColor.hintColor,
                                      height: 22,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),

                                //------------------------------------------------Passing---------------------------

                                Row(
                                  children: [
                                    CommonText("ATT", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    CommonText("CMP", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    CommonText(
                                        "YD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 32,
                                    ),
                                    CommonText(
                                        "TD", 10, AppColor.whiteColor, TextAlign.start),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CommonText("INT", 10, AppColor.whiteColor,
                                        TextAlign.start),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),

                        ListData(0),
                        ListData(1),
                        ListData(2),
                        ListData(3),
                        ListData(4),
                        ListData(5),
                        ListData(6),
                        ListData(7),
                        ListData(8),
                        ListData(9),
                        ListData(10),
                        ListData(11),
                        ListData(12),
                        ListData(13),
                        ListData(14),
                        ListData(15),
                        ListData(16),
                        ListData(17),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget ListData(int index) {
    return (careerModel.body!.length < index + 1)
        ? const SizedBox()
        : Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 23,
              ),
              SizedBox(
                  width: 33,
                  child: BoldText(careerModel.body![index].year.toString(), 11,
                      AppColor.whiteColor, TextAlign.start)),
              const SizedBox(
                width: 17,
              ),
              SizedBox(
                  width: 33,
                  child:
                      BoldText("", 11, AppColor.whiteColor, TextAlign.start)),
              const SizedBox(
                width: 9,
              ),

              (widget.position == "QB")
                  ? Row(
                children: [

                  //________________________________Passing____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingAttempts
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingCompletions
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingYards
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingTouchdowns
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingInterceptions
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 1,
                        color: AppColor.hintColor,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                  //________________________________Rushing____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingAttempts
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingYards
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel
                                  .body![index].rushing!.rushingYardsPerAttempt
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingTouchdowns
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 1,
                        color: AppColor.hintColor,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                  //________________________________Receiving____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receivingTargets
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receptions
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receivingYards
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!
                                  .receivingYardsPerReception
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel
                                  .body![index].receiving!.receivingTouchdowns
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 9,
                      ),
                      Container(
                        width: 1,
                        color: AppColor.hintColor,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                ],
              )
                  : (widget.position == "RB")
                  ? Row(
                children: [

                  //________________________________Rushing____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingAttempts
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingYards
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel
                                  .body![index].rushing!.rushingYardsPerAttempt
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingTouchdowns
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 1,
                        color: AppColor.hintColor,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),


                  //________________________________Receiving____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receivingTargets
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receptions
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receivingYards
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!
                                  .receivingYardsPerReception
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel
                                  .body![index].receiving!.receivingTouchdowns
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 9,
                      ),
                      Container(
                        width: 1,
                        color: AppColor.hintColor,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),


                  //________________________________Passing____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingAttempts
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingCompletions
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingYards
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingTouchdowns
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingInterceptions
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                    ],
                  ),
                ],
              )
                  : (widget.position == "WR/TE")
                  ? Row(
                children: [
                  //________________________________Receiving____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receivingTargets
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receptions
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receivingYards
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!
                                  .receivingYardsPerReception
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel
                                  .body![index].receiving!.receivingTouchdowns
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 9,
                      ),
                      Container(
                        width: 1,
                        color: AppColor.hintColor,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                  //________________________________Rushing____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingAttempts
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingYards
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel
                                  .body![index].rushing!.rushingYardsPerAttempt
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingTouchdowns
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 1,
                        color: AppColor.hintColor,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                  //________________________________Passing____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingAttempts
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingCompletions
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingYards
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingTouchdowns
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingInterceptions
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                    ],
                  ),
                ],
              )
                  : Row(
                children: [
                  //________________________________Receiving____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receivingTargets
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receptions
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!.receivingYards
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].receiving!
                                  .receivingYardsPerReception
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel
                                  .body![index].receiving!.receivingTouchdowns
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 9,
                      ),
                      Container(
                        width: 1,
                        color: AppColor.hintColor,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                  //________________________________Rushing____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingAttempts
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingYards
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel
                                  .body![index].rushing!.rushingYardsPerAttempt
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].rushing!.rushingTouchdowns
                                  .toString(),
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 1,
                        color: AppColor.hintColor,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                  //________________________________Passing____________________________

                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingAttempts
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingCompletions
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingYards
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingTouchdowns
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              color: AppColor.backColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: BoldText(
                              careerModel.body![index].passing!.passingInterceptions
                                  .toString(),
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(
                        width: 3,
                      ),
                    ],
                  ),
                ],
              ),


            ],
          );
  }

  Future<void> getData() async {
    SharedPreferences spf = await SharedPreferences.getInstance();

    if (widget.playerId.toString() == "null") {
      widget.playerId = spf.getString(AllKeys.playerId).toString();
    }

    var data = await vm.getTableListWeek(context, widget.playerId);

    setState(() {});
  }
}
