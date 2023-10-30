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
    otherData.clear();
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
                          BoldText(vm.categorySelect, 13, AppColor.whiteColor,
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
                if (vm.comparePlayerName != "Compare...") {
                  vm.comparePlayerName = "Compare...";
                  otherData.clear();
                  vm.otherPlayerId = "";
                  setState(() {});
                } else {
                  var playerId = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ComparePlayer(
                              vm: vm, playerId: widget.playerId)));
                  if (playerId != "") {
                    vm.otherPlayerId = playerId.toString();
                    await vm.getOtherListWeek(
                        context, vm.yearSelect, vm.otherPlayerId);
                    setState(() {});
                  }
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
                          SizedBox(
                            width: 90,
                            child: CommonText(vm.comparePlayerName, 13,
                                AppColor.hintColor, TextAlign.start),
                          ),
                        ],
                      ),
                      (vm.comparePlayerName == "Compare...")
                          ? Image.asset(
                              "assets/icons/search.png",
                              height: 20,
                              width: 20,
                            )
                          : GestureDetector(
                              onTap: () {
                                vm.comparePlayerName = "Compare...";
                                otherData.clear();
                                vm.otherPlayerId = "";
                                setState(() {});
                              },
                              child: Icon(
                                Icons.close,
                                color: AppColor.greenColor,
                              )),
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
                      gridData: const FlGridData(drawVerticalLine: false),
                      titlesData: FlTitlesData(
                          rightTitles: const AxisTitles(),
                          topTitles: const AxisTitles(),
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
                              interval: 50,
                              getTitlesWidget: vm.leftTitleWidgets,
                              reservedSize: 30,
                            ),
                          )),
                      lineBarsData: [
                        LineChartBarData(
                          dotData: const FlDotData(
                            show: false,
                          ),
                          spots: (otherData.length > 1)
                              ? [
                                  if (otherData.length >= 1)
                                    FlSpot(0, otherData[0]),
                                  if (otherData.length >= 2)
                                    FlSpot(1, otherData[1]),
                                  if (otherData.length >= 3)
                                    FlSpot(2, otherData[2]),
                                  if (otherData.length >= 4)
                                    FlSpot(3, otherData[3]),
                                  if (otherData.length >= 5)
                                    FlSpot(4, otherData[4]),
                                  if (otherData.length >= 6)
                                    FlSpot(5, otherData[5]),
                                  if (otherData.length >= 7)
                                    FlSpot(6, otherData[6]),
                                  if (otherData.length >= 8)
                                    FlSpot(7, otherData[7]),
                                  if (otherData.length >= 9)
                                    FlSpot(8, otherData[8]),
                                  if (otherData.length >= 10)
                                    FlSpot(9, otherData[9]),
                                  if (otherData.length >= 11)
                                    FlSpot(10, otherData[10]),
                                  if (otherData.length >= 12)
                                    FlSpot(11, otherData[11]),
                                  if (otherData.length >= 13)
                                    FlSpot(12, otherData[12]),
                                  if (otherData.length >= 14)
                                    FlSpot(13, otherData[13]),
                                  if (otherData.length >= 15)
                                    FlSpot(14, otherData[14]),
                                  if (otherData.length >= 16)
                                    FlSpot(15, otherData[15]),
                                  if (otherData.length >= 17)
                                    FlSpot(16, otherData[16]),
                                  if (otherData.length >= 18)
                                    FlSpot(17, otherData[17]),
                                  if (otherData.length >= 19)
                                    FlSpot(18, otherData[18]),
                                ]
                              : [
                                  const FlSpot(0, 0),
                                  const FlSpot(1, 0),
                                  const FlSpot(2, 0),
                                  const FlSpot(3, 0),
                                  const FlSpot(4, 0),
                                  const FlSpot(5, 0),
                                  const FlSpot(6, 0),
                                  const FlSpot(7, 0),
                                  const FlSpot(8, 0),
                                  const FlSpot(9, 0),
                                  const FlSpot(10, 0),
                                  const FlSpot(11, 0),
                                  const FlSpot(12, 0),
                                  const FlSpot(13, 0),
                                  const FlSpot(14, 0),
                                  const FlSpot(15, 0),
                                  const FlSpot(16, 0),
                                  const FlSpot(17, 0),
                                  const FlSpot(18, 0),
                                ],
                          dashArray: [10, 6],
                          isCurved: true,
                          barWidth: 3,
                          color: Colors.red,
                        ),
                        // The orange line
                        LineChartBarData(
                          dotData: const FlDotData(
                            show: false,
                          ),
                          spots: (selfData.length > 1)
                              ? [
                                  if (selfData.length > 1)
                                    FlSpot(0, selfData[0]),
                                  if (selfData.length >= 2)
                                    FlSpot(1, selfData[1]),
                                  if (selfData.length >= 3)
                                    FlSpot(2, selfData[2]),
                                  if (selfData.length >= 4)
                                    FlSpot(3, selfData[3]),
                                  if (selfData.length >= 5)
                                    FlSpot(4, selfData[4]),
                                  if (selfData.length >= 6)
                                    FlSpot(5, selfData[5]),
                                  if (selfData.length >= 7)
                                    FlSpot(6, selfData[6]),
                                  if (selfData.length >= 8)
                                    FlSpot(7, selfData[7]),
                                  if (selfData.length >= 9)
                                    FlSpot(8, selfData[8]),
                                  if (selfData.length >= 10)
                                    FlSpot(9, selfData[9]),
                                  if (selfData.length >= 11)
                                    FlSpot(10, selfData[10]),
                                  if (selfData.length >= 12)
                                    FlSpot(11, selfData[11]),
                                  if (selfData.length >= 13)
                                    FlSpot(12, selfData[12]),
                                  if (selfData.length >= 14)
                                    FlSpot(13, selfData[13]),
                                  if (selfData.length >= 15)
                                    FlSpot(14, selfData[14]),
                                  if (selfData.length >= 16)
                                    FlSpot(15, selfData[15]),
                                  if (selfData.length >= 17)
                                    FlSpot(16, selfData[16]),
                                  if (selfData.length >= 18)
                                    FlSpot(17, selfData[17]),
                                  if (selfData.length >= 19)
                                    FlSpot(18, selfData[18]),
                                ]
                              : [
                                  const FlSpot(0, 0),
                                  const FlSpot(1, 0),
                                  const FlSpot(2, 0),
                                  const FlSpot(3, 0),
                                  const FlSpot(4, 0),
                                  const FlSpot(5, 0),
                                  const FlSpot(6, 0),
                                  const FlSpot(7, 0),
                                  const FlSpot(8, 0),
                                  const FlSpot(9, 0),
                                  const FlSpot(10, 0),
                                  const FlSpot(11, 0),
                                  const FlSpot(12, 0),
                                  const FlSpot(13, 0),
                                  const FlSpot(14, 0),
                                  const FlSpot(15, 0),
                                  const FlSpot(16, 0),
                                  const FlSpot(17, 0),
                                  const FlSpot(18, 0),
                                ],
                          isCurved: true,
                          barWidth: 3,
                          color: AppColor.greenColor,
                        ),
                        LineChartBarData(
                          dotData: const FlDotData(
                            show: false,
                          ),
                          spots: [
                            const FlSpot(0, 0),
                            const FlSpot(1, 0),
                            const FlSpot(2, 0),
                            const FlSpot(3, 0),
                            const FlSpot(4, 0),
                            const FlSpot(5, 0),
                            const FlSpot(6, 0),
                            const FlSpot(7, 0),
                            const FlSpot(8, 0),
                            const FlSpot(9, 0),
                            const FlSpot(10, 0),
                            const FlSpot(11, 0),
                            const FlSpot(12, 0),
                            const FlSpot(13, 0),
                            const FlSpot(14, 0),
                            const FlSpot(15, 0),
                            const FlSpot(16, 0),
                            const FlSpot(17, 0),
                            const FlSpot(18, 100),
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
    await vm.getTableListWeek(context, vm.yearSelect, widget.playerId);

    setState(() {});
  }
}
