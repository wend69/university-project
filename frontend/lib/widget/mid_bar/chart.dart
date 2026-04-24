// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ok/style/theme.dart';

class SimpleLineChart extends StatelessWidget {
  final double boxHeight;
  final double boxWidth;
  const SimpleLineChart({
    super.key,
    required this.boxHeight,
    required this.boxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 4,
          minY: 0,
          maxY: 6,

          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: (value, meta) =>
                    Text("$value", style: TextStyle(color: Colors.grey)),
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(color: Colors.grey, fontSize: 12);

                  String label;
                  switch (value.toInt()) {
                    case 0:
                      label = 'Dec 21';
                      break;
                    case 1:
                      label = 'Dec 22';
                      break;
                    case 2:
                      label = 'Dec 23';
                      break;
                    case 3:
                      label = 'Dec 24';
                      break;
                    case 4:
                      label = 'Dec 25';
                      break;
                    default:
                      return const SizedBox();
                  }

                  return SideTitleWidget(
                    meta: meta,
                    space: 8,
                    child: Text(label, style: style),
                  );
                },
              ),
            ),
          ),

          borderData: FlBorderData(show: false),

          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.2),
                strokeWidth: 1,
              );
            },
          ),

          lineTouchData: LineTouchData(enabled: true),

          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              spots: const [
                FlSpot(0, 1),
                FlSpot(1, 3),
                FlSpot(2, 2),
                FlSpot(3, 5),
                FlSpot(4, 4),
              ],
              color: MainTheme().primaryColor,
              barWidth: 2,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    MainTheme().areaNeon.withOpacity(0.4),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            LineChartBarData(
              isCurved: true,
              spots: const [
                FlSpot(0, 0.7),
                FlSpot(1, 2),
                FlSpot(2, 1.5),
                FlSpot(3, 0.6),
                FlSpot(4, 3),
              ],
              color: Colors.red,
              barWidth: 2,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [Colors.red.withOpacity(0.3), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
