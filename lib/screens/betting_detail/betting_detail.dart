import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common_widget.dart';

class BettingDetail extends StatefulWidget {
  const BettingDetail({Key? key}) : super(key: key);

  @override
  State<BettingDetail> createState() => _BettingDetailState();
}

class _BettingDetailState extends State<BettingDetail> {
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
                    BoldText("Betting Data", 14, AppColor.whiteColor, TextAlign.start)
                  ],
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: RichText(text: TextSpan(
                      text: '8:21 PM Sep 7 ',
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: "Reg",
                          color: AppColor.whiteColor),
                      children: [
                        TextSpan(
                          text: '@KC',
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: "Bold",
                              color: AppColor.whiteColor),),
                      ])),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BoldText("Popular", 13, AppColor.textGreenColor, TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BoldText("All", 13, AppColor.whiteColor, TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BoldText("Game Props", 13, AppColor.whiteColor, TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BoldText("Team Props", 13, AppColor.whiteColor, TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BoldText("Player", 13, AppColor.whiteColor, TextAlign.center),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20,),

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
                            child: BoldText("Game Lines", 13, AppColor.whiteColor, TextAlign.center),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: AppColor.backColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CommonText("Spread", 11, AppColor.whiteColor, TextAlign.center),
                                CommonText("ML", 11, AppColor.whiteColor, TextAlign.center),
                                CommonText("total", 11, AppColor.whiteColor, TextAlign.center),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/instagram.png",height: 15,width: 15,),
                                    const SizedBox(width: 5,),
                                    BoldText("Lions", 13, AppColor.whiteColor, TextAlign.start)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: CommonText("Name", 12, AppColor.whiteColor, TextAlign.start),
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
                                      border: Border.all(color: AppColor.hintColor)
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MediumText("+6.5", 12, AppColor.whiteColor, TextAlign.start),
                                      const SizedBox(height: 2,),
                                      MediumText("-105", 12, AppColor.textGreenColor, TextAlign.start),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColor.hintColor)
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MediumText("+250", 12, AppColor.textGreenColor, TextAlign.start),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColor.hintColor)
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MediumText("O 53.5", 12, AppColor.whiteColor, TextAlign.start),
                                      const SizedBox(height: 2,),
                                      MediumText("-110", 12, AppColor.textGreenColor, TextAlign.start),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/instagram.png",height: 15,width: 15,),
                                    const SizedBox(width: 5,),
                                    BoldText("Cheifs", 13, AppColor.whiteColor, TextAlign.start)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: CommonText("Name", 12, AppColor.whiteColor, TextAlign.start),
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
                                      border: Border.all(color: AppColor.hintColor)
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MediumText("+6.5", 12, AppColor.whiteColor, TextAlign.start),
                                      const SizedBox(height: 2,),
                                      MediumText("-115", 12, AppColor.textGreenColor, TextAlign.start),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColor.hintColor)
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MediumText("+310", 12, AppColor.textGreenColor, TextAlign.start),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColor.hintColor)
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MediumText("U 53.5", 12, AppColor.whiteColor, TextAlign.start),
                                      const SizedBox(height: 2,),
                                      MediumText("-110", 12, AppColor.textGreenColor, TextAlign.start),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),),
                    const SizedBox(height: 20,),
                  ],
                ),

                Column(
                  children: [
                    Container(
                      color: AppColor.backColor,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText("To Score a Touchdown", 13, AppColor.whiteColor, TextAlign.start),
                          Icon(Icons.keyboard_arrow_down,color: AppColor.greenColor,)
                        ],
                      ),
                    ),
                    Container(
                      color: AppColor.backColor,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText("First to Score a Touchdown", 13, AppColor.whiteColor, TextAlign.start),
                          Icon(Icons.keyboard_arrow_down,color: AppColor.greenColor,)
                        ],
                      ),
                    ),
                    Container(
                      color: AppColor.backColor,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText("Most Passing Yards", 13, AppColor.whiteColor, TextAlign.start),
                          Icon(Icons.keyboard_arrow_down,color: AppColor.greenColor,)
                        ],
                      ),
                    ),
                    Container(
                      color: AppColor.backColor,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText("Most Rushing Yards", 13, AppColor.whiteColor, TextAlign.start),
                          Icon(Icons.keyboard_arrow_down,color: AppColor.greenColor,)
                        ],
                      ),
                    ),
                    Container(
                      color: AppColor.backColor,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText("Most Receptions", 13, AppColor.whiteColor, TextAlign.start),
                          Icon(Icons.keyboard_arrow_down,color: AppColor.greenColor,)
                        ],
                      ),
                    ),
                    Container(
                      color: AppColor.backColor,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText("Most Sacks", 13, AppColor.whiteColor, TextAlign.start),
                          Icon(Icons.keyboard_arrow_down,color: AppColor.greenColor,)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),

          
        ],
      ),
    );
  }
}
