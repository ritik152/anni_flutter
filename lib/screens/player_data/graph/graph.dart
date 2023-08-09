import 'package:anni_ai/utils/color.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../dialogs/filter_graph.dart';
import '../../compare_player/compare_player.dart';

class GraphTab extends StatefulWidget {
  const GraphTab({Key? key}) : super(key: key);

  @override
  State<GraphTab> createState() => _GraphTabState();
}

class _GraphTabState extends State<GraphTab> {

  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: GestureDetector(
              onTap: (){
                showDialog(
                    barrierColor: AppColor.dialogBackgroundColor,
                    context: context, builder: (context)=> const FilterGraphDialog());
              },
              child: Container(
                color: AppColor.backColor,
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText("Yards", 13, AppColor.whiteColor, TextAlign.start),
                        BoldText("per game", 13, AppColor.hintColor, TextAlign.start)
                      ],
                    ),
                    Image.asset("assets/icons/filter.png",height: 20,width: 20,)
                  ],
                ),
              ),
            )),
            Expanded(child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ComparePlayer()));
              },
              child: Container(
                color: AppColor.hintColor,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.backColor,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText("Compare...", 13, AppColor.hintColor, TextAlign.start),
                        ],
                      ),
                      Image.asset("assets/icons/search.png",height: 20,width: 20,)
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            //Initialize the spark charts widget
            child: SfSparkLineChart.custom(
              //Enable the trackball
              axisLineColor: AppColor.hintColor,
              trackball: const SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap),
              //Enable marker
              marker: const SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all),
              //Enable data label
              labelDisplayMode: SparkChartLabelDisplayMode.all,
              xValueMapper: (int index) => data[index].year,
              yValueMapper: (int index) => data[index].sales,
              dataCount: 5,
            ),
          ),
        )
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
