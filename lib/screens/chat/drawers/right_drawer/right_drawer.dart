import 'package:anni_ai/screens/chat/chat_vm.dart';
import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_widget.dart';
import '../../../player_data/player_data.dart';

class RightDrawer extends StatefulWidget {
  ChatVm vm;
  RightDrawer(this.vm, {Key? key}) : super(key: key);

  @override
  State<RightDrawer> createState() => _RightDrawerState();
}

class _RightDrawerState extends State<RightDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height,

      decoration: BoxDecoration(
        color: AppColor.black,
      ),
      child: Column(
        children: [
          //--------------------------------------Search--------------------------------
          Expanded(
            flex: 16,
            child:
            Column(
              children: [
                const SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.liteGrayColor,
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsets.only(right: 10,left: 10,top: 20),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: AppColor.whiteColor),
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search,color: AppColor.greenColor,),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        hintText: "Search a player..",
                        hintStyle: TextStyle(color: AppColor.hintColor)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 82,
            child: CustomScrollView(
                slivers : <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          margin: const EdgeInsets.only(bottom: 5),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BoldText("Trending Up", 14, AppColor.whiteColor, TextAlign.start),
                              BoldText("View All +", 14, AppColor.textGreenColor, TextAlign.start),
                            ],
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int indexList) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const PlayerData()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                            child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: MediumText("${indexList+1}", 15, AppColor.whiteColor, TextAlign.start),
                                    )),
                                Expanded(
                                  flex: 90,
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10,left: 10),
                                    decoration: BoxDecoration(
                                        color: AppColor.backTrendingColor,
                                        borderRadius: BorderRadius.circular(22),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 13),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 70,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(30),
                                                      child: Image.asset(
                                                        "assets/images/doctor_img.jpg",
                                                        height: 35,
                                                        width: 35,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Container(
                                                        margin: const EdgeInsets.only(top: 30, left: 7),
                                                        child: Image.asset(
                                                          "assets/images/star.png",
                                                          height: 25,
                                                          width: 25,
                                                        )),
                                                  ],
                                                ),
                                              const SizedBox(width: 10,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  BoldText("Malik Davis", 14, AppColor.whiteColor, TextAlign.start),
                                                  const SizedBox(height: 3,),
                                                  MediumText("PR - DAL", 11, AppColor.hintColor, TextAlign.start),
                                                  const SizedBox(height: 3,),
                                                  MediumText("Sun 1:00 PM @ NYG", 11, AppColor.hintColor, TextAlign.start),
                                                ],
                                              )
                                            ],)),
                                        Expanded(
                                            flex: 20,
                                            child: BoldText("+10.2k", 13, AppColor.textGreenColor, TextAlign.start),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 5,
                    ),
                  ),

                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return const SizedBox(height: 20,);
                      },
                      childCount: 1,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BoldText("Trending Down", 14, AppColor.whiteColor, TextAlign.start),
                              BoldText("View All +", 14, AppColor.textGreenColor, TextAlign.start),
                            ],
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int indexList) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                          child:  Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: MediumText("${indexList+1}", 15, AppColor.whiteColor, TextAlign.start),
                                  )),
                              Expanded(
                                flex: 90,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10,left: 10),
                                  decoration: BoxDecoration(
                                      color: AppColor.backTrendingColor,
                                      borderRadius: BorderRadius.circular(22),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 70,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(30),
                                              child: Image.asset("assets/images/doctor_img.jpg",height: 35,width: 35,fit: BoxFit.cover,),
                                            ),
                                            const SizedBox(width: 10,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                BoldText("James Robinson", 14, AppColor.whiteColor, TextAlign.start),
                                                const SizedBox(height: 5,),
                                                CommonText("PR - DAL", 12, AppColor.hintColor, TextAlign.start),
                                              ],
                                            )
                                          ],)),
                                      Expanded(
                                          flex: 20,
                                          child: BoldText("+10.2k", 13, AppColor.redColor, TextAlign.start),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: 5,
                    ),
                  ),

                ]
            ),
          ),
        ],
      ),
    );
  }
}
