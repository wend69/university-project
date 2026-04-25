import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ok/style/theme.dart';
import 'package:ok/api_service.dart';

class SimpleLineChart extends StatelessWidget {
  final double boxHeight;
  final double boxWidth;
  final AnalyticsRow data;

  const SimpleLineChart({
    super.key,
    required this.boxHeight,
    required this.boxWidth,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: MainTheme.primaryColor,
              barWidth: 3,
              spots: [
                const FlSpot(0, 1),
                const FlSpot(1, 2),
                FlSpot(2, data.audience.toDouble() / 100000), // SYNCED POINT
                const FlSpot(3, 4),
              ],
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [MainTheme.primaryColor.withValues(alpha: 0.3), Colors.transparent],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}