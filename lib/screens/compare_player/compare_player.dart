import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common_widget.dart';

class ComparePlayer extends StatefulWidget {
  const ComparePlayer({Key? key}) : super(key: key);

  @override
  State<ComparePlayer> createState() => _ComparePlayerState();
}

class _ComparePlayerState extends State<ComparePlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.backColor,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
            ),
            padding: const EdgeInsets.only(top: 50,bottom: 20,right: 20,left: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: BoldText("Compare a Player", 14, AppColor.whiteColor, TextAlign.center),
                    ),
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios,color: AppColor.greenColor,)),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.liteGrayColor,
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsets.only(top: 20),
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
            child: ListView.builder(itemBuilder: (context,index){
              return Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "assets/images/doctor_img.jpg",
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 30, left: 10),
                            child: Image.asset(
                              "assets/images/star.png",
                              height: 25,
                              width: 25,
                            )),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BoldText("Malik Davis", 15, AppColor.whiteColor, TextAlign.start)
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
