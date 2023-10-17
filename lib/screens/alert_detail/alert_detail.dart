import 'package:anni_ai/screens/alerts/alerts_model.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common_widget.dart';

class AlertDetail extends StatefulWidget {
  AlartData detailData;

  AlertDetail({Key? key, required this.detailData,}) : super(key: key);

  @override
  State<AlertDetail> createState() => _AlertDetailState();
}

class _AlertDetailState extends State<AlertDetail> {

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
            child: Stack(
              children: [

                SizedBox(
                  width: double.infinity,
                  child: BoldText("Anni Alerts", 15, AppColor.whiteColor, TextAlign.center),
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,color: AppColor.greenColor,)),
              ],
            )
          ),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColor.greenColor)
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoldText((widget.detailData.type == 1)?"Injury Report":(widget.detailData.type == 2)
                        ?"Depth Chart Change!"
                        :"Anni Alerts", 15, AppColor.whiteColor, TextAlign.start),
                    MediumText(dateFormat(widget.detailData.jsonData!.updated.toString()), 12, AppColor.whiteColor, TextAlign.start),
                  ],
                ),
                const SizedBox(height: 10,),
                CommonText((widget.detailData.type == 1)
                    ?"${widget.detailData.jsonData!.name.toString()} sustained a ${widget.detailData.jsonData!.bodyPart.toString()} injury during ${widget.detailData.jsonData!.practice.toString()} or during their matchup with ${widget.detailData.jsonData!.opponent.toString()}."
                    :(widget.detailData.type == 2)
                    ?"${widget.detailData.jsonData!.name.toString()} has been ${(widget.detailData.jsonData!.depthOrder == 1)?"Demoted":"Promoted"} to ${getOrdinal(int.parse(widget.detailData.jsonData!.depthOrder.toString()))} ${widget.detailData.jsonData!.position.toString()}"
                    :widget.detailData.jsonData!.content.toString(), 14, AppColor.whiteColor, TextAlign.start),
              ],
            ),
          )

        ],
      ),
    );
  }


}
