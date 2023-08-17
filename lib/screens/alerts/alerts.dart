import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common_widget.dart';
import '../alert_detail/alert_detail.dart';

class Alerts extends StatefulWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
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
            padding: const EdgeInsets.only(top: 35,bottom: 20,right: 20,left: 20),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: BoldText("Anni Alerts", 14, AppColor.whiteColor, TextAlign.center),
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,color: AppColor.greenColor,)),
              ],
            ),
          ),

          Expanded(child: ListView.builder(
            padding: EdgeInsets.zero,
              itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AlertDetail()));
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColor.hintColor)
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MediumText("Anni Alerts", 13, AppColor.whiteColor, TextAlign.start),
                        MediumText("Nov 3,2023", 10, AppColor.whiteColor, TextAlign.start),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    CommonText("Lorem ipsum dolor sit amet, consecrate sadipscing slitr,sed diam no", 10, AppColor.whiteColor, TextAlign.start),
                    SizedBox(
                      width: double.infinity,
                      child: BoldText("Read More", 12, AppColor.textGreenColor, TextAlign.end),
                    )
                  ],
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}