import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/player_data/graph/graph_vm.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';


class FilterGraphDialog extends StatefulWidget {

  GraphVm vm;
  String playerId;

  FilterGraphDialog({Key? key, required this.vm, required this.playerId}) : super(key: key);

  @override
  State<FilterGraphDialog> createState() => _FilterGraphDialog();

}

class _FilterGraphDialog extends State<FilterGraphDialog> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dataSeasons();
  }



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
          SizedBox(
            height: 150,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.vm.category.length,
                itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  widget.vm.categoryClick = index;
                  widget.vm.categorySelect = widget.vm.category[index].toString();
                  setState(() {

                  });
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset((widget.vm.categoryClick != index)?"assets/icons/uncheck_checkbox.png":"assets/icons/check.png",height: 20,width: 20,),
                        const SizedBox(width: 5,),
                        BoldText(widget.vm.category[index].toString(), 13, AppColor.whiteColor, TextAlign.start),
                        const SizedBox(width: 3,),
                        MediumText("per game", 10, AppColor.whiteColor, TextAlign.start),

                      ],
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
              child: BoldText("Year", 13, AppColor.fieldBackColor, TextAlign.start)),
          const SizedBox(height: 10,),
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.vm.years.length,
                itemBuilder: (context,index){
              return Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      widget.vm.click = index;
                      widget.vm.yearSelect = widget.vm.years[index].toString();
                      setState(() {

                      });
                    },
                      child: BoldText(widget.vm.years[index].toString(), 14,(widget.vm.click == index)?AppColor.textGreenColor:AppColor.whiteColor, TextAlign.start)),
                  const SizedBox(width: 10,),
                ],
              );
            }),
          ),
          const SizedBox(height: 30,),
          SizedBox(
            height: 50,
            width: 170,
            child: ElevatedButton(
                onPressed: () async {
                  showLoader(context);
                  var data = await widget.vm.getTableListWeek(context, season, widget.playerId);

                  hideLoader(context);
                  if(data == true){
                    Navigator.pop(context,true);
                  }

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

  void dataSeasons() {
    var seasonL = int.parse(season.toString());
    for(var i = 0; i < 19; i++){
      var data = seasonL - i;
      widget.vm.years.add(data);
    }
    setState(() {

    });
  }

}
