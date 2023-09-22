import 'dart:math';

import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/player_data/graph/graph_vm.dart';
import 'package:anni_ai/utils/color.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../dialogs/filter_graph.dart';
import '../../compare_player/compare_player.dart';

class GraphTab extends StatefulWidget {
  String playerId;

  GraphTab({
    Key? key,
    required this.playerId,
  }) : super(key: key);

  @override
  State<GraphTab> createState() => _GraphTabState();
}

class _GraphTabState extends State<GraphTab> {
  var vm = GraphVm();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () async {
                var data = await showDialog(
                    barrierColor: AppColor.dialogBackgroundColor,
                    context: context,
                    builder: (context) =>
                        FilterGraphDialog(vm: vm, playerId: widget.playerId));

                if (data == true) {
                  setState(() {});
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.backColor,
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BoldText("Yards", 13, AppColor.whiteColor,
                              TextAlign.start),
                          BoldText("per game", 13, AppColor.hintColor,
                              TextAlign.start)
                        ],
                      ),
                      Image.asset(
                        "assets/icons/filter.png",
                        height: 20,
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () async {
                var playerId = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ComparePlayer(vm: vm)));
                setState(() {});
                if (playerId != "") {
                  await vm.getOtherListWeek(context, vm.yearSelect, playerId);
                  setState(() {});
                }
              },
              child: Container(
                // color: AppColor.hintColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.backColor,
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(vm.comparePlayerName, 13,
                              AppColor.hintColor, TextAlign.start),
                        ],
                      ),
                      (vm.comparePlayerName == "Compare...")
                          ? Image.asset(
                              "assets/icons/search.png",
                              height: 20,
                              width: 20,
                            )
                          : GestureDetector(
                        onTap: (){
                          vm.comparePlayerName = "Compare...";
                          vm.otherData.clear();
                          setState(() {

                          });
                        },
                          child: Icon(Icons.close,color: AppColor.greenColor,)),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 300,
            child: (vm.isLoading == true)
                ? Progress()
                : LineChart(
                    LineChartData(
                      backgroundColor: Colors.black,
                      gridData: FlGridData(drawVerticalLine: false),
                      titlesData: FlTitlesData(
                          rightTitles: AxisTitles(),
                          topTitles: AxisTitles(),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 2,
                              getTitlesWidget: (value, meta) {
                                return vm.bottomTitleWidgets(
                                  value,
                                  meta,
                                  MediaQuery.of(context).size.width,
                                );
                              },
                              reservedSize: 20,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 25,
                              getTitlesWidget: vm.leftTitleWidgets,
                              reservedSize: 20,
                            ),
                          )),
                      lineBarsData: [
                        // The red line
                        LineChartBarData(
                          dotData: FlDotData(
                            show: false,
                          ),
                          spots: (vm.otherData.length > 1)
                              ? [
                                  if (vm.otherData.length >= 1)
                                    FlSpot(0, vm.otherData[0]),
                                  if (vm.otherData.length >= 2)
                                    FlSpot(1, vm.otherData[1]),
                                  if (vm.otherData.length >= 3)
                                    FlSpot(2, vm.otherData[2]),
                                  if (vm.otherData.length >= 4)
                                    FlSpot(3, vm.otherData[3]),
                                  if (vm.otherData.length >= 5)
                                    FlSpot(4, vm.otherData[4]),
                                  if (vm.otherData.length >= 6)
                                    FlSpot(5, vm.otherData[5]),
                                  if (vm.otherData.length >= 7)
                                    FlSpot(6, vm.otherData[6]),
                                  if (vm.otherData.length >= 8)
                                    FlSpot(7, vm.otherData[7]),
                                  if (vm.otherData.length >= 9)
                                    FlSpot(8, vm.otherData[8]),
                                  if (vm.otherData.length >= 10)
                                    FlSpot(9, vm.otherData[9]),
                                  if (vm.otherData.length >= 11)
                                    FlSpot(10, vm.otherData[10]),
                                  if (vm.otherData.length >= 12)
                                    FlSpot(11, vm.otherData[11]),
                                  if (vm.otherData.length >= 13)
                                    FlSpot(12, vm.otherData[12]),
                                  if (vm.otherData.length >= 14)
                                    FlSpot(13, vm.otherData[13]),
                                  if (vm.otherData.length >= 15)
                                    FlSpot(14, vm.otherData[14]),
                                  if (vm.otherData.length >= 16)
                                    FlSpot(15, vm.otherData[15]),
                                  if (vm.otherData.length >= 17)
                                    FlSpot(16, vm.otherData[16]),
                                  if (vm.otherData.length >= 18)
                                    FlSpot(17, vm.otherData[17]),
                                  if (vm.otherData.length >= 19)
                                    FlSpot(18, vm.otherData[18]),
                                ]
                              : [
                                  FlSpot(0, 0),
                                  FlSpot(1, 0),
                                  FlSpot(2, 0),
                                  FlSpot(3, 0),
                                  FlSpot(4, 0),
                                  FlSpot(5, 0),
                                  FlSpot(6, 0),
                                  FlSpot(7, 0),
                                  FlSpot(8, 0),
                                  FlSpot(9, 0),
                                  FlSpot(10, 0),
                                  FlSpot(11, 0),
                                  FlSpot(12, 0),
                                  FlSpot(13, 0),
                                  FlSpot(14, 0),
                                  FlSpot(15, 0),
                                  FlSpot(16, 0),
                                  FlSpot(17, 0),
                                  FlSpot(18, 0),
                                ],
                          isCurved: true,
                          barWidth: 3,
                          color: Colors.red,
                        ),
                        // The orange line
                        LineChartBarData(
                          dotData: FlDotData(
                            show: false,
                          ),
                          spots: (vm.otherData.length > 1)
                              ? [
                                  if (vm.selfData.length > 1)
                                    FlSpot(0, vm.selfData[0]),
                                  if (vm.selfData.length >= 2)
                                    FlSpot(1, vm.selfData[1]),
                                  if (vm.selfData.length >= 3)
                                    FlSpot(2, vm.selfData[2]),
                                  if (vm.selfData.length >= 4)
                                    FlSpot(3, vm.selfData[3]),
                                  if (vm.selfData.length >= 5)
                                    FlSpot(4, vm.selfData[4]),
                                  if (vm.selfData.length >= 6)
                                    FlSpot(5, vm.selfData[5]),
                                  if (vm.selfData.length >= 7)
                                    FlSpot(6, vm.selfData[6]),
                                  if (vm.selfData.length >= 8)
                                    FlSpot(7, vm.selfData[7]),
                                  if (vm.selfData.length >= 9)
                                    FlSpot(8, vm.selfData[8]),
                                  if (vm.selfData.length >= 10)
                                    FlSpot(9, vm.selfData[9]),
                                  if (vm.selfData.length >= 11)
                                    FlSpot(10, vm.selfData[10]),
                                  if (vm.selfData.length >= 12)
                                    FlSpot(11, vm.selfData[11]),
                                  if (vm.selfData.length >= 13)
                                    FlSpot(12, vm.selfData[12]),
                                  if (vm.selfData.length >= 14)
                                    FlSpot(13, vm.selfData[13]),
                                  if (vm.selfData.length >= 15)
                                    FlSpot(14, vm.selfData[14]),
                                  if (vm.selfData.length >= 16)
                                    FlSpot(15, vm.selfData[15]),
                                  if (vm.selfData.length >= 17)
                                    FlSpot(16, vm.selfData[16]),
                                  if (vm.selfData.length >= 18)
                                    FlSpot(17, vm.selfData[17]),
                                  if (vm.selfData.length >= 19)
                                    FlSpot(18, vm.selfData[18]),
                                ]
                              : [
                                  FlSpot(0, 0),
                                  FlSpot(1, 0),
                                  FlSpot(2, 0),
                                  FlSpot(3, 0),
                                  FlSpot(4, 0),
                                  FlSpot(5, 0),
                                  FlSpot(6, 0),
                                  FlSpot(7, 0),
                                  FlSpot(8, 0),
                                  FlSpot(9, 0),
                                  FlSpot(10, 0),
                                  FlSpot(11, 0),
                                  FlSpot(12, 0),
                                  FlSpot(13, 0),
                                  FlSpot(14, 0),
                                  FlSpot(15, 0),
                                  FlSpot(16, 0),
                                  FlSpot(17, 0),
                                  FlSpot(18, 0),
                                ],
                          isCurved: true,
                          barWidth: 3,
                          color: AppColor.greenColor,
                        ),
                        LineChartBarData(
                          dotData: FlDotData(
                            show: false,
                          ),
                          spots: [
                            FlSpot(0, 0),
                            FlSpot(1, 0),
                            FlSpot(2, 0),
                            FlSpot(3, 0),
                            FlSpot(4, 0),
                            FlSpot(5, 0),
                            FlSpot(6, 0),
                            FlSpot(7, 0),
                            FlSpot(8, 0),
                            FlSpot(9, 0),
                            FlSpot(10, 0),
                            FlSpot(11, 0),
                            FlSpot(12, 0),
                            FlSpot(13, 0),
                            FlSpot(14, 0),
                            FlSpot(15, 0),
                            FlSpot(16, 0),
                            FlSpot(17, 0),
                            FlSpot(18, 100),
                          ],
                          isCurved: true,
                          barWidth: 3,
                          color: Colors.transparent,
                        ),

                        // The blue line
                      ],
                    ),
                  ),
          ),
        )
      ],
    );
  }

  Future<void> getData() async {
    await vm.getTableListWeek(context, season, widget.playerId);

    setState(() {});
  }
}
