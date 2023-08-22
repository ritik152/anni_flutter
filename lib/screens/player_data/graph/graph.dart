import 'package:anni_ai/utils/color.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../dialogs/filter_graph.dart';
import '../../compare_player/compare_player.dart';

class GraphTab extends StatefulWidget {
   GraphTab({
    super.key,
    Color? line1Color1,
    Color? line1Color2,
    Color? line2Color1,
    Color? line2Color2,}) : line1Color1 = line1Color1 ?? Colors.orange,
        line1Color2 = line1Color2 ?? Colors.orange,
        line2Color1 = line2Color1 ?? Colors.orange,
        line2Color2 = line2Color2 ?? Colors.orange {
    minSpotX = 1;
    maxSpotX = 1;
    minSpotY = 1;
    maxSpotY = 1;

    
    for(var i = 0; i == 10; i++){
      maxSpotY = double.parse(i.toString());
    }
  }

   final Color line1Color1;
   final Color line1Color2;
   final Color line2Color1;
   final Color line2Color2;



   late double minSpotX;
   late double maxSpotX;
   late double minSpotY;
   late double maxSpotY;

  @override
  State<GraphTab> createState() => _GraphTabState();
}

class _GraphTabState extends State<GraphTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                showDialog(
                    barrierColor: AppColor.dialogBackgroundColor,
                    context: context,
                    builder: (context) => const FilterGraphDialog());
              },
              child: Container(
                color: AppColor.backColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(
                            "Yards", 13, AppColor.whiteColor, TextAlign.start),
                        BoldText(
                            "per game", 13, AppColor.hintColor, TextAlign.start)
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
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ComparePlayer()));

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
                          CommonText("Compare...", 13, AppColor.hintColor,
                              TextAlign.start),
                        ],
                      ),
                      Image.asset(
                        "assets/icons/search.png",
                        height: 20,
                        width: 20,
                      )
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
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                      color: AppColor.greenColor,
                      isCurved: false,
                      dotData: const FlDotData(
                        show: false,
                      ),
                      spots: [
                        const FlSpot(0, 1),
                        const FlSpot(1, 3),
                        const FlSpot(2, 10),
                        const FlSpot(3, 7),
                        const FlSpot(4, 12),
                        const FlSpot(5, 13),
                        const FlSpot(6, 17),
                        const FlSpot(7, 15),
                        const FlSpot(8, 20)
                      ]),
                ],
                gridData: const FlGridData(drawVerticalLine: false),
                titlesData: FlTitlesData(rightTitles: const AxisTitles(), topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return bottomTitleWidgets(
                          value,
                          meta,
                          MediaQuery.of(context).size.width,
                        );
                      },
                      reservedSize: 30,
                    ),
                  ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 38,
                      ),
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final style = TextStyle(
      color: Colors.white,
      fontFamily: 'Digital',
      fontSize: 18 * chartWidth / 500,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '1';
        break;
      case 1:
        text = '2';
        break;
      case 2:
        text = '3';
        break;
      case 3:
        text = '4';
        break;
      case 4:
        text = '5';
        break;
      case 5:
        text = '6';
        break;
      case 6:
        text = '7';
        break;
      case 7:
        text = '8';
        break;
      case 8:
        text = '9';
        break;
      case 9:
        text = '10';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    final intValue = reverseY(value, widget.minSpotY, widget.maxSpotY).toInt();

    if (intValue == (widget.maxSpotY + widget.minSpotY)) {
      return Text('', style: style);
    }

    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Text(
        intValue.toString(),
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }

  double reverseY(double y, double minX, double maxX) {
    return maxX;
  }
}
