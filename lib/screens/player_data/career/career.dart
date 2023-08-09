import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/color.dart';

class Career extends StatelessWidget {
  const Career({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.95,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                const SizedBox(width: 170,),
                BoldText("Fantasy", 10, AppColor.whiteColor,
                    TextAlign.start),
                const SizedBox(width: 35,),
                BoldText("Position Rank", 10, AppColor.whiteColor,
                    TextAlign.start),
                const SizedBox(width: 45,),
                BoldText("Receiving", 10, AppColor.whiteColor,
                    TextAlign.start),
                const SizedBox(width: 290,),
                BoldText("Rushing", 10, AppColor.whiteColor,
                    TextAlign.start),
                const SizedBox(width: 190,),
                BoldText("Returning", 10, AppColor.whiteColor,
                    TextAlign.start),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 20,),
                CommonText("Yr", 10, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 100,),
                CommonText("GM", 10, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 30,),
                CommonText("FPTS", 10, AppColor.whiteColor, TextAlign.start),

                const SizedBox(width: 25,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 25,),


                CommonText("STD", 10, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 30,),
                CommonText("PPR", 10, AppColor.whiteColor, TextAlign.start),

                const SizedBox(width: 25,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 25,),


                CommonText("TAR", 10, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 35,),
                CommonText("REC", 10, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 35,),
                CommonText("YD", 10, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 35,),
                CommonText("YPT", 10, AppColor.whiteColor, TextAlign.start),
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


                CommonText("KR", 10, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 30,),
                CommonText("KYRD", 10, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 30,),
                CommonText("PR", 10, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 30,),
                CommonText("PRYD", 10, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 30,),
                CommonText("PRT", 10, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 20,),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 20,),
                BoldText("2023", 11, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 25,),
                BoldText("DAL", 11, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 18,),
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
                        "0.00",
                        10,
                        AppColor.black,
                        TextAlign.center)),
                const SizedBox(width: 3,),
                Container(
                    height: 20,
                    width: 50,
                    margin: const EdgeInsets.only(top: 2),
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

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
                        10,
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
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
                        "1",
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
                        "1",
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "-",
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
                        "-",
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
                        "-",
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
                        "-",
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
                        "-",
                        10,
                        AppColor.whiteColor,
                        TextAlign.center)),
                const SizedBox(width: 3,),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 20,),
                BoldText("2023", 11, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 25,),
                BoldText("DAL", 11, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 18,),
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
                        "0.00",
                        10,
                        AppColor.black,
                        TextAlign.center)),
                const SizedBox(width: 3,),
                Container(
                    height: 20,
                    width: 50,
                    margin: const EdgeInsets.only(top: 2),
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

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
                        10,
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
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
                        "1",
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
                        "1",
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "-",
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
                        "-",
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
                        "-",
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
                        "-",
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
                        "-",
                        10,
                        AppColor.whiteColor,
                        TextAlign.center)),
                const SizedBox(width: 3,),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 20,),
                BoldText("2023", 11, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 25,),
                BoldText("DAL", 11, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 18,),
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
                        "0.00",
                        10,
                        AppColor.black,
                        TextAlign.center)),
                const SizedBox(width: 3,),
                Container(
                    height: 20,
                    width: 50,
                    margin: const EdgeInsets.only(top: 2),
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

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
                        10,
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
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
                        "1",
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
                        "1",
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "-",
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
                        "-",
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
                        "-",
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
                        "-",
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
                        "-",
                        10,
                        AppColor.whiteColor,
                        TextAlign.center)),
                const SizedBox(width: 3,),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 20,),
                BoldText("2023", 11, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 25,),
                BoldText("DAL", 11, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 18,),
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
                        "0.00",
                        10,
                        AppColor.black,
                        TextAlign.center)),
                const SizedBox(width: 3,),
                Container(
                    height: 20,
                    width: 50,
                    margin: const EdgeInsets.only(top: 2),
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

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
                        10,
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "1",
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
                        "1",
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
                        "1",
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
                        "1",
                        10,
                        AppColor.black,
                        TextAlign.center)),

                const SizedBox(width: 10,),
                Container(width: 1,color: AppColor.hintColor,height: 22,),
                const SizedBox(width: 10,),

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
                        "-",
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
                        "-",
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
                        "-",
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
                        "-",
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
                        "-",
                        10,
                        AppColor.whiteColor,
                        TextAlign.center)),
                const SizedBox(width: 3,),
              ],
            ),
            /*SizedBox(
              height: MediaQuery.of(context).size.height*0.45,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                  itemBuilder: (context,index){
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(width: 20,),
                      BoldText("2023", 11, AppColor.whiteColor, TextAlign.start),
                      const SizedBox(width: 25,),
                      BoldText("DAL", 11, AppColor.whiteColor, TextAlign.start),
                      const SizedBox(width: 18,),
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
                              "0.00",
                              10,
                              AppColor.black,
                              TextAlign.center)),
                      const SizedBox(width: 3,),
                      Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(top: 2),
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

                      const SizedBox(width: 10,),
                      Container(width: 1,color: AppColor.hintColor,height: 22,),
                      const SizedBox(width: 10,),

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
                              "1",
                              10,
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
                              "1",
                              10,
                              AppColor.black,
                              TextAlign.center)),

                      const SizedBox(width: 10,),
                      Container(width: 1,color: AppColor.hintColor,height: 22,),
                      const SizedBox(width: 10,),

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
                              "1",
                              10,
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
                              "1",
                              10,
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
                              "1",
                              10,
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
                              "1",
                              10,
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
                              "1",
                              10,
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
                              "1",
                              10,
                              AppColor.black,
                              TextAlign.center)),

                      const SizedBox(width: 10,),
                      Container(width: 1,color: AppColor.hintColor,height: 22,),
                      const SizedBox(width: 10,),

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
                              "1",
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
                              "1",
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
                              "1",
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
                              "1",
                              10,
                              AppColor.black,
                              TextAlign.center)),

                      const SizedBox(width: 10,),
                      Container(width: 1,color: AppColor.hintColor,height: 22,),
                      const SizedBox(width: 10,),

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
                              "-",
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
                              "-",
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
                              "-",
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
                              "-",
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
                              "-",
                              10,
                              AppColor.whiteColor,
                              TextAlign.center)),
                      const SizedBox(width: 3,),
                    ],
                  ),
                );
              }),
            )*/
          ],
        ),
      ),
    );
  }
}
