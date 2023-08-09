import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/common_widget.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                              BoldText("#84", 14, AppColor.whiteColor,
                                  TextAlign.start),
                              CommonText("RB", 10, AppColor.whiteColor,
                                  TextAlign.start),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText("#391", 14, AppColor.whiteColor,
                                  TextAlign.start),
                              CommonText("Overall", 10, AppColor.whiteColor,
                                  TextAlign.start),
                            ],
                          ),
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
                              BoldText("24%", 14, AppColor.whiteColor,
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
                              BoldText("1%", 14, AppColor.whiteColor,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              BoldText("2.87", 14, AppColor.whiteColor,
                                  TextAlign.start),
                              CommonText("PPR", 10, AppColor.whiteColor,
                                  TextAlign.start),
                            ],
                          ),
                          const SizedBox(
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                BoldText("2023 Season Outlook", 13, AppColor.whiteColor,
                    TextAlign.start),
                const SizedBox(
                  height: 10,
                ),
                CommonText(
                    "Lorem ipsum dolor sit amet, consecrate sadipscing slitr,sed diam no",
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        BoldText(
                            "Wk", 10, AppColor.whiteColor, TextAlign.start),
                        CommonText(
                            "@ SEA", 10, AppColor.whiteColor, TextAlign.start),
                        Image.asset(
                          "assets/images/star.png",
                          height: 10,
                          width: 10,
                        )
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
                          "Proj", 10, AppColor.whiteColor, TextAlign.start),
                    ),
                    Container(
                      width: 130,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: AppColor.backColor,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      padding:
                      const EdgeInsets.only(top: 13, left: 13, bottom: 13),
                      child: BoldText(
                          "Proj", 10, AppColor.whiteColor, TextAlign.start),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        BoldText(
                            "Wk", 10, AppColor.whiteColor, TextAlign.start),
                        CommonText(
                            "@ SEA", 10, AppColor.whiteColor, TextAlign.start),
                        Image.asset(
                          "assets/images/star.png",
                          height: 10,
                          width: 10,
                        )
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
                          "Proj", 10, AppColor.whiteColor, TextAlign.start),
                    ),
                    Container(
                      width: 130,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: AppColor.backColor,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      padding:
                      const EdgeInsets.only(top: 13, left: 13, bottom: 13),
                      child: BoldText(
                          "Proj", 10, AppColor.whiteColor, TextAlign.start),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        BoldText(
                            "Wk", 10, AppColor.whiteColor, TextAlign.start),
                        CommonText(
                            "@ SEA", 10, AppColor.whiteColor, TextAlign.start),
                        Image.asset(
                          "assets/images/star.png",
                          height: 10,
                          width: 10,
                        )
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
                          "Proj", 10, AppColor.whiteColor, TextAlign.start),
                    ),
                    Container(
                      width: 130,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: AppColor.backColor,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      padding:
                      const EdgeInsets.only(top: 13, left: 13, bottom: 13),
                      child: BoldText(
                          "Proj", 10, AppColor.whiteColor, TextAlign.start),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        BoldText(
                            "Wk", 10, AppColor.whiteColor, TextAlign.start),
                        CommonText(
                            "@ SEA", 10, AppColor.whiteColor, TextAlign.start),
                        Image.asset(
                          "assets/images/star.png",
                          height: 10,
                          width: 10,
                        )
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
                          "Proj", 10, AppColor.whiteColor, TextAlign.start),
                    ),
                    Container(
                      width: 130,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: AppColor.backColor,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      padding:
                      const EdgeInsets.only(top: 13, left: 13, bottom: 13),
                      child: BoldText(
                          "Proj", 10, AppColor.whiteColor, TextAlign.start),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        BoldText(
                            "Wk", 10, AppColor.whiteColor, TextAlign.start),
                        CommonText(
                            "@ SEA", 10, AppColor.whiteColor, TextAlign.start),
                        Image.asset(
                          "assets/images/star.png",
                          height: 10,
                          width: 10,
                        )
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
                          "Proj", 10, AppColor.whiteColor, TextAlign.start),
                    ),
                    Container(
                      width: 130,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: AppColor.backColor,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      padding:
                      const EdgeInsets.only(top: 13, left: 13, bottom: 13),
                      child: BoldText(
                          "Proj", 10, AppColor.whiteColor, TextAlign.start),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}