import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';


class FilterGraphDialog extends StatefulWidget {

  const FilterGraphDialog({Key? key}) : super(key: key);

  @override
  State<FilterGraphDialog> createState() => _FilterGraphDialog();

}

class _FilterGraphDialog extends State<FilterGraphDialog> {


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*100,
      padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black, //Colors.black.withOpacity(0.3),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(45),

        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,// To make the card compact
        children: <Widget>[
          const SizedBox(height: 10,),
          BoldText("Filter Graph", 17, AppColor.whiteColor, TextAlign.center),
          const SizedBox(height: 5,),
          CommonText("Select a variable to view.", 12, AppColor.whiteColor, TextAlign.center),
          const SizedBox(height: 20,),

          Row(
            children: [
              Image.asset("assets/icons/check.png",height: 20,width: 20,),
              const SizedBox(width: 5,),
              BoldText("Yards", 13, AppColor.whiteColor, TextAlign.start),
              const SizedBox(width: 3,),
              MediumText("per game", 10, AppColor.whiteColor, TextAlign.start),

            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Image.asset("assets/icons/uncheck_checkbox.png",height: 20,width: 20,),
              const SizedBox(width: 5,),
              BoldText("Touchdowns", 13, AppColor.whiteColor, TextAlign.start),
              const SizedBox(width: 3,),
              MediumText("per game", 10, AppColor.whiteColor, TextAlign.start),

            ],
          ),

          const SizedBox(height: 10,),
          Row(
            children: [
              Image.asset("assets/icons/uncheck_checkbox.png",height: 20,width: 20,),
              const SizedBox(width: 5,),
              BoldText("Receptions", 13, AppColor.whiteColor, TextAlign.start),
              const SizedBox(width: 3,),
              MediumText("per game", 10, AppColor.whiteColor, TextAlign.start),

            ],
          ),

          const SizedBox(height: 10,),
          Row(
            children: [
              Image.asset("assets/icons/uncheck_checkbox.png",height: 20,width: 20,),
              const SizedBox(width: 5,),
              BoldText("Targets", 13, AppColor.whiteColor, TextAlign.start),
              const SizedBox(width: 3,),
              MediumText("per game", 10, AppColor.whiteColor, TextAlign.start),

            ],
          ),

          const SizedBox(height: 10,),
          Row(
            children: [
              Image.asset("assets/icons/uncheck_checkbox.png",height: 20,width: 20,),
              const SizedBox(width: 5,),
              BoldText("Attempts", 13, AppColor.whiteColor, TextAlign.start),
              const SizedBox(width: 3,),
              MediumText("per game", 10, AppColor.whiteColor, TextAlign.start),

            ],
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
              child: BoldText("Year", 13, AppColor.fieldBackColor, TextAlign.start)),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BoldText("2023", 14, AppColor.textGreenColor, TextAlign.start),
                const SizedBox(width: 10,),
                BoldText("2022", 14, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 10,),
                BoldText("2021", 14, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 10,),
                BoldText("2020", 14, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 10,),
                BoldText("2019", 14, AppColor.whiteColor, TextAlign.start),
                const SizedBox(width: 10,),
                BoldText("2018", 14, AppColor.whiteColor, TextAlign.start),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          SizedBox(
            height: 50,
            width: 170,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.greenColor, backgroundColor: AppColor.greenColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // <-- Radius
                  ),
                ),
                child:  BoldText("Apply", 15, AppColor.black, TextAlign.center)),
          ),
          const SizedBox(height: 10,),
        ],
      ),

    );
  }

}
