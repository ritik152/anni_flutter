import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/common_widget.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  var click = -1;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (click == index) {
                        setState(() {
                          click = -1;
                        });
                      } else {
                        setState(() {
                          click = index;
                        });
                      }
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
                          BoldText("2022 Playoffs", 12, AppColor.textGreenColor,
                              TextAlign.start),
                          Icon(
                            (click == index)
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: AppColor.greenColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  if (click == index)
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        Expanded(
                          child: BoldText("Fantasy", 10, AppColor.whiteColor,
                              TextAlign.start),
                        ),
                        Expanded(
                          child: BoldText("Rushing", 10, AppColor.whiteColor,
                              TextAlign.start),
                        ),
                      ],
                    ),
                  if (click == index)
                    const SizedBox(
                      height: 10,
                    ),
                  if (click == index)
                    Container(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 27,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                CommonText(
                                    "Wk",
                                    10,
                                    AppColor.whiteColor,
                                    TextAlign.start),
                                CommonText(
                                    "Opp",
                                    10,
                                    AppColor.whiteColor,
                                    TextAlign.start),
                              ],
                            ),
                          ),
                          const SizedBox(width: 7.5,),
                          Container(width: 1,color: AppColor.hintColor,height: 22,),
                          const SizedBox(width: 10,),
                          Expanded(
                            flex: 35,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 3),
                                      child: CommonText(
                                          "FPTS",
                                          10,
                                          AppColor.whiteColor,
                                          TextAlign.center)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 3),
                                      child: CommonText(
                                          "SNP%",
                                          10,
                                          AppColor.whiteColor,
                                          TextAlign.center)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(

                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 3),
                                      child: CommonText(
                                          "RANK",
                                          10,
                                          AppColor.whiteColor,
                                          TextAlign.center)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Container(width: 1,color: AppColor.hintColor,height: 22,),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 20,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 3),
                                      child: CommonText(
                                          "ATT",
                                          10,
                                          AppColor.whiteColor,
                                          TextAlign.center)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 3),
                                      child: CommonText(
                                          "Y",
                                          10,
                                          AppColor.whiteColor,
                                          TextAlign.center)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (click == index)
                    SizedBox(
                        height: 200,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 27,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BoldText(
                                              "WC",
                                              10,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                          BoldText(
                                              "TB",
                                              10,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 7.5,),
                                    Container(width: 1,color: AppColor.hintColor,height: 22,),
                                    const SizedBox(width: 10,),
                                    Expanded(
                                      flex: 35,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: AppColor.whiteColor,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5)),
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 5,
                                                    vertical: 3),
                                                child: BoldText(
                                                    "0.00",
                                                    10,
                                                    AppColor.black,
                                                    TextAlign.center)),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Container(
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
                                                    "1",
                                                    10,
                                                    AppColor.black,
                                                    TextAlign.center)),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Container(
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
                                                    "-",
                                                    10,
                                                    AppColor.whiteColor,
                                                    TextAlign.center)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Container(width: 1,color: AppColor.hintColor,height: 22,),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 20,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Container(
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
                                                    "0",
                                                    10,
                                                    AppColor.black,
                                                    TextAlign.center)),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Container(
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
                                                    "-",
                                                    10,
                                                    AppColor.whiteColor,
                                                    TextAlign.center)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })),
                ],
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}