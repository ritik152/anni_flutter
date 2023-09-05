import 'package:anni_ai/screens/alerts/alerts_vm.dart';
import 'package:flutter/material.dart';

import '../../apis/api_controller.dart';
import '../../utils/color.dart';
import '../../utils/common_widget.dart';
import '../alert_detail/alert_detail.dart';

class Alerts extends StatefulWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {

  var vm = AlertsVm();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   getData();
  }


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

          Expanded(child: (vm.isLoading)?Progress()
              :(alertsModel.body == null)
              ?NoData("No Data", "assets/images/no_data.png", context)
              :ListView.builder(
            padding: EdgeInsets.zero,
              itemCount: alertsModel.body!.length,
              itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AlertDetail(detailData : alertsModel.body![index])));
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MediumText((alertsModel.body![index].type == 1)
                            ?"Injury Report":(alertsModel.body![index].type == 2)
                            ?"Depth Chart Change!"
                            :"Anni Alerts", 13, AppColor.whiteColor, TextAlign.start),
                        MediumText(vm.changeFormat(alertsModel.body![index].jsonData!.updated.toString()), 10, AppColor.whiteColor, TextAlign.start),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    CommonText((alertsModel.body![index].type == 1)
                        ?alertsModel.body![index].jsonData!.name.toString()+ " (${alertsModel.body![index].jsonData!.position.toString()})"
                        :(alertsModel.body![index].type == 2)
                        ?"${alertsModel.body![index].jsonData!.name.toString()} (${alertsModel.body![index].jsonData!.position.toString()})"
                        :alertsModel.body![index].jsonData!.title.toString(), 10, AppColor.whiteColor, TextAlign.start),
                    const SizedBox(height: 10,),
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

  Future<void> getData() async {
    var data = await vm.getAlerts(context);

    setState(() {

    });
  }
}
